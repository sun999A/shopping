//
//  MstatisticsViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MstatisticsViewCell.h"

@implementation MstatisticsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        
        CellLabelAlloc_K(_nameLabel);
        CellLabelAlloc_K(_priceLabel);
        CellImage_K(_line);
        CellImage_K(_selectImg);
    }
    return self;
}

-(void)userName:(NSString *)name price:(NSString *)price{
    CGRect frame = [self frame];
    frame.size.height = 50;
    
    LabelSet(_nameLabel, name, H_SHOPNAME, 15, nameDic, nameSize);
    _nameLabel.frame = FRAMEMAKE_F(15, (frame.size.height - nameSize.height) / 2, nameSize.width, nameSize.height);
    
    
    UIImage *seleImg = [UIImage imageNamed:@"m_rjiantou"];
    [_selectImg setImage:seleImg];
    _selectImg.frame =FRAMEMAKE_F(WIDTH_K - 15 - seleImg.size.width,(frame.size.height - seleImg.size.height)/2, seleImg.size.width, seleImg.size.height);
    
    LabelSet(_priceLabel, price, ME_COLOR_CELLTEXTLABEL, 14, numDic, numSize);
    _priceLabel.frame = FRAMEMAKE_F(WIDTH_K - 30 - CGRectGetWidth(_selectImg.frame) - numSize.width, (frame.size.height - numSize.height) / 2, numSize.width, numSize.height);
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 15, 1);

    self.frame = frame;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
