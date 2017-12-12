//
//  FBaseView.m
//  F_Funny
//
//  Created by Apple on 16/7/6.
//  Copyright © 2016年 FangXiangAn. All rights reserved.
//

#import "FBaseView.h"

@implementation FBaseView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = _cornerRadius;
}

- (void)setBcolor:(UIColor *)bcolor{
    _bcolor = bcolor;
    self.layer.borderColor = _bcolor.CGColor;
}

- (void)setBwidth:(CGFloat)bwidth{
    _bwidth = bwidth;
    self.layer.borderWidth = _bwidth;
}

@end
