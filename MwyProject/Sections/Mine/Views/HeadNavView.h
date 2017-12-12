//
//  HeadNavView.h
//  Teaism
//
//  Created by ike on 15/10/28.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadNavView : UIButton

//头像 name
@property(nonatomic,strong)UIImageView *headImg;
@property(nonatomic,strong)NSString *userName;

-(void)userName:(NSString *)userString;

@end
