//
//  CollectionViewCell.h
//  Linkage
//
//  Created by LeeJay on 16/8/22.
//  Copyright © 2016年 LeeJay. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellIdentifier_CollectionView @"CollectionViewCell"



@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *name;
@property (nonatomic, strong) UILabel *discountLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *cartButton;

- (void)setName:(NSString *)name price:(NSString *)price disPrice:(NSString *)disPrice;
@end
