//
//  InfoViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewCell : UITableViewCell
@property (nonatomic,strong)UIImageView *photoImage;
@property (nonatomic,strong)UILabel *nameLabel;

@property (nonatomic,strong)UILabel *orderLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *detailLabel;



- (void)setName:(NSString *)name  order:(NSString *)order time:(NSString *)time detail:(NSString *)detail;

@end
