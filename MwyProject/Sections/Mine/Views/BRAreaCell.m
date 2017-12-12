//
//  BRAreaCell.m
//  LitongProject
//
//  Created by Snail iOS on 16/11/8.
//  Copyright © 2016年 Feiyu iOS. All rights reserved.
//

#import "BRAreaCell.h"

@implementation BRAreaCell

{
    __strong UIImageView *line;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellLabelAlloc_K(_label);
        CellLabelAlloc_K(_date);
        CellImage_K(line);
        _seled = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_seled];
    }
    return self;
}
-(void)setLabel:(NSString *)string date:(NSString *)text{
    CGRect frame = [self frame];
    LabelSet(_label, string, H_SHOPNAME, 15, labelDic, labelSize);
    _label.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, ViewFromX_Y, labelSize.width, labelSize.height);
    frame.size.height = (ViewFromX_Y * 3)+labelSize.height;
    
  
    frame.size.height = (ViewFromX_Y *2)+ labelSize.height;
    
    
    UIImage *image = [UIImage imageNamed:@"s_select"];
     UIImage *imaged = [UIImage imageNamed:@"s_selected"];
    [_seled setImage:image forState:UIControlStateNormal];
    [_seled setImage:imaged forState:UIControlStateSelected];
    _seled.frame = FRAMEMAKE_F(WIDTH_K - 15 - image.size.width, (frame.size.height - image.size.height) / 2, image.size.width, image.size.height);
    
    
    
    
    [line setImage:[UIImage imageNamed:@"hang"]];
    line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    self.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
