//
//  LoginManager.m
//  testBtnCategory
//
//  Created by 福利郑 on 2019/3/15.
//  Copyright © 2019 福利郑. All rights reserved.
//

#import "LoginManager.h"

@implementation LoginManager

+ (instancetype)shareInstace{
    static LoginManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LoginManager alloc] init];
    });
    return instance;
}

-(void)checkLoginSuccess:(CheckLoginSuccess)checkLoginSuccess{
    
    checkLoginSuccess();
    NSLog(@"------checkLoginSuccess:-------");
}


@end
