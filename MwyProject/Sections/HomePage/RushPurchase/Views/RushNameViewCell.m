//
//  RushNameViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "RushNameViewCell.h"

@implementation RushNameViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        

       
        CellLabelAlloc_K(_saleLabel);
        CellLabelAlloc_K(_name);
       
        CellLabelAlloc_K(_placeLabel);
        CellLabelAlloc_K(_expressLabel);
       
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setName:(NSString *)name   sale:(NSString *)sale express:(NSString *)express place:(NSString *)place{
    CGRect frame = [self frame];
    
    _name.font = [UIFont systemFontOfSize:17];
    _name.text = name;
    _name.numberOfLines = 2;
    _name.textColor = H_SHOPNAME;
    CGSize newSize = [_name boundingRectWithSize:CGSizeMake(WIDTH_K  - 30, 0)];
    
    _name.frame = FRAMEMAKE_F(15, 15, newSize.width, newSize.height);
    
    
    
    LabelSet(_saleLabel, sale, H_GOODSEARCH, 13, stDic, stSize);
    _saleLabel.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, CGRectGetMaxY( _name.frame) + 15, stSize.width, stSize.height);
    
    LabelSet(_placeLabel, place, H_GOODSEARCH, 13, signDic, signSize);
    _placeLabel.frame = FRAMEMAKE_F(WIDTH_K - signSize.width - 15, CGRectGetMinY(_saleLabel.frame), signSize.width, signSize.height);
    
    LabelSet(_expressLabel, express, H_GOODSEARCH, 13, expressDic, expressSize);
    _expressLabel.frame = FRAMEMAKE_F((WIDTH_K - expressSize.width) / 2, CGRectGetMinY(_saleLabel.frame), expressSize.width, expressSize.height);
    
    
    
    
    frame.size.height = CGRectGetHeight(_name.frame) +CGRectGetHeight( _saleLabel.frame) + 45;
    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
