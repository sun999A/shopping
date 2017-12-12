//
//  ViewControllerBase.h
//  Collector
//
//  Created by kunhong on 14-8-21.
//  Copyright (c) 2014年 kunhong. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewControllerBase : UIViewController


-(void)setNAVTitle:(NSString *)title;



/** 返回按钮点击事件 **/
-(void)backBtnClick:(id)sender;

/** 返回上一个页面 **/
-(void)back;




@end