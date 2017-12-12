//
//  NetworkUtil.m
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//

#import <SystemConfiguration/SystemConfiguration.h>
#import <netdb.h>
#import "NetworkUtil.h"
#import "Reachability.h"


@implementation NetworkUtil



+(BOOL)isConnected
{
    struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	
	
	SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	SCNetworkReachabilityFlags flags;
    
	BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
	CFRelease(defaultRouteReachability);
	
	if (!didRetrieveFlags) {
		return NO;
	}
	
	BOOL isReachable = flags & kSCNetworkFlagsReachable;
	BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
    BOOL _hasConnect= (isReachable && !needsConnection)?YES:NO;
    
    if(_hasConnect)
    {
        NetworkStatus status= [[Reachability reachabilityWithHostName:@"www.baidu.com"] currentReachabilityStatus];
        if(status==NotReachable||status==0)return NO;
        return YES;
    }
    else
    {
        return  NO;
    }
	// = flags & kSCNetworkReachabilityFlagsIsWWAN;
	BOOL nonWifi = flags & kSCNetworkReachabilityFlagsTransientConnection;
	BOOL moveNet = flags & kSCNetworkReachabilityFlagsIsWWAN;
	BOOL _isExistNetWork = ((isReachable && !needsConnection) || nonWifi || moveNet) ? YES : NO;
    return _isExistNetWork;
}

+(BOOL)isWIFI
{
    struct sockaddr_in zeroAddress;
	bzero(&zeroAddress, sizeof(zeroAddress));
	zeroAddress.sin_len = sizeof(zeroAddress);
	zeroAddress.sin_family = AF_INET;
	
	
	SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
	SCNetworkReachabilityFlags flags;
    
	BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
	CFRelease(defaultRouteReachability);
	
	if (!didRetrieveFlags) {
		return NO;
	}
	
	//BOOL isReachable = flags & kSCNetworkFlagsReachable;
	//BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
	// = flags & kSCNetworkReachabilityFlagsIsWWAN;
	BOOL nonWifi = flags & kSCNetworkReachabilityFlagsTransientConnection;
	//BOOL moveNet = flags & kSCNetworkReachabilityFlagsIsWWAN;
	
	return !nonWifi;
}

@end
