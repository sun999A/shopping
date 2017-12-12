//
//  ShopPreViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopPreViewCell : UITableViewCell
@property (strong, nonatomic)  UIImageView *substractImg;
@property (nonatomic,strong)UILabel *substractLabel;

@property (strong, nonatomic)  UIImageView *discountImg;
@property (nonatomic,strong)UILabel *discountLabel;


@property (nonatomic,strong)UILabel *shopLabel;

@property (nonatomic,strong) UIButton *shopBtn;
@property (strong, nonatomic)  UIImageView *line;
- (void)setShop:(NSString *)shop substract:(NSString *)substract discount:(NSString *)discount;

@end
