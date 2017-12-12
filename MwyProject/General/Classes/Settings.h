//
//  Settings.h
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Settings : NSObject

// 立刻保存
+(void)save;

+(id)Get:(NSString*)key;
+(void)Set:(NSString*)key value:(id)value;

+(NSInteger)GetInt:(NSString*)key;
+(void)SetInt:(NSString*)key value:(NSInteger)value;

+(void)SetDouble:(NSString*)key value:(double)value;
+(double)GetDouble:(NSString*)key;

+(long)GetLong:(NSString*)key;
+(void)SetLong:(NSString*)key value:(long)value;


@end
