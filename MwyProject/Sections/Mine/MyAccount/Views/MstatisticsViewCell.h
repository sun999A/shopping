//
//  MstatisticsViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MstatisticsViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UIImageView *line;
@property(nonatomic,strong)UIImageView *selectImg;
-(void)userName:(NSString *)name price:(NSString *)price;
@end
