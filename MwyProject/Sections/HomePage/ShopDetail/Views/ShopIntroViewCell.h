//
//  ShopIntroViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopIntroViewCell : UITableViewCell
@property (strong, nonatomic)  UIImageView *line;


@property (nonatomic,strong)UILabel *nameLabel;

@property (nonatomic,strong)UILabel *detailLabel;

- (void)setName:(NSString *)name detail:(NSString *)detail;
@end
