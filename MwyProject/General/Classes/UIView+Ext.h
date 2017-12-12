//
//  UIView+Ext.h
//  Comics
//
//  Created by yuety on 13-9-2.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Ext)

-(void)showHintView:(NSString*)hint;
-(void)showWaitHintView;
-(void)showWaitHintView:(NSString*)hint;//不能超过5个字
-(void)hideHintView;


-(void)hideNetErrorHintView;
-(void)showNetErrorHintView;
-(void)showNetErrorHintView:(int)top height:(int)height;

@end
