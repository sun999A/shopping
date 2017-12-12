//
//  SearchHisViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "SearchHisViewCell.h"

@implementation SearchHisViewCell{
    __strong UIImageView *imageView;
    __strong UILabel     *labelText;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _nameLab = [[UILabel alloc]init];
        [self addSubview:_nameLab];
        
        _lineView = [[UIImageView alloc]init];
        [self addSubview:_lineView];
        
    }
    return self;
}
-(void)setName:(NSString *)name{
    CGRect frame = [self frame];
    frame.size.height = 45;
    
    [_lineView setImage:[UIImage imageNamed:@"hang"]];
    _lineView.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 30, 1);
    
    [_nameLab setText:name];
    _nameLab.font = [UIFont systemFontOfSize:14];
    _nameLab.textColor = ME_COLOR_CELLTEXTLABEL;
    NSDictionary *labelDic = StringFont_DicK(_nameLab.font);
    CGSize labelSize = [_nameLab.text sizeWithAttributes:labelDic];
    _nameLab.frame = FRAMEMAKE_F(15, (frame.size.height - labelSize.height)/2, labelSize.width, labelSize.height);
    
    self.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
