//
//  LoginStatus.h
//  LifeServices
//
//  Created by Snail iOS on 16/3/25.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginStatus : NSObject

@property(nonatomic,strong)NSString *msg;
@property(nonatomic,assign)NSInteger cartId;

+ (LoginStatus *)defaultLoginStatus;
/** 是否在线 **/
-(BOOL)isLogin;


@end
