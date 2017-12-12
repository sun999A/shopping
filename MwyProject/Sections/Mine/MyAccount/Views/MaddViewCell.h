//
//  MaddViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaddViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *shopLabel;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)UIImageView *line;
@property(nonatomic,strong)UIImageView *imgView;
-(void)setShop:(NSString *)shop name:(NSString *)name time:(NSString *)time;
@end
