//
//  InfoViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "InfoViewCell.h"

@implementation InfoViewCell
{
    UIImageView *_line;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CellImage_K(_photoImage);
        CellImage_K(_line);
        
        CellLabelAlloc_K(_nameLabel);
        CellLabelAlloc_K(_orderLabel);
        CellLabelAlloc_K(_detailLabel);
        CellLabelAlloc_K(_timeLabel);
        
        
        
        
    }
    return self;
}

- (void)setName:(NSString *)name  order:(NSString *)order time:(NSString *)time detail:(NSString *)detail{
    CGRect frame = [self frame];
    _photoImage.image = [UIImage imageNamed:@"h_order"];
    _photoImage.frame = FRAMEMAKE_F(15,20, _photoImage.image.size.width, _photoImage.image.size.height);
    
    LabelSet(_nameLabel, name, H_SHOPNAME, 15, nameDic, nameSize);
    _nameLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + ViewFromX_Y , CGRectGetMinY(_photoImage.frame), nameSize.width , nameSize.height);
    
    
    LabelSet(_timeLabel, time, H_GOODSEARCH, 13, timeDic, timeSize);
    _timeLabel.frame = FRAMEMAKE_F(WIDTH_K - ViewFromX_Y - 5 - timeSize.width, CGRectGetMinY(_photoImage.frame), timeSize.width , timeSize.height);
    
    LabelSet(_orderLabel, order, H_SUBSTRACT, 13, orderDic, orderSize);
    _orderLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + ViewFromX_Y , CGRectGetMaxY(_nameLabel.frame) + 12, orderSize.width , orderSize.height);
    
    LabelSet(_detailLabel, detail, H_SUBSTRACT, 13, detailDic, detailSize);
    _detailLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + ViewFromX_Y , CGRectGetMaxY( _orderLabel.frame) + 12, detailSize.width , detailSize.height);
    
    frame.size.height = CGRectGetHeight( _nameLabel.frame) + CGRectGetHeight( _orderLabel.frame) + CGRectGetHeight( _detailLabel.frame) + 40 + 24;
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    self.frame = frame;

    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
