//
//  CommentViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "CommentViewCell.h"
#import "DYRateView.h"
@implementation CommentViewCell
{
    DYRateView *rateView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellLabelAlloc_K(_commentLabel);
        CellLabelAlloc_K(_starLabel);
        CellImage_K(_line);
        rateView = [[DYRateView alloc] init];
        [self addSubview:rateView];
        
        
    }
    return self;
}
- (void)setShopStarNum:(NSString *)starNum  star:(float)star{
    CGRect frame = [self frame];
    
    frame.size.height = 55;
    
    
    LabelSet(_commentLabel, @"评论", ME_COLOR_666666, 15, commentDic, commentSize);
    _commentLabel.frame = FRAMEMAKE_F( 15,  (frame.size.height - commentSize.height) / 2, commentSize.width, commentSize.height);
    
    LabelSet(_starLabel, starNum, H_SCORE, 14, starDic, starSize);
    _starLabel.frame = FRAMEMAKE_F(WIDTH_K - starSize.width - 15,  (frame.size.height - starSize.height) / 2, starSize.width, starSize.height);
    
    //星星
    rateView.frame = FRAMEMAKE_F(WIDTH_K - 15 - CGRectGetWidth(_starLabel.frame) - 80 - 5, (frame.size.height - 20) / 2 + 4, 80, 20);
    rateView.isshow = YES;
    rateView.rate = star;
    rateView.alignment = RateViewAlignmentLeft;
    
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 30,  1);

    self.frame = frame;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
