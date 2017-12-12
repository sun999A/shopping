//
//  GoodServiceViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodServiceViewCell : UITableViewCell
@property (strong, nonatomic)  UIImageView *photoImg;
@property (nonatomic,strong)UILabel *nameLabel;


@property (nonatomic,strong)UILabel *shopLabel;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier nameArr:(NSArray *)nameArr;
- (void)setShop:(NSString *)shop nameArr:(NSArray *)nameArr;
@end
