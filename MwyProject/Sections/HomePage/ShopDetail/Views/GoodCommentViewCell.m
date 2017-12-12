//
//  GoodCommentViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodCommentViewCell.h"

@implementation GoodCommentViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _nameImg = [UIImageView new];
        [self addSubview:_nameImg];
        
        _nameLab = [UILabel new];
        [self addSubview:_nameLab];
        
        _timeLab = [UILabel new];
        [self addSubview:_timeLab];
        
        _contentLab = [UILabel new];
        [self addSubview:_contentLab];
        
        CellImage_K(_line);
       
    }
    return self;
}


- (void)setName:(NSString *)name content:(NSString *)content time:(NSString *)time{
    CGRect frame = [self frame];
    
    _nameImg.frame = FRAMEMAKE_F( ViewFromX_Y + 5, ViewFromX_Y + 5, 28, 28);
    _nameImg.aliCornerRadius = 28 / 2;
//    _nameImg.layer.cornerRadius = 22.5;
//    _nameImg.layer.masksToBounds = YES;
    
    LabelSet(_nameLab, name, ME_COLOR_666666, 14, nameDic, nameSize);
    _nameLab.frame = FRAMEMAKE_F(CGRectGetMaxX(_nameImg.frame) + 10, 18, nameSize.width, nameSize.height);
    
    
    _contentLab.font = TITLEFONT_14;
    _contentLab.text = content;
    _contentLab.numberOfLines = 0;
    _contentLab.textColor = H_SUBSTRACT;
    CGSize newSize = [_contentLab boundingRectWithSize:CGSizeMake(WIDTH_K -  30, 0)];
    
    _contentLab.frame = FRAMEMAKE_F(15, CGRectGetMaxY(_nameImg.frame) + 15, newSize.width, newSize.height);
    
    

    
    LabelSet(_timeLab, time, H_GOODSEARCH, 14, timeDic, timeSize);
    _timeLab.frame = FRAMEMAKE_F( 15 , CGRectGetMaxY( _contentLab.frame) + 15, timeSize.width, timeSize.height);
    
    
    
    
    frame.size.height = CGRectGetHeight(_nameLab.frame) + CGRectGetHeight(_contentLab.frame) + CGRectGetHeight(_timeLab.frame) + 15 * 4;
    
    
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(0 , frame.size.height - 1, WIDTH_K, 1);
    //_view.frame = FRAMEMAKE_F(ViewFromX_Y * 2, 0, WIDTH_K - ViewFromX_Y * 4 + 6, frame.size.height);
    self.frame = frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
