//
//  NSDictionary+String.m
//  Collector
//
//  Created by kunhong on 14-8-21.
//  Copyright (c) 2014年 kunhong. All rights reserved.
//

#import "NSDictionary+String.h"

@implementation NSDictionary (String)

-(NSString*)stringForKey:(NSString*)key
{
    NSString *value = [self objectForKey:key];
    if (!value)
    {
        value = @"";
    }
    if ([value isEqual:[NSNull null]]) {
        value=@"";
    }
    return [NSString stringWithFormat:@"%@",value];
}


@end
