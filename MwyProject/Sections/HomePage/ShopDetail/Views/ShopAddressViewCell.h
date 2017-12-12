//
//  ShopAddressViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopAddressViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *mapImage;
@property (strong, nonatomic)  UIImageView *line;


@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *addressLabel;
@property (nonatomic,strong)UILabel *mapLabel;
@property (nonatomic,strong) UIButton *mapBtn;
- (void)setName:(NSString *)name address:(NSString *)address;
@end
