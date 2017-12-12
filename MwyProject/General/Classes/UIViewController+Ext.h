//
//  UIViewController+Ext.h
//  Comics
//
//  Created by yuety on 13-8-15.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Ext)


- (void)showHudInView:(UIView *)view hint:(NSString *)hint;
- (void)hideHud;
@end
