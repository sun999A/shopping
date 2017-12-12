//
//  NewProViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewProViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *photoImage;
@property (strong, nonatomic)  UIImageView *line;


@property (nonatomic,strong)UILabel *shopLabel;

@property (nonatomic,strong)UILabel *saleLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UILabel *discountLabel;
@property (nonatomic,strong)UILabel *placeLabel;


@property (nonatomic,strong)UILabel *signLabel;

- (void)setShop:(NSString *)shop  price:(NSString *)price dicount:(NSString *)discount place:(NSString *)place sale:(NSString *)sale;

@end
