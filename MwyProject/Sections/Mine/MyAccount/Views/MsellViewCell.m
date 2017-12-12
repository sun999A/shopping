//
//  MsellViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/6.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MsellViewCell.h"

@implementation MsellViewCell{
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
        imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        
        labelText = [[UILabel alloc]init];
        [self addSubview:labelText];
        
        _lineView = [[UIImageView alloc]init];
        [self addSubview:_lineView];
        
        _selectImg = [[UIImageView alloc]init];
        [self addSubview:_selectImg];
        
        CellLabelAlloc_K(_numLab);
    }
    return self;
}
-(void)userNameImages:(NSString *)nameImage userNameString:(NSString *)string num:(NSString *)num{
    CGRect frame = [self frame];
    frame.size.height = 50;
    [imageView setImage:[UIImage imageNamed:nameImage]];
    imageView.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, (frame.size.height - imageView.image.size.height) / 2, imageView.image.size.width, imageView.image.size.height);
    
    [_lineView setImage:[UIImage imageNamed:@"hang"]];
    _lineView.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    [labelText setText:string];
    labelText.font = [UIFont systemFontOfSize:15];
    labelText.textColor = H_SHOPNAME;
    NSDictionary *labelDic = StringFont_DicK(labelText.font);
    CGSize labelSize = [labelText.text sizeWithAttributes:labelDic];
    labelText.frame = FRAMEMAKE_F(CGRectGetMaxX(imageView.frame) + 10,(frame.size.height - labelSize.height)/2, labelSize.width, labelSize.height);
    
    
    
    
    UIImage *seleImg = [UIImage imageNamed:@"m_rjiantou"];
    [_selectImg setImage:seleImg];
    _selectImg.frame =FRAMEMAKE_F(WIDTH_K - 15 - seleImg.size.width,(frame.size.height - seleImg.size.height)/2, seleImg.size.width, seleImg.size.height);
    
    LabelSet(_numLab, num, ME_COLOR_CELLTEXTLABEL, 14, numDic, numSize);
    _numLab.frame = FRAMEMAKE_F(WIDTH_K - 30 - CGRectGetWidth(_selectImg.frame) - numSize.width, (frame.size.height - numSize.height) / 2, numSize.width, numSize.height);
    
    
    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
