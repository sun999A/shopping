//
//  MheadViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MheadViewCell.h"

@implementation MheadViewCell
@synthesize line;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _img = [[UIImageView alloc]init];
        [self addSubview:_img];
        
        line = [[UIImageView alloc]init];
        [self addSubview:line];
        
        _build = [[UILabel alloc]init];
        [self addSubview:_build];
        
        CellLabelAlloc_K(_name);
    }
    return self;
}

-(void)setTableViewName:(NSString *)name build:(NSString *)build{
    CGRect frame = [self frame];
    _img.frame = FRAMEMAKE_F((WIDTH_K - _img.image.size.width)/2, 70, _img.image.size.width,_img.image.size.width);
    
    LabelSet(_name, name, ME_COLOR_666666, 19, nameDic, nameSize);
    
    _name.frame = FRAMEMAKE_F((WIDTH_K - nameSize.width)/2, CGRectGetMaxY(_img.frame) + 10, nameSize.width, nameSize.height);
    
    
    _build.text = build;
    _build.textColor = ME_COLOR_CELLTEXTLABEL;
    _build.font = [UIFont systemFontOfSize:15];
    NSDictionary *buDic = StringFont_DicK(_build.font);
    CGSize buSize = [_build.text sizeWithAttributes:buDic];
    _build.frame = FRAMEMAKE_F((WIDTH_K - buSize.width)/2, CGRectGetMaxY(_name.frame) + 10, buSize.width, buSize.height);
    
    frame.size.height = CGRectGetHeight(_img.frame) + CGRectGetHeight(_name.frame) + CGRectGetHeight(_build.frame) + 90 + 60;
    [line setImage:[UIImage imageNamed:@"hang"]];
    line.frame = FRAMEMAKE_F(15 , frame.size.height - 1, WIDTH_K - 30, 1);
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
