//
//  HeadNavView.m
//  Teaism
//
//  Created by ike on 15/10/28.
//  Copyright © 2015年 Apple. All rights reserved.
//

#define HEADIMAGE_K 60

#import "HeadNavView.h"

@implementation HeadNavView{
    __strong UILabel *user;
    __strong UIImageView *userImage;
}

-(id)init{
    self = [super init];
    if (self) {
        //self.backgroundColor = NAVCOLOR_C(84.0, 160.0, 74.0);
        _headImg = [[UIImageView alloc]init];
        [_headImg setImage:[UIImage imageNamed:@"ziliao_touxiang70"]];
        //_headImg.backgroundColor = [UIColor whiteColor];
        _headImg.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5,(WIDTH_K/3) - HEADIMAGE_K - 20, HEADIMAGE_K,HEADIMAGE_K);
//        CALayer *headLayer =[_headImg layer];
//        headLayer.cornerRadius = HEADIMAGE_K/2;
//        _headImg.clipsToBounds = YES;
        
        _headImg.aliCornerRadius = HEADIMAGE_K / 2;
        [self addSubview:_headImg];
        
        user = [[UILabel alloc]init];
        [self addSubview:user];
        
        userImage = [[UIImageView alloc]init];
        [self addSubview:userImage];
        
    }
    return self;
}
-(void)userName:(NSString *)userString{
    user.text = userString;
    user.textColor = [UIColor whiteColor];
    user.font = [UIFont systemFontOfSize:20];
    NSDictionary *userDic = StringFont_DicK(user.font);
    CGSize userSize = [user.text sizeWithAttributes:userDic];
    user.frame = FRAMEMAKE_F((LABLEIMAGE_K *3)+ _headImg.frame.size.width,(WIDTH_K / 3)- HEADIMAGE_K - 10 + (userSize.height /2),userSize.width, userSize.height);
    
    UIImage *userImg = [UIImage imageNamed:@"m_jiantou"];
    [userImage setImage:userImg];
    userImage.frame = FRAMEMAKE_F(WIDTH_K - LABLEIMAGE_K  - userImg.size.width - 5, WIDTH_K/3 -  HEADIMAGE_K + (userImg.size.height/2), userImg.size.width, userImg.size.height);
    
}
@end
