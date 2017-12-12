//
//  UIViewController+Ext.m
//  Comics
//
//  Created by yuety on 13-8-15.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import "UIViewController+Ext.h"

#import <objc/runtime.h>
#import "MBProgressHUD.h"

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;
@implementation UIViewController (Ext)





- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}
- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}
- (void)hideHud{
    [[self HUD] hide:YES];
}

@end
