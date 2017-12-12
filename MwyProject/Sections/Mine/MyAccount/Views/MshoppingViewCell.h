//
//  MshoppingViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MshoppingViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *shopLabel;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *dealLabel;
@property (nonatomic,strong)UILabel *priceLabel;
@property(nonatomic,strong)UIImageView *line;
@property(nonatomic,strong)UIImageView *imgView;
-(void)setShop:(NSString *)shop name:(NSString *)name deal:(NSString *)deal price:(NSString *)price;

@end
