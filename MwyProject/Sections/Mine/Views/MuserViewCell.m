//
//  MuserViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/17.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "MuserViewCell.h"


@implementation MuserViewCell

{
    __strong UIImageView *imageView;
    __strong UILabel     *labelText;
    __strong UILabel     *_moreLabel;
}

@synthesize moreImage;

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
        
        CellImage_K(moreImage);
        CellLabelAlloc_K(_moreLabel);
        
        _moreButton = [UIButton new];
        [self addSubview:_moreButton];
        
    }
    return self;
}
-(void)userNameImages:(NSString *)nameImage userNameString:(NSString *)string{
    CGRect frame = [self frame];
    [imageView setImage:[UIImage imageNamed:nameImage]];
    imageView.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, 15, imageView.image.size.width, imageView.image.size.height);
    frame.size.height = 30 + imageView.image.size.height;
    
    [_lineView setImage:[UIImage imageNamed:@"hang"]];
    _lineView.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    [labelText setText:string];
    labelText.font = [UIFont systemFontOfSize:15];
    labelText.textColor = H_SHOPNAME;
    NSDictionary *labelDic = StringFont_DicK(labelText.font);
    CGSize labelSize = [labelText.text sizeWithAttributes:labelDic];
    labelText.frame = FRAMEMAKE_F(25 + imageView.image.size.width,15 + (frame.size.height - labelSize.height - 30)/2, labelSize.width, labelSize.height);
    
    //    UIImage *seleImg = [UIImage imageNamed:@"m_qianjin"];
    //    [_selectImg setImage:seleImg];
    //    _selectImg.frame =FRAMEMAKE_F(WIDTH_K - 10 - seleImg.size.width,(frame.size.height - seleImg.size.height)/2, seleImg.size.width, seleImg.size.height);
    
   
    moreImage.image = [UIImage imageNamed:@"m_rjiantou"];
    moreImage.frame = FRAMEMAKE_F(WIDTH_K - 15 - moreImage.image.size.width, (frame.size.height - moreImage.image.size.height) / 2,  moreImage.image.size.width,  moreImage.image.size.height);
    
   
    LabelSet(_moreLabel, @"全部订单", ME_COLOR_CELLTEXTLABEL, 14, moreDic, moreSize);
    
    _moreLabel.frame = FRAMEMAKE_F(WIDTH_K - moreSize.width - 20 - CGRectGetWidth(moreImage.frame), (frame.size.height - moreSize.height) / 2, moreSize.width, moreSize.height);
    
    [_moreButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    _moreButton.frame = FRAMEMAKE_F(WIDTH_K - LABLEIMAGE_K * 2 - moreSize.width - CGRectGetWidth(moreImage.frame) , _moreLabel.frame.origin.y, moreSize.width + CGRectGetWidth(moreImage.frame) + 5, moreSize.height);
    
    self.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
