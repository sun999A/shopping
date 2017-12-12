//
//  GoodSelectViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodSelectViewCell.h"

@implementation GoodSelectViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _selectImg = [[UIImageView alloc]init];
        [self addSubview:_selectImg];
        
        _nameLab = [[UILabel alloc]init];
        [self addSubview:_nameLab];
        
       
        
    }
    return self;
}
-(void)userNameString:(NSString *)string{
    CGRect frame = [self frame];
   
    frame.size.height = 45;
    
    
    [_nameLab setText:string];
    _nameLab.font = [UIFont systemFontOfSize:14];
    _nameLab.textColor = ME_COLOR_666666;
    NSDictionary *labelDic = StringFont_DicK(_nameLab.font);
    CGSize labelSize = [_nameLab.text sizeWithAttributes:labelDic];
    _nameLab.frame = FRAMEMAKE_F(15,(frame.size.height - labelSize.height)/2, labelSize.width, labelSize.height);
    
    UIImage *seleImg = [UIImage imageNamed:@"m_rjiantou"];
    [_selectImg setImage:seleImg];
    _selectImg.frame =FRAMEMAKE_F(WIDTH_K - 15 - seleImg.size.width,(frame.size.height - seleImg.size.height)/2, seleImg.size.width, seleImg.size.height);

    
   
    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
