//
//  UIButton+Extension.m
//  testBtnCategory
//
//  Created by 福利郑 on 2019/3/15.
//  Copyright © 2019 福利郑. All rights reserved.
//

#import "UIButton+Extension.h"
#import "LoginManager.h"
#import <objc/runtime.h>
#import <objc/message.h>

static const NSString *selectorKey = @"selectorKey"; //selector的key
static const NSString *targetKey = @"targetKey"; //target的key
static const NSString *checkLoginKey = @"checkLoginKey"; //checkLogin的key

@implementation UIButton (Extension)

-(void)setObjClass:(id)objClass{
     objc_setAssociatedObject(self, &selectorKey,objClass, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)objClass{
    return objc_getAssociatedObject(self, &targetKey);
}


-(void)setCheckLogin:(BOOL)checkLogin{
     objc_setAssociatedObject(self, &checkLoginKey, [NSNumber numberWithBool:checkLogin], OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)checkLogin{
    return [objc_getAssociatedObject(self, &checkLoginKey) boolValue];
}


- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.checkLogin)
    {
        self.selector = NSStringFromSelector(action);
        NSLog(@"%@",self);
        NSLog(@"%@",NSStringFromSelector(action));
        self.objClass = target;
        [self checkIsLogin:action];
    }
    else
    {
        [super sendAction:action to:target forEvent:event];
    }
}
- (void)checkIsLogin:(SEL)action
{
    __weak typeof(self) weakSelf = self;
    [[LoginManager shareInstace] checkLoginSuccess:^{
        SEL sel = action;
        if ([weakSelf.objClass respondsToSelector:sel])
        {
            if ([weakSelf.selector hasSuffix:@":"])
            {
                objc_msgSend(weakSelf.objClass,sel,self);
            } else
            {
                objc_msgSend(weakSelf.objClass,sel);
            }
        }
        NSLog(@"checkLoginSuccess:");
    }];
    
}

//-(void)setSelector:(NSString *)selector{
//    objc_setAssociatedObject(self, &selectorKey,selector, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//-(NSString *)selector{
//    return objc_getAssociatedObject(self, &selectorKey);
//}

//-(void)setSelector:(SEL)selector{
//    NSString *selectorStr = NSStringFromSelector(selector);
//    objc_setAssociatedObject(self, &selectorKey,selectorStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//-(SEL)selector{
//    NSString *selectorStr  = objc_getAssociatedObject(self, &selectorKey);
//    return  NSSelectorFromString(selectorStr);
//}

@end
