//
//  ShopIntroViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "ShopIntroViewCell.h"

@implementation ShopIntroViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellLabelAlloc_K(_nameLabel);
        CellLabelAlloc_K(_detailLabel);
        CellImage_K(_line);
      
        
        
    }
    return self;
}

- (void)setName:(NSString *)name detail:(NSString *)detail{
    CGRect frame = [self frame];
    
    
    LabelSet(_nameLabel, name, ME_COLOR_666666, 15, nameDic, nameSize);
    _nameLabel.frame = FRAMEMAKE_F( 15,  20, nameSize.width, nameSize.height);

    _detailLabel.font = [UIFont systemFontOfSize:14];
    _detailLabel.text = detail;
    _detailLabel.numberOfLines = 0;
    _detailLabel.textColor = ME_COLOR_666666;
    CGSize newSize = [_detailLabel boundingRectWithSize:CGSizeMake(WIDTH_K - 30, 0)];
    
    _detailLabel.frame = FRAMEMAKE_F(15, CGRectGetMaxY(_nameLabel.frame) + 15, newSize.width, newSize.height);
    frame.size.height = CGRectGetHeight(_nameLabel.frame) + CGRectGetHeight( _detailLabel.frame) + 35;
   
    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
