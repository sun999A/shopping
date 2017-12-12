//
//  TimeLimViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/16.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "TimeLimViewCell.h"

@implementation TimeLimViewCell
{
    __strong UIImageView *line2;
    __strong UIImageView *line;
    __strong UIImageView *line1;
     __strong UIImageView *line3;
    __strong UIImageView *line4;
    __strong UIImageView *line5;
    
    __strong UILabel *newLab;
    __strong UILabel *exploLab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellImage_K(line2);
        CellImage_K(line);
        CellImage_K(line1);
        
        CellLabelAlloc_K(_leftName);
        CellImage_K(_leftImg);
        CellImage_K(_photoImg);
        CellLabelAlloc_K(_leftTitle);
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_leftBtn];
        
        CellLabelAlloc_K(_centerName);
        CellImage_K(_centerImg);
        CellLabelAlloc_K(newLab);
        CellLabelAlloc_K(_centerTitle);
        _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_centerBtn];
        
        CellLabelAlloc_K(_rightName);
        CellImage_K(_rightImg);
        CellLabelAlloc_K(_rightTitle);
        CellLabelAlloc_K(exploLab);
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_rightBtn];
        
        CellImage_K(line3);
        CellImage_K(line4);
        CellImage_K(line5);
        
        _clockView = [[GGClockView alloc] init];
        [self addSubview:_clockView];
    }
    return self;
}
-(void)setLeftTitle:(NSString *)leftT centerTitle:(NSString *)centerT  rightTitle:(NSString *)rightT time:(NSInteger)time{
    CGRect frame = [self frame];
    [line3 setImage:[UIImage imageNamed:@"hang"]];
    line3.frame = FRAMEMAKE_F(15, 0, WIDTH_K - 30, 1);
    
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS){
        _leftImg.image = [UIImage imageNamed:@"h_timelimit5s"];
    }else{
        _leftImg.image = [UIImage imageNamed:@"h_timelimit"];
        
    }
    _leftImg.frame = FRAMEMAKE_F((WIDTH_K / 2 - 20 - _leftImg.image.size.width) / 2, 10, _leftImg.image.size.width, _leftImg.image.size.height);
    
//    _leftTitle.text = leftT;
//   // _leftTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
//    _leftTitle.textColor = [UIColor blackColor];
//    NSDictionary *leftDic = StringFont_DicK(_leftTitle.font);
//    CGSize leftSize = [_leftTitle.text sizeWithAttributes:leftDic];
//    _leftTitle.frame = FRAMEMAKE_F(CGRectGetMinX(_leftImg.frame), CGRectGetMaxY(_leftImg.frame) + 2, leftSize.width, leftSize.height);
    _clockView.time = time;
    _clockView.timeBackgroundColor = ME_COLOR_666666;
    _clockView.timeTextColor = [UIColor whiteColor];
    _clockView.colonColor = ME_COLOR_666666;
    _clockView.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    _clockView.frame = FRAMEMAKE_F(CGRectGetMinX(_leftImg.frame), CGRectGetMaxY(_leftImg.frame) + 2, 70, 20);

    
     _photoImg.frame = FRAMEMAKE_F(CGRectGetMinX(_leftImg.frame), CGRectGetMaxY(_clockView.frame) + 5, 115, 115);
    _photoImg.contentMode = UIViewContentModeScaleAspectFit;
    frame.size.height = CGRectGetHeight(_leftImg.frame) + CGRectGetHeight(_clockView.frame) + CGRectGetHeight( _photoImg.frame) + 22;
    
    [line setImage:[UIImage imageNamed:@"shu"]];
    line.frame = FRAMEMAKE_F(14, 0, 1, frame.size.height);
    
    [line1 setImage:[UIImage imageNamed:@"shu"]];
    line1.frame = FRAMEMAKE_F(WIDTH_K / 2 - 20 - 1, 0, 1, frame.size.height);
    
    [line4 setImage:[UIImage imageNamed:@"shu"]];
    line4.frame = FRAMEMAKE_F(WIDTH_K - 15, 0, 1, frame.size.height);
    
    [line5 setImage:[UIImage imageNamed:@"hang"]];
    line5.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 30, 1);

    
    _centerTitle.text = centerT;
    _centerTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    _centerTitle.textColor = H_NEWPRO;
    NSDictionary *centerDic = StringFont_DicK(_centerTitle.font);
    CGSize centerSize = [_centerTitle.text sizeWithAttributes:centerDic];
    _centerTitle.frame = FRAMEMAKE_F(WIDTH_K / 2-20 + 30, 30, centerSize.width, centerSize.height);
    
    LabelSet(newLab, @"最新上市", ME_COLOR_CELLTEXTLABEL, 12, newDic, newSize);
    newLab.frame = FRAMEMAKE_F(CGRectGetMinX(_centerTitle.frame),  CGRectGetMaxY(_centerTitle.frame) + 9, newSize.width, newSize.height);
    
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS){
         _centerImg.image = [UIImage imageNamed:@"h_newpro5s"];
    }else{
        _centerImg.image = [UIImage imageNamed:@"h_newpro"];
        
    }

    _centerImg.frame = FRAMEMAKE_F(WIDTH_K  - _centerImg.image.size.width - 21, (frame.size.height / 2 - _centerImg.image.size.height) / 2, _centerImg.image.size.width, _centerImg.image.size.height);
    
    [line2 setImage:[UIImage imageNamed:@"hang"]];
    line2.frame = FRAMEMAKE_F( CGRectGetMaxX(line1.frame), frame.size.height / 2 - 1, WIDTH_K - CGRectGetMaxX(line1.frame) - 15, 1);
    
    
    _rightTitle.text = rightT;
    _rightTitle.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    _rightTitle.textColor = H_EXPLO;
    NSDictionary *rightDic = StringFont_DicK(_rightTitle.font);
    CGSize rightSize = [_rightTitle.text sizeWithAttributes:rightDic];
    _rightTitle.frame = FRAMEMAKE_F(CGRectGetMinX(_centerTitle.frame), frame.size.height / 2 + 30, rightSize.width, rightSize.height);
    
    LabelSet(exploLab, @"好礼享不停", ME_COLOR_CELLTEXTLABEL, 12, exploDic, exploSize);
    exploLab.frame = FRAMEMAKE_F(CGRectGetMinX(_rightTitle.frame),  CGRectGetMaxY(_rightTitle.frame) + 9, exploSize.width, exploSize.height);
    
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS){
       _rightImg.image = [UIImage imageNamed:@"h_explosive5s"];
    }else{
        _rightImg.image = [UIImage imageNamed:@"h_explosive"];
        
    }

    _rightImg.frame = FRAMEMAKE_F(CGRectGetMinX(_centerImg.frame), (frame.size.height / 2 - _rightImg.image.size.height) / 2 + frame.size.height / 2, _rightImg.image.size.width, _rightImg.image.size.height);
    _rightImg.userInteractionEnabled = YES;
    
    _leftBtn.frame = FRAMEMAKE_F(15, 0, WIDTH_K / 2 - 20 - 15, frame.size.height);
    _centerBtn.frame = FRAMEMAKE_F(CGRectGetMaxX( _leftBtn.frame), 0, WIDTH_K - CGRectGetMaxX( _leftBtn.frame) - 15, frame.size.height / 2);
    _rightBtn.frame = FRAMEMAKE_F(CGRectGetMaxX( _leftBtn.frame), frame.size.height / 2,WIDTH_K - CGRectGetMaxX( _leftBtn.frame) - 15, frame.size.height / 2);
    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
