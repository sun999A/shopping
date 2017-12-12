//
//  RegexUtil.h
//  Collector
//
//  Created by alex on 9/12/14.
//  Copyright (c) 2014 kunhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegexUtil : NSObject

// 验证手机号码
+ (BOOL)validateMobile:(NSString *)mobileNum;

// 验证手机号码和固定电话
+ (BOOL)validateMobileOrPHS:(NSString *)number;


@end
