//
//  CommentCollectionViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "CommentCollectionViewCell.h"
#import "DYRateView.h"
@implementation CommentCollectionViewCell
{
    DYRateView *rateView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
         self.backgroundColor = [UIColor whiteColor];
        CellLabelAlloc_K(_commentLabel);
        CellLabelAlloc_K(_starLabel);
       
        rateView = [[DYRateView alloc] init];
        [self addSubview:rateView];
        
        
    }
    return self;
}

- (void)setShopStarNum:(NSString *)starNum  star:(float)star{
    CGRect frame = [self frame];
    
    frame.size.height = 45;
    
    
    LabelSet(_commentLabel, @"评论", ME_COLOR_666666, 18, commentDic, commentSize);
    _commentLabel.frame = FRAMEMAKE_F( 15,  (frame.size.height - commentSize.height) / 2, commentSize.width, commentSize.height);
    
    
    //星星
    rateView.frame = FRAMEMAKE_F(CGRectGetMaxX(_commentLabel.frame) + 12, (frame.size.height - 20) / 2 + 4, 80, 20);
    rateView.isshow = YES;
    rateView.rate = star;
    rateView.alignment = RateViewAlignmentLeft;
    
    
    LabelSet(_starLabel, starNum, H_SCORE, 14, starDic, starSize);
    _starLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(rateView.frame) + 5,  (frame.size.height - starSize.height) / 2, starSize.width, starSize.height);
    self.frame = frame;

}

@end
