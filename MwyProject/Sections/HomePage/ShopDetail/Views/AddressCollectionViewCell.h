//
//  AdressCollectionViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

#define AddressCollectionView @"AddressCollectionView"


@interface AddressCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)UIImageView *photoImage;
@property (strong, nonatomic)  UIImageView *line;


@property (nonatomic,strong)UILabel *nameLabel;

@property (nonatomic,strong)UIButton *phoneBtn;

- (void)setName:(NSString *)name;
@end
