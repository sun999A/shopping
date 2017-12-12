//
//  RootView.m
//  CaCoProject
//
//  Created by lanouhn on 15-9-2.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootView.h"


@implementation RootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews
{
//    self.backgroundColor = [UIColor redColor];
    
    
    self.scrollerView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollerView.contentSize = CGSizeMake(WIDTH_K * 2, HEIGHT_K);
    self.scrollerView.pagingEnabled = YES;
    self.scrollerView.bounces = NO;
    
    
    [self addSubview:self.scrollerView];
   
    

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
