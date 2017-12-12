//
//  RecommendViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/15.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "RecommendViewCell.h"
#import "DYRateView.h"
@implementation RecommendViewCell
{
    DYRateView *rateView;
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
       
        CellImage_K(_discountImg);
        CellImage_K(_substractImg);
        CellImage_K(_phoneImg);
       
        
    
        
        _phoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_phoneButton];
        
        
        rateView = [[DYRateView alloc] init];
        [self addSubview:rateView];
        
        CellLabelAlloc_K(_nameLabel);
        CellLabelAlloc_K(_discountLabel);
        CellLabelAlloc_K(_substractLabel);
        CellLabelAlloc_K(_distanceLabel);
        
        CellLabelAlloc_K(_phoneLabel);
       
        CellLabelAlloc_K(_starLabel);
        
        
        
        
    }
    return self;
}


- (void)setShopName:(NSString *)name substract:(NSString *)substract discount:(NSString *)discount distance:(NSString *)distance starNum:(NSString *)starNum  star:(float)star{
    CGRect frame = [self frame];
    _photoImage.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, ViewFromX_Y + 2, 105, 105);
    _photoImage.contentMode = UIViewContentModeScaleAspectFit;
    
    frame.size.height = CGRectGetHeight(_photoImage.frame) + 24;
    
    self.frame = frame;
    LabelSet(_distanceLabel, distance, ME_COLOR_CELLTEXTLABEL, 14, distanceDic, distanceSize);
    _distanceLabel.frame = FRAMEMAKE_F(WIDTH_K - distanceSize.width - 15, ViewFromX_Y * 2 + 2 , distanceSize.width, distanceSize.height);
    
    
    LabelSet(_nameLabel, name, H_SHOPNAME, 16, shopDic, shopSize);
    _nameLabel.frame = FRAMEMAKE_F(LABLEIMAGE_K * 3 + _photoImage.frame.size.width, ViewFromX_Y * 2, WIDTH_K - CGRectGetWidth( _photoImage.frame) - CGRectGetWidth(_distanceLabel.frame) - 50, shopSize.height);
    
    //星星
    rateView.frame = FRAMEMAKE_F(_nameLabel.frame.origin.x, CGRectGetMaxY(_nameLabel.frame) + 10, 80, 20);
    rateView.isshow = YES;
    rateView.rate = star;
    rateView.alignment = RateViewAlignmentLeft;
    

    LabelSet(_starLabel, starNum, H_SCORE, 14, starDic, starSize);
    _starLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(rateView.frame) + 5,  CGRectGetMinY(rateView.frame) - 2, starSize.width, starSize.height);
    
    
    _substractImg.image = [UIImage imageNamed:@"h_substract"];
    _substractImg.frame = FRAMEMAKE_F(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY(rateView.frame) + 2, _substractImg.image.size.width, _substractImg.image.size.height);
    
    LabelSet(_substractLabel, substract, H_SUBSTRACT, 12, substractDic, substractSize);
    _substractLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_nameLabel.frame) + CGRectGetWidth(_substractImg.frame) + 2,  CGRectGetMaxY(rateView.frame) + 2, substractSize.width, substractSize.height);
    
    _discountImg.image = [UIImage imageNamed:@"h_discount"];
    _discountImg.frame = FRAMEMAKE_F(CGRectGetMinX(_nameLabel.frame), CGRectGetMaxY( _substractImg.frame) + 5, _discountImg.image.size.width, _discountImg.image.size.height);
    
    LabelSet(_discountLabel, discount, H_SUBSTRACT, 12, discountDic, discountSize);
    _discountLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_nameLabel.frame) + CGRectGetWidth(_discountImg.frame) + 2,  CGRectGetMaxY(_substractLabel.frame) + 8, discountSize.width, discountSize.height);
    
    LabelSet(_phoneLabel, @"电话",  H_SUBSTRACT, 12, phoneDic, phoneSize);
    _phoneLabel.frame = FRAMEMAKE_F(WIDTH_K - 15 - phoneSize.width, CGRectGetMinY(_discountLabel.frame), phoneSize.width, phoneSize.height);
    
    
    UIImage *phoneImg = [UIImage imageNamed:@"h_phone"];
    [_phoneButton setImage:phoneImg  forState:UIControlStateNormal];
    [_phoneButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _phoneButton.frame = FRAMEMAKE_F(WIDTH_K - 15 - CGRectGetWidth(_phoneLabel.frame) - phoneImg.size.width - 5, CGRectGetMaxY( _substractLabel.frame) + 7, phoneImg.size.width + phoneSize.width + 5, phoneImg.size.height);
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);

    
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
