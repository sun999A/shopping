//
//  OrderGoodViewCell.m
//  LitongProject
//
//  Created by feiyu iOS on 16/12/10.
//  Copyright © 2016年 Feiyu iOS. All rights reserved.
//

#import "OrderGoodViewCell.h"

@implementation OrderGoodViewCell

@synthesize line;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = M_BACKGRO;
        CellLabelAlloc_K(_nameLab);
        CellLabelAlloc_K(_price);
        CellLabelAlloc_K(_priceNum);
        CellImage_K(line);
        CellImage_K(_imgView);
        CellLabelAlloc_K(_standardLab);
        
    }
    return self;
}

-(void)setName:(NSString *)name priceNum:(NSString *)num price:(NSString *)price standard:(NSString *)standard{
    CGRect frame = [self frame];
    
    _imgView.frame = FRAMEMAKE_F(15, 15, 90, 90);
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    frame.size.height = CGRectGetHeight(_imgView.frame) + 30;
    
    
    _nameLab.font = [UIFont systemFontOfSize:13];
    _nameLab.text = name;
    _nameLab.numberOfLines = 2;
    _nameLab.textColor = H_SHOPNAME;
    CGSize newSize = [_nameLab boundingRectWithSize:CGSizeMake(WIDTH_K - CGRectGetMaxX(_imgView.frame) - ViewFromX_Y * 4 - 5, 0)];
    
    _nameLab.frame = FRAMEMAKE_F(CGRectGetMaxX(_imgView.frame) + 15, 20, newSize.width, newSize.height);
    
    LabelSet(_standardLab, standard, ME_COLOR_CELLTEXTLABEL, 13, standardDic, standardSize);
    _standardLab.frame = FRAMEMAKE_F(CGRectGetMinX( _nameLab.frame), CGRectGetMaxY( _nameLab.frame) + 5, standardSize.width, standardSize.height);
    
    LabelSet(_price, price, ME_COLOR_666666, 15, priceDic, pricSize);
    _price.frame = FRAMEMAKE_F(CGRectGetMinX( _nameLab.frame), CGRectGetMaxY( _imgView.frame) - 5 - pricSize.height, pricSize.width, pricSize.height);
    
    LabelSet(_priceNum, num, ME_COLOR_CELLTEXTLABEL, 15, pricenDic, pricnSize);
    _priceNum.frame = FRAMEMAKE_F(WIDTH_K - 15 - pricnSize.width, CGRectGetMinY( _price.frame), pricnSize.width, pricnSize.height);
    
    [line setImage:[UIImage imageNamed:@"hang"]];
    line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    self.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
