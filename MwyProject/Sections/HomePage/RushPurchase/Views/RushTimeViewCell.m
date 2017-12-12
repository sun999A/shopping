//
//  RushTimeViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "RushTimeViewCell.h"

@implementation RushTimeViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.backgroundColor = H_FAST;
        CellImage_K(_limitImg);
        CellImage_K(_timeImg);
        CellImage_K(_fastImg);
        
        CellLabelAlloc_K(_discountLab);
        CellLabelAlloc_K(_timeLabel);
        
        CellLabelAlloc_K(_limitLabel);
        CellLabelAlloc_K(_fastLabel);
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setNameDiscount:(NSString *)discount  limit:(NSString *)limit time:(NSString *)time fast:(NSString *)fast{
    CGRect frame = [self frame];
    frame.size.height = 50;
    
    _limitImg.image = [UIImage imageNamed:@"g_xianshi"];
    _limitImg.frame = FRAMEMAKE_F(15, (frame.size.height - _limitImg.image.size.height) / 2, _limitImg.image.size.width, _limitImg.image.size.height);
    
    _timeImg.image = [UIImage imageNamed:@"g_time"];
    _timeImg.frame = FRAMEMAKE_F(WIDTH_K / 2 - 15 - _timeImg.image.size.width, (frame.size.height - _timeImg.image.size.height) / 2, _timeImg.image.size.width, _timeImg.image.size.height);
    
    _fastImg.image = [UIImage imageNamed:@"g_shangou"];
    _fastImg.frame = FRAMEMAKE_F(WIDTH_K  - 90 - _fastImg.image.size.width, (frame.size.height - _fastImg.image.size.height) / 2, _fastImg.image.size.width, _fastImg.image.size.height);
    
    
    LabelSet(_discountLab, discount, ME_COLOR_666666, 12, stDic, stSize);
    _discountLab.frame = FRAMEMAKE_F(CGRectGetMaxX(_timeImg.frame) + 15, 10, stSize.width, stSize.height);
    
    LabelSet(_limitLabel, limit, ME_COLOR_666666, 12, signDic, signSize);
    _limitLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_discountLab.frame), CGRectGetMaxY(_discountLab.frame) + 10, signSize.width, signSize.height);
    
    LabelSet(_timeLabel, time, ME_COLOR_666666, 12, expressDic, expressSize);
    _timeLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_fastImg.frame) + 15, 10, expressSize.width, expressSize.height);
    
    LabelSet(_fastLabel, fast, ME_COLOR_666666, 12, fastDic, fastSize);
    _fastLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_timeLabel.frame), CGRectGetMaxY(_timeLabel.frame) + 10, fastSize.width, fastSize.height);
    
    

    
    self.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
