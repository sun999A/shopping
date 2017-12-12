//
//  AheadViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/9.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "AheadViewCell.h"

@implementation AheadViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _selectImg = [[UIImageView alloc]init];
        [self addSubview:_selectImg];
        
        CellImage_K(_headView);
        
        CellLabelAlloc_K(_nameLab);
    }
    return self;
}
-(void)userNameImages:(NSString *)name{
    CGRect frame = [self frame];
    frame.size.height = 70;
  

    LabelSet(_nameLab, name, H_SHOPNAME, 16, numDic, numSize);
    _nameLab.frame = FRAMEMAKE_F(15, (frame.size.height - numSize.height) / 2, numSize.width, numSize.height);
    
    
    UIImage *seleImg = [UIImage imageNamed:@"m_rjiantou"];
    [_selectImg setImage:seleImg];
    _selectImg.frame =FRAMEMAKE_F(WIDTH_K - 15 - seleImg.size.width,(frame.size.height - seleImg.size.height)/2, seleImg.size.width, seleImg.size.height);
    
    _headView.frame = FRAMEMAKE_F(WIDTH_K - 30 - seleImg.size.width - 60, 5, 60, 60);
    _headView.contentMode = UIViewContentModeScaleAspectFit;
    _headView.aliCornerRadius = 30;
    
    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
