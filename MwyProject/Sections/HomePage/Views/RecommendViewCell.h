//
//  RecommendViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/15.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *photoImage;
@property (nonatomic,strong)UILabel *nameLabel;

@property (strong, nonatomic)  UIImageView *line;

@property (strong, nonatomic)  UIImageView *substractImg;
@property (nonatomic,strong)UILabel *substractLabel;

@property (strong, nonatomic)  UIImageView *discountImg;
@property (nonatomic,strong)UILabel *discountLabel;

@property (strong, nonatomic)  UIImageView *phoneImg;
@property (nonatomic,strong)UILabel *phoneLabel;

@property (nonatomic,strong)UILabel *distanceLabel;

@property (nonatomic,strong)UILabel *starLabel;
@property (nonatomic,strong)UIButton *phoneButton;



@property (nonatomic,copy)void(^push)(int btn);
- (void)setShopName:(NSString *)name substract:(NSString *)substract discount:(NSString *)discount distance:(NSString *)distance starNum:(NSString *)starNum  star:(float)star;

@end
