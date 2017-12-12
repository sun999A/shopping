//
//  DiscountCollectionViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "DiscountCollectionViewCell.h"

@implementation DiscountCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
       
         self.backgroundColor = [UIColor whiteColor];
        CellImage_K(_discountImg);
        CellImage_K(_substractImg);
        CellImage_K(_backImg);
       
        
        _shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_shopBtn];
    

        CellLabelAlloc_K(_discountLabel);
        CellLabelAlloc_K(_substractLabel);
        CellLabelAlloc_K(_shopLabel);
       
        
        
    }
    return self;
}


- (void)setShopSubstract:(NSString *)substract discount:(NSString *)discount{
    CGRect frame = [self frame];

     frame.size.height = 60;
    _substractImg.image = [UIImage imageNamed:@"h_substract"];
    _substractImg.frame = FRAMEMAKE_F(15, ViewFromX_Y,_substractImg.image.size.width, _substractImg.image.size.height);
    
    LabelSet(_substractLabel, substract, H_SUBSTRACT, 12, substractDic, substractSize);
    _substractLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_substractImg.frame) + 5,  10, substractSize.width, substractSize.height);
    
    _discountImg.image = [UIImage imageNamed:@"h_discount"];
    _discountImg.frame = FRAMEMAKE_F(CGRectGetMinX(_substractImg.frame), CGRectGetMaxY( _substractImg.frame) + 10, _discountImg.image.size.width, _discountImg.image.size.height);
    
    LabelSet(_discountLabel, discount, H_SUBSTRACT, 12, discountDic, discountSize);
    _discountLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_substractLabel.frame),  CGRectGetMaxY(_substractLabel.frame) + 12, discountSize.width, discountSize.height);

    _backImg.image = [UIImage imageNamed:@"m_rjiantou"];
    _backImg.frame = FRAMEMAKE_F(WIDTH_K - 15 - _backImg.image.size.width, (frame.size.height - _backImg.image.size.height) / 2,  _backImg.image.size.width,  _backImg.image.size.height);
    
    
    LabelSet(_shopLabel, @"商家详情", ME_COLOR_666666, 14, moreDic, moreSize);
    
    _shopLabel.frame = FRAMEMAKE_F(WIDTH_K - moreSize.width - 20 - CGRectGetWidth(_backImg.frame), (frame.size.height - moreSize.height) / 2, moreSize.width, moreSize.height);
    
    [_shopBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    _shopBtn.frame = FRAMEMAKE_F(WIDTH_K - LABLEIMAGE_K * 2 - moreSize.width - CGRectGetWidth(_backImg.frame) , _shopLabel.frame.origin.y, moreSize.width + CGRectGetWidth(_backImg.frame) + 5, moreSize.height);
    self.frame = frame;
    
    
    
}
@end
