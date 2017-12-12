//
//  CMDBuilder.m
//  Collector
//
//  Created by kunhong on 14-8-21.
//  Copyright (c) 2014年 kunhong. All rights reserved.
//

#import "CMDBuilder.h"


@implementation CMDBuilder

//
// 具体的url拼装逻辑，需参考具体的接口文档
//

+(NSMutableDictionary *)GetCMDUrlByPost:(NSString *)cmd args:(NSMutableDictionary *)args
{
    
    NSMutableString *retUrl = [NSMutableString stringWithString:URL_API_DOMAIN]; // url+系统参数
    [retUrl appendString:cmd];
    NSLog(@"\r\nURL ＝ %@\r\n", retUrl);
    
    
	NSLog(@"\r\nPOST DATA ＝ %@\r\n", args);
    
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc]init];
    [result setObject:retUrl forKey:@"url"];
    [result setObject:args forKey:@"postdata"];
    
	return result;
}

@end
