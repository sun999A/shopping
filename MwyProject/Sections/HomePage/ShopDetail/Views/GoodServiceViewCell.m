//
//  GoodServiceViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodServiceViewCell.h"

@implementation GoodServiceViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier nameArr:(NSArray *)nameArr{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        CellImage_K(_photoImg);
//        CellLabelAlloc_K(_nameLabel);
        
        
        
        CellLabelAlloc_K(_shopLabel);
        
        CGRect frame = [self frame];
        LabelSet(_shopLabel, @"买家服务", H_SHOPNAME, 16, moreDic, moreSize);
        _shopLabel.frame = FRAMEMAKE_F( (WIDTH_K - moreSize.width) / 2, 20, moreSize.width, moreSize.height);
        
        for (int i = 0; i < nameArr.count; i++) {
            
            _photoImg = [UIImageView new];
            _nameLabel = [UILabel new];
            _photoImg.image = [UIImage imageNamed:@"g_dui"];
            
            
            LabelSet(_nameLabel, nameArr[i], H_SUBSTRACT, 14, nameDic, nameSize);
            _nameLabel.frame = FRAMEMAKE_F((22 + _photoImg.image.size.width)*(i + 1) + (nameSize.width + 5) * i, CGRectGetMaxY(_shopLabel.frame) + ViewFromX_Y * 2, nameSize.width, nameSize.height);
            
            _photoImg.frame = FRAMEMAKE_F(15 * (i  + 1) + (12 + CGRectGetWidth(_nameLabel.frame) + _photoImg.image.size.width) * i, CGRectGetMaxY(_shopLabel.frame) + ViewFromX_Y * 2 + 1, _photoImg.image.size.width, _photoImg.image.size.height)
            
            [self addSubview:_photoImg];
            [self addSubview:_nameLabel];
        }
        
        frame.size.height = CGRectGetHeight(_shopLabel.frame) + CGRectGetHeight( _nameLabel.frame) + 40 + 20;
        self.frame = frame;
        
        
        
    }
    return self;
}


- (void)setShop:(NSString *)shop nameArr:(NSArray *)nameArr{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
