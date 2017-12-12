//
//  ShopAddressViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "ShopAddressViewCell.h"

@implementation ShopAddressViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellImage_K(_mapImage);
        CellImage_K(_line);
        
        
        CellLabelAlloc_K(_mapLabel);
        CellLabelAlloc_K(_nameLabel);
        CellLabelAlloc_K(_addressLabel);
        
        _mapBtn = [UIButton new];
        [self addSubview:_mapBtn];
        
        
    }
    return self;
}



- (void)setName:(NSString *)name address:(NSString *)address{
    CGRect frame = [self frame];
    
    
    LabelSet(_nameLabel, name, ME_COLOR_666666, 15, moreDic, moreSize);
    
    _nameLabel.frame = FRAMEMAKE_F(15, ViewFromX_Y * 2, moreSize.width, moreSize.height);
    
    LabelSet(_addressLabel, address, ME_COLOR_CELLTEXTLABEL, 14, addressDic,addressSize);
    
    _addressLabel.frame = FRAMEMAKE_F(15, CGRectGetMaxY(_nameLabel.frame) + 15, addressSize.width, addressSize.height);

    frame.size.height = CGRectGetHeight(_nameLabel.frame) + CGRectGetHeight( _addressLabel.frame)+ 40 + 15;
    
    
    
    
    
    LabelSet(_mapLabel, @"进入地图", H_MAP, 13, mapDic, mapSize);
    
    _mapLabel.frame = FRAMEMAKE_F(WIDTH_K - mapSize.width - 15, 20, mapSize.width, mapSize.height);
    
//    _mapImage.image = [UIImage imageNamed:@"h_map"];
//    _mapImage.frame = FRAMEMAKE_F(WIDTH_K - 15 - _mapImage.image.size.width, 20,  _mapImage.image.size.width,  _mapImage.image.size.height);
    
    
    UIImage *phoneImg = [UIImage imageNamed:@"h_map"];
    [_mapBtn setImage:phoneImg  forState:UIControlStateNormal];
    [_mapBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    _mapBtn.frame = FRAMEMAKE_F(WIDTH_K - 15 - CGRectGetWidth(_mapLabel.frame) - phoneImg.size.width - 5, CGRectGetMinY( _mapLabel.frame) , phoneImg.size.width + mapSize.width + 5, phoneImg.size.height);
    
    
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 30,  1);
    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
