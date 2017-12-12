//
//  UCHintView.m
//  Comics
//
//  Created by yuety on 13-9-2.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UCHintView.h"
#import "UILabel+Ext.h"
#import <Foundation/Foundation.h>

@implementation UCHintView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)tryAddTxtView
{
    if(_txtView == nil)
    {
        _txtView = [[UILabel alloc] init];
        [_txtView setFont:[UIFont systemFontOfSize:14]];
        [_txtView setTextAlignment:NSTextAlignmentCenter];
        [_txtView setBackgroundColor:[UIColor clearColor]];
        [_txtView setTextColor:[UIColor whiteColor]];
        [_txtView setNumberOfLines:0];
        
        [self addSubview:_txtView];
    }
}

-(void)showHintView:(NSString *)hint
{
    if([NSThread isMainThread]==FALSE)
    {
        [self performSelectorOnMainThread:@selector(showHintView:) withObject:hint waitUntilDone:FALSE];
        return;
    }
    
    if(_activityView != nil)
        [_activityView stopAnimating];
    
    [self tryAddTxtView];
    

    
    [_txtView setText:hint];
    
    float txtWidth = [_txtView widthOfText:CGSizeMake(280, 100)];
    if(txtWidth>280)
    {
        [_txtView setTextAlignment:NSTextAlignmentLeft];
        txtWidth=280;
    }
    else
        [_txtView setTextAlignment:NSTextAlignmentCenter];
    
    [_txtView setFrame:CGRectMake(10, (size-40)/2, txtWidth, 40)];
    
    txtWidth = txtWidth + 20;
    
    CGRect frm = self.frame;
    CGSize psize = [UIScreen mainScreen].bounds.size;
    
    if(txtWidth> size)
        frm.size.width = txtWidth;
    else
    {
        frm.size.width = size;
        [_txtView setFrame:CGRectMake(10, (size-12)/2, size-20, 12)];
    }
    
    [self setFrame:frm];
    
    

    self.center = CGPointMake(psize.width/2.0, psize.height/2.0);
    
    self.autoresizingMask = UIViewAutoresizingNone;
    
    [self setHidden:NO];
    
    [self performSelector:@selector(hideHintView) withObject:self afterDelay:2];
}

-(void)showWaitHintView
{
    [self showWaitHintView:@"请稍候..."];
}

-(void)showWaitHintView:(NSString*)hint
{
    if([NSThread isMainThread]==FALSE)
    {
        [self performSelectorOnMainThread:@selector(showWaitHintView:) withObject:hint waitUntilDone:FALSE];
        return;
    }
    
    
    if(_activityView == nil)
    {
        _activityView= [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _activityView.frame = CGRectMake((size-20)/2, 20, 20, 20);
        
        [self addSubview:_activityView];
        [self tryAddTxtView];
    }
    
    _txtView.text = hint;
    
    int size2 =[_txtView widthOfText]+20;
    if(size2<size)
        size2=size;
    
    
    CGRect frm = self.frame;
    CGSize psize =  [UIScreen mainScreen].bounds.size;//self.superview.frame.size;
    frm.size.width = size2;
    
    [self setFrame:frm];
    
    _activityView.frame = CGRectMake((size2-20)/2, 20, 20, 20);
    _txtView.frame      = CGRectMake(5, size-30, size2-10, 14);
    
    self.autoresizingMask = UIViewAutoresizingNone;
    self.center = CGPointMake(psize.width/2.0,psize.height/2.0);
    
    [_activityView startAnimating];
    
    [self setHidden:NO];
}

-(void)hideHintView
{
    if(_activityView != nil)
        [_activityView stopAnimating];
    
    [self setHidden:YES];
}

@end
