//
//  GoodNameViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/22.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodNameViewCell.h"

@implementation GoodNameViewCell
{
    UILabel *priceLine;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _price  = [[UILabel alloc]init];
        [self addSubview:_price];
        
      
        
        CellLabelAlloc_K(_signLabel);
        CellLabelAlloc_K(_saleLabel);
        CellLabelAlloc_K(_name);
        CellLabelAlloc_K(_disPrice);
        CellLabelAlloc_K(_placeLabel);
        CellLabelAlloc_K(_expressLabel);
        priceLine = [UILabel new];
        [_disPrice addSubview:priceLine];
        
    }
    return self;
}

-(void)setName:(NSString *)name  price:(NSString *)price disPrice:(NSString *)disPrice sale:(NSString *)sale express:(NSString *)express place:(NSString *)place{
    CGRect frame = [self frame];
    
    _name.font = [UIFont systemFontOfSize:17];
    _name.text = name;
    _name.numberOfLines = 2;
    _name.textColor = H_SHOPNAME;
    CGSize newSize = [_name boundingRectWithSize:CGSizeMake(WIDTH_K  - 30, 0)];
    
    _name.frame = FRAMEMAKE_F(15, 15, newSize.width, newSize.height);
    
    
    _price.text = price;
    _price.textColor = S_OPRICE;
    _price.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    NSDictionary *teaDic = StringFont_DicK(_price.font);
    CGSize teaSize = [_price.text sizeWithAttributes:teaDic];
    _price.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, CGRectGetMaxY(_name.frame) + 15 , teaSize.width, teaSize.height);
     [self fuwenbenLabel:_price FontNumber:[UIFont systemFontOfSize:15] AndRange:NSMakeRange(0, 1) AndColor:S_OPRICE];
    
    LabelSet(_disPrice, disPrice, ME_COLOR_CELLTEXTLABEL, 13, discountDic, discountSize);
    _disPrice.frame = FRAMEMAKE_F(CGRectGetMinX(_price.frame), CGRectGetMaxY( _price.frame) + 15, discountSize.width, discountSize.height);
    priceLine.backgroundColor = ME_COLOR_CELLTEXTLABEL;
    priceLine.frame = FRAMEMAKE_F(0, discountSize.height/2, discountSize.width, 1);
    
    LabelSet(_saleLabel, sale, H_GOODSEARCH, 13, stDic, stSize);
    _saleLabel.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, CGRectGetMaxY( _disPrice.frame) + 15, stSize.width, stSize.height);
    
    LabelSet(_placeLabel, place, H_GOODSEARCH, 13, signDic, signSize);
    _placeLabel.frame = FRAMEMAKE_F(WIDTH_K - signSize.width - 15, CGRectGetMinY(_saleLabel.frame), signSize.width, signSize.height);
    
    LabelSet(_expressLabel, express, H_GOODSEARCH, 13, expressDic, expressSize);
    _expressLabel.frame = FRAMEMAKE_F((WIDTH_K - expressSize.width) / 2, CGRectGetMinY(_saleLabel.frame), expressSize.width, expressSize.height);
    
    
    

    frame.size.height = CGRectGetHeight(_name.frame) + CGRectGetHeight(_price.frame) + CGRectGetHeight( _disPrice.frame) +CGRectGetHeight( _saleLabel.frame) + 60 + 9;
    
    self.frame = frame;
}
//设置不同字体颜色
-(void)fuwenbenLabel:(UILabel *)labell FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:labell.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    labell.attributedText = str;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
