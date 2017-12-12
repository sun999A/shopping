//
//  JZMTBtnView.m
//  meituan
//  自定义美团菜单view
//  Created by jinzelu on 15/6/30.
//  Copyright (c) 2015年 jinzelu. All rights reserved.
//

#import "JZMTBtnView.h"

@implementation JZMTBtnView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame title:(NSString *)title imageStr:(NSString *)imageStr{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2-24, 15, 48, 48)];
        imageView.image = [UIImage imageNamed:imageStr];
        [self addSubview:imageView];
        
        //
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 15+48 + 5, frame.size.width, 20)];
        titleLable.text = title;
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.textColor = SLABEL_ONE;
        titleLable.font = [UIFont systemFontOfSize:14];
        [self addSubview:titleLable];
    }
    return self;
}

@end
