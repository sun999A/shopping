//
//  RushTimeViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RushTimeViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *limitImg;
@property(nonatomic,strong)UIImageView *timeImg;
@property(nonatomic,strong)UIImageView *fastImg;

@property(nonatomic,strong)UILabel *discountLab;

@property (nonatomic,strong)UILabel *limitLabel;

@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *fastLabel;




-(void)setNameDiscount:(NSString *)discount  limit:(NSString *)limit time:(NSString *)time fast:(NSString *)fast;
@end
