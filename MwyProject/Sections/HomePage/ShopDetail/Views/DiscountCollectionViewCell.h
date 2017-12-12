//
//  DiscountCollectionViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DiscountCollectionView @"DiscountCollectionView"


@interface DiscountCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *substractImg;
@property (nonatomic,strong)UILabel *substractLabel;

@property (strong, nonatomic)  UIImageView *discountImg;
@property (nonatomic,strong)UILabel *discountLabel;

@property (strong, nonatomic)  UIImageView *backImg;
@property (nonatomic,strong)UILabel *shopLabel;

@property (nonatomic,strong) UIButton *shopBtn;
- (void)setShopSubstract:(NSString *)substract discount:(NSString *)discount;
@end
