//
//  LoginManager.h
//  testBtnCategory
//
//  Created by 福利郑 on 2019/3/15.
//  Copyright © 2019 福利郑. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^CheckLoginSuccess)(void);

@interface LoginManager : NSObject
+ (instancetype)shareInstace;
-(void)checkLoginSuccess:(CheckLoginSuccess)checkLoginSuccess;
@end

NS_ASSUME_NONNULL_END
