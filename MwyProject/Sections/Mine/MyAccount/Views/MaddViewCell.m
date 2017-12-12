//
//  MaddViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MaddViewCell.h"

@implementation MaddViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        CellLabelAlloc_K(_nameLabel);
       
        CellImage_K(_line);
        CellImage_K(_imgView);
        CellLabelAlloc_K(_timeLabel);
        CellLabelAlloc_K(_shopLabel);
    }
    return self;
}

-(void)setShop:(NSString *)shop name:(NSString *)name time:(NSString *)time{
    CGRect frame = [self frame];
    _imgView.frame = FRAMEMAKE_F(15, 12, 55, 55);
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.aliCornerRadius = 2.5;
    
    
    frame.size.height = CGRectGetHeight(_imgView.frame) + 24;
    
    
    LabelSet(_shopLabel, shop, ME_COLOR_666666, 16, shopDic, shopSize);
    _shopLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_imgView.frame) + 10, CGRectGetMinY(_imgView.frame) + 5, shopSize.width, shopSize.height);
    
    LabelSet(_nameLabel, name, ME_COLOR_CELLTEXTLABEL, 14, nameDic, nameSize);
    _nameLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_shopLabel.frame), CGRectGetMaxY(_imgView.frame) - 5 - nameSize.height, nameSize.width, nameSize.height);
    
    LabelSet(_timeLabel, time, M_TIME, 14, dealDic, dealSize);
    _timeLabel.frame = FRAMEMAKE_F(WIDTH_K - 15 - dealSize.width, CGRectGetMinY(_imgView.frame) + 7, dealSize.width, dealSize.height);
    
    
   
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(0, frame.size.height - 0.5, WIDTH_K, 0.5);
    
    self.frame = frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
