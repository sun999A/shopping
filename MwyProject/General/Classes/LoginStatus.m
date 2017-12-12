//
//  LoginStatus.m
//  LifeServices
//
//  Created by Snail iOS on 16/3/25.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import "LoginStatus.h"

@implementation LoginStatus
+ (LoginStatus *)defaultLoginStatus{
    static LoginStatus *loginStatus = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loginStatus = [[LoginStatus alloc] init];
    });
    return loginStatus;
    
}

/** 是否在线 **/
-(BOOL)isLogin
{
    if ([_msg isEqualToString:@"登录成功"] && [SessionUtil sharedSession].isLogin) {
        return YES;
    }
    return NO;
}

@end
