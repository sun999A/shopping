//
//  GoodPreferViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodPreferViewCell.h"

@implementation GoodPreferViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellImage_K(_discountImg);
        CellImage_K(_substractImg);
        CellImage_K(_line);
        
        
        CellLabelAlloc_K(_discountLabel);
        CellLabelAlloc_K(_substractLabel);
        CellLabelAlloc_K(_shopLabel);
        
        
        
        
    }
    return self;
}


- (void)setShop:(NSString *)shop substract:(NSString *)substract discount:(NSString *)discount{
    CGRect frame = [self frame];
    
    LabelSet(_shopLabel, shop, H_SHOPNAME, 16, moreDic, moreSize);
    
    _shopLabel.frame = FRAMEMAKE_F((WIDTH_K - moreSize.width) / 2, ViewFromX_Y * 2, moreSize.width, moreSize.height);
    
    
    
    _substractImg.image = [UIImage imageNamed:@"h_substract"];
    _substractImg.frame = FRAMEMAKE_F(15, CGRectGetMaxY(_shopLabel.frame) + ViewFromX_Y + 5 ,_substractImg.image.size.width, _substractImg.image.size.height);
    
    LabelSet(_substractLabel, substract, H_SUBSTRACT, 12, substractDic, substractSize);
    _substractLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_substractImg.frame) + 5,  CGRectGetMinY(_substractImg.frame), substractSize.width, substractSize.height);
    
    _discountImg.image = [UIImage imageNamed:@"h_discount"];
    _discountImg.frame = FRAMEMAKE_F(CGRectGetMinX(_substractImg.frame), CGRectGetMaxY( _substractImg.frame) + 10, _discountImg.image.size.width, _discountImg.image.size.height);
    
    LabelSet(_discountLabel, discount, H_SUBSTRACT, 12, discountDic, discountSize);
    _discountLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_substractLabel.frame),  CGRectGetMaxY(_substractLabel.frame) + 12, discountSize.width, discountSize.height);
    
    
    frame.size.height = CGRectGetHeight(_shopLabel.frame) + CGRectGetHeight( _substractImg.frame)+  CGRectGetHeight( _discountLabel.frame) + 40 + 25;
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 30,  1);
    self.frame = frame;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
