//
//  UCHintView.h
//  Comics
//
//  Created by yuety on 13-9-2.
//  Copyright (c) 2013年 noear. All rights reserved.
//


#import <UIKit/UIKit.h>

static int size = 80;

@interface UCHintView : UIView{
    UIActivityIndicatorView* _activityView;
    UILabel* _txtView;
}

-(void)showHintView:(NSString*)hint;
-(void)showWaitHintView;
-(void)showWaitHintView:(NSString*)hint;//不能超过5个字

-(void)hideHintView;

@end
