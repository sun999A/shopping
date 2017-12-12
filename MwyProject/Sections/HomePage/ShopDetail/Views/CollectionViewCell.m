//
//  CollectionViewCell.m
//  Linkage
//
//  Created by LeeJay on 16/8/22.
//  Copyright © 2016年 LeeJay. All rights reserved.
//


#import "CollectionViewCell.h"

@interface CollectionViewCell ()
{
    UILabel *_signLabel;
    UILabel *priceLine;
}

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        CellImage_K(_imageV);

        
        CellLabelAlloc_K(_name);
       
        CellLabelAlloc_K(_priceLabel);
        CellLabelAlloc_K(_discountLabel);
         CellLabelAlloc_K(_signLabel);
        
        
        priceLine = [UILabel new];
        [_discountLabel addSubview:priceLine];
        
    }
    return self;
}

- (void)setName:(NSString *)name price:(NSString *)price disPrice:(NSString *)disPrice{
    CGRect frame = [self frame];
    
    _imageV.frame = FRAMEMAKE_F(0, 0, (WIDTH_K - 15) / 2, (WIDTH_K - 15) / 2);
     _imageV.contentMode = UIViewContentModeScaleAspectFit;
    
     frame.size.height = CGRectGetHeight(_imageV.frame) + 60;
    
    LabelSet(_name, name, H_SHOPNAME, 13, nameDic, nameSize);
    
    _name.frame = FRAMEMAKE_F(10, CGRectGetMaxY(_imageV.frame) + 12, (WIDTH_K - 15) / 2 - 20, nameSize.height);
    
    
    LabelSet(_signLabel, @"¥", S_OPRICE, 12, signDic, signSize);
    _signLabel.frame = FRAMEMAKE_F(CGRectGetMinX( _name.frame), frame.size.height - 11 - signSize.height, signSize.width, signSize.height);
    
    NSArray *priceArr = [price componentsSeparatedByString:@"."];
    
   
    _priceLabel.textColor = S_OPRICE;
    //_priceLabel.text = price;
    
        if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
            _priceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
        }else{
            _priceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    
        }
    
    NSString *string = priceArr[1];
    NSString *str = [NSString stringWithFormat:@"%@.%@" ,priceArr[0], string];
   
    //NSRange range = [str rangeOfString:[NSString stringWithFormat:@"%@" , string]];
   
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str];
    //[attribute addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range];
    [attribute addAttributes:@{NSForegroundColorAttributeName:S_OPRICE,NSFontAttributeName:[UIFont systemFontOfSize:12]}  range:NSMakeRange([priceArr[0] length] + 1, [priceArr[1] length])];
    _priceLabel.attributedText = attribute;

    //[self fuwenbenLabel:_priceLabel FontNumber:[UIFont systemFontOfSize:12] AndRange:NSMakeRange(0, 1) AndColor:S_OPRICE];
    
    NSDictionary *priceDic = StringFont_DicK(_priceLabel.font);
    CGSize priceSize = [_priceLabel.text  sizeWithAttributes:priceDic];
    
    
    _priceLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_signLabel.frame) + 2, frame.size.height - 10 - priceSize.height, priceSize.width , priceSize.height);
    
    
    
    
    LabelSet(_discountLabel, disPrice, H_GOODSEARCH, 13, discountDic, discountSize);
    _discountLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_priceLabel.frame) + 8,CGRectGetMaxY(_priceLabel.frame) - discountSize.height, (WIDTH_K - 15) / 2 - CGRectGetMaxX(_priceLabel.frame) - 15, discountSize.height);
    priceLine.backgroundColor = H_GOODSEARCH;
    priceLine.frame = FRAMEMAKE_F(0, discountSize.height/2, (WIDTH_K - 15) / 2 - CGRectGetMaxX(_priceLabel.frame) - 15, 1);
    
    //frame.size.height = CGRectGetHeight(_imageV.frame) + CGRectGetHeight( _name.frame)+  CGRectGetHeight( _size.frame) + CGRectGetHeight(_price.frame) + 22;
    
       
    
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
@end
