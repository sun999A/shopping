//
//  SessionUtil.h
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface SessionUtil : NSObject




/** 
 用户ID
 **/
@property(nonatomic,assign)NSInteger userId;

/** 
 手机号码 
 **/
@property(nonatomic,strong)NSString *contact;

/**
 头像domain
 **/
@property(nonatomic,strong)NSString *realName;

/**
 头像 
 **/
@property(nonatomic,strong)NSString *headImg;

/** 
 性别 
 **/
@property(nonatomic,assign)NSInteger sex;

//密码
@property(nonatomic,strong)NSString *password;

//小区变量
@property(nonatomic,strong)NSString *variable;
@property(nonatomic,assign)NSInteger villageId;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger typeId;
+(SessionUtil*)sharedSession;

// 登录：存储用户信息到客户端
//-(void)saveData:(NBUserInfoModel *)user;

/**
 将内存中的数值保存到本地存储中。
 调用方法：[SessionUtil sharedSession].sex = @"男"; [[SessionUtil g] updateToSettings];
 **/
-(void)updateToSettings;
// 从setting中加载数据到session
-(void)loadSessionFromSetting;

// 是否已经登录
-(BOOL)isLogin;

// 注销：清空客户端的用户信息
-(void)logout;

// 当前的ViewController
@property(nonatomic, strong) UIViewController *currentViewController;


@end
