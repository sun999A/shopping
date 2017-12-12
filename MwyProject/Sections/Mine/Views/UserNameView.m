//
//  UserNameVIew.m
//  Teaism
//
//  Created by ike on 15/10/29.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "UserNameView.h"

@implementation UserNameView{
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
    self.frame = frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
