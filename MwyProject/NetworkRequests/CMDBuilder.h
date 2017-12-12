//
//  CMDBuilder.h
//  Collector
//
//  Created by kunhong on 14-8-21.
//  Copyright (c) 2014年 kunhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMDBuilder : NSObject

+(NSMutableDictionary *) GetCMDUrlByPost:(NSString *)cmd args:(NSMutableDictionary *)args;
@end
