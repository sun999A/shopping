//
//  UIView+Ext.m
//  Comics
//
//  Created by yuety on 13-9-2.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UCHintView.h"

//#define hintViewTag  0x98751234

UIScrollView* _netErrorHintView = nil;

extern int size;

@implementation UIView (Ext)
static NSInteger hintViewTag = 9999123;

- (UCHintView*)getHintViewAtCenter
{
    UIView* view = [self viewWithTag:hintViewTag];
    
    if (view != nil){
        [self bringSubviewToFront:view]; //将子视图移到父视图最上层
        return (UCHintView*)view;
    }
    else
    {
        UCHintView* view1 = [[UCHintView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
        
        view1.tag = hintViewTag;
        view1.backgroundColor = [UIColor blackColor];
        view1.layer.cornerRadius = 5;
        view1.alpha = 0.8;
    
        [self addSubview:view1];
        
        return view1;
    }
}


-(void)showHintView:(NSString*)hint
{
    [[self getHintViewAtCenter] showHintView:hint];
}

-(void)showWaitHintView:(NSString*)hint//不能超过5个字
{
    [[self getHintViewAtCenter] showWaitHintView:hint];
}

-(void)showWaitHintView
{
    [[self getHintViewAtCenter] showWaitHintView];
}

-(void)hideHintView
{
    UCHintView* view1 = (UCHintView*)[self viewWithTag:hintViewTag];
    
    if(view1 != nil)
        [view1 hideHintView];
    
}

-(void)hideNetErrorHintView
{
    if(_netErrorHintView != nil)
    {
        [_netErrorHintView removeFromSuperview];
        [_netErrorHintView setHidden:YES];
    }
    
}

-(void)showNetErrorHintView
{
    CGRect frm = self.frame;
    
    [self showNetErrorHintView:0 height:frm.size.height];
    
    [self hideHintView];
}

-(void)showNetErrorHintView:(int)top height:(int)height;
{
    if(_netErrorHintView == nil)
    {
        _netErrorHintView = [[UIScrollView alloc] init];
        
        
        UILabel* txtHint = [[UILabel alloc] init];
        
        txtHint.tag  = 99;
        txtHint.font = [UIFont systemFontOfSize:14];
        txtHint.text = @"啊,网络可能有问题...";
        txtHint.textAlignment = NSTextAlignmentCenter;
        
        _netErrorHintView.backgroundColor = [UIColor blackColor];
        txtHint.backgroundColor           = [UIColor blackColor];
        txtHint.textColor = [UIColor whiteColor];
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=88;
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:@"刷新试试" forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_hint.png"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_hint_c.png"] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(refresh) forControlEvents:UIControlEventTouchUpInside];
        
        [_netErrorHintView addSubview:btn];
        [_netErrorHintView addSubview:txtHint];        
    }
    
    [_netErrorHintView setFrame:CGRectMake(0, top, 320, height)];
    [[_netErrorHintView viewWithTag:99] setFrame:CGRectMake(0, (height -14)/2 -20, 320, 14)];
    [[_netErrorHintView viewWithTag:88] setFrame:CGRectMake((320-110)/2, (height -14)/2 + 10, 110, 30)];
    
    [self addSubview:_netErrorHintView];
    [_netErrorHintView setHidden:NO];
    [UIView resizeForScrollView:_netErrorHintView];
}

-(void)refresh
{
    
}

+(void)resizeForScrollView:(UIScrollView*)s
{
    if(s.contentSize.height<s.frame.size.height)
        [s setContentSize:CGSizeMake(s.contentSize.width, s.frame.size.height+1)];
}

@end
