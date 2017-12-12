//
//  Settings.m
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//

#import "Settings.h"

@implementation Settings

// 立刻保存
+(void)save
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//============

+(id)Get:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}
+(void)Set:(NSString*)key value:(id)value
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
}

+(void)SetInt:(NSString*)key value:(NSInteger)value
{
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
}

+(NSInteger)GetInt:(NSString*)key
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

+(void)SetLong:(NSString*)key value:(long)value
{
    //NSString *strValue = [NSNumber numberWithLong:value];
    NSNumber *strValue=[NSNumber numberWithLong:value];
    [[NSUserDefaults standardUserDefaults] setObject:strValue forKey:key];
}
+(long)GetLong:(NSString*)key
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] integerValue];
}

+(void)SetDouble:(NSString*)key value:(double)value
{
    [[NSUserDefaults standardUserDefaults] setDouble:value forKey:key];
}

+(double)GetDouble:(NSString*)key
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] doubleValue];
}


@end
