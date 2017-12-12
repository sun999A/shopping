//
//  UserNameVIew.h
//  Teaism
//
//  Created by ike on 15/10/29.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


//Nav、头像、Name
@interface UserNameView : UITableViewCell
@property(nonatomic,strong)UIImageView *lineView;
 
@property(nonatomic,strong)UIImageView *selectImg;
-(void)userNameImages:(NSString *)nameImage userNameString:(NSString *)string;

@end
