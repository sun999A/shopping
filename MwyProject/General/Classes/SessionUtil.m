//
//  SessionUtil.m
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//

#import "SessionUtil.h"
#import "Settings.h"

static SessionUtil* _g;

@implementation SessionUtil

+(SessionUtil*)sharedSession
{
    if(_g == nil)
    {
        _g = [[SessionUtil alloc] init];
    }
    
    return _g;
}

-(id)init
{
    self = [super init];
    
    if(self)
    {
        [self clearSession];
        [self loadSessionFromSetting];
    }
    
    return self;
}



/** 
 将内存中的数值保存到本地存储中。
 调用方法：[SessionUtil g].sex = @"男"; [[SessionUtil g] updateToSettings];
 **/
-(void)updateToSettings
{
    // 将数据保存到客户端本地
    [Settings Set:@"contact" value:self.contact];
    [Settings Set:@"headImg" value:self.headImg];
    [Settings SetInt:@"sex" value:self.sex];
    [Settings Set:@"password" value:self.password];
    [Settings Set:@"realName" value:self.realName];
    [Settings SetInt:@"id" value:self.userId];
    
    [Settings Set:@"variable" value:self.variable];
    [Settings Set:@"name" value:self.name];
    [Settings SetInt:@"villageId" value:self.villageId];
    [Settings SetInt:@"typeId" value:self.typeId];
    [Settings save]; // 立刻保存
    // 刷新session
    [self loadSessionFromSetting];
}

/** 退出登录 **/
-(void)logout
{
    [self clearSession];
    [self updateToSettings];
}

/** 是否在线 **/
-(BOOL)isLogin
{
    return self.userId > 0 ? YES : NO;
}

#pragma mark private method
// 清空session
-(void)clearSession
{
    _userId      = 0;
    //_contact    = @"";
    _headImg=@"";
    _sex = -1;
    _password = @"";
    _realName= @"";
    //_address = @"";
}

// 从setting中加载数据到session
-(void)loadSessionFromSetting
{
    [self clearSession];
    
    _userId      = [Settings GetInt:@"id"];
    _contact    = [Settings Get:@"contact"];
    _realName = [Settings Get:@"realName"];
    _headImg   = [Settings Get:@"headImg"];
    _sex = [Settings GetInt:@"sex"];
    _password = [Settings Get:@"password"];
    
    _variable   = [Settings Get:@"variable"];
    _name = [Settings Get:@"name"];
    _villageId = [Settings GetInt:@"villageId"];
    _typeId = [Settings GetInt:@"typeId"];
}


@end
