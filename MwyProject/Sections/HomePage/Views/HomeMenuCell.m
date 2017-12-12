//
//  HomeMenuCell.m
//  meituan
//
//  Created by jinzelu on 15/6/30.
//  Copyright (c) 2015年 jinzelu. All rights reserved.
//

#import "HomeMenuCell.h"

@interface HomeMenuCell ()<UIScrollViewDelegate>
{
    UIView *_backView1;
    UIView *_backView2;
    UIView *_backView3;
    UIPageControl *_pageControl;
}

@end

@implementation HomeMenuCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier imageArray:(NSArray *)imageArray titleArray:(NSArray *)titleArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        _backView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_K, 196)];
        _backView2 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH_K, 0, WIDTH_K, 196)];
         _backView3 = [[UIView alloc] initWithFrame:CGRectMake(WIDTH_K * 2, 0, WIDTH_K, 196)];
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_K, 216)];
        scrollView.contentSize = CGSizeMake(3*WIDTH_K, 216);
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        
        [scrollView addSubview:_backView1];
        [scrollView addSubview:_backView2];
         [scrollView addSubview:_backView3];
        [self addSubview:scrollView];
        
        //创建8个
        for (int i = 0; i < 20; i++) {
            if (i < 4) {
                CGRect frame = CGRectMake(i*WIDTH_K/4, 0, WIDTH_K/4, 98);
//                NSString *title = [menuArray[i] objectForKey:@"title"];
//                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                NSString *title = titleArray[i];
                NSString *imageStr = imageArray[i];
                JZMTBtnView *btnView = [[JZMTBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_backView1 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
                
            }else if(i<8){
                CGRect frame = CGRectMake((i-4)*WIDTH_K/4, 90, WIDTH_K/4, 98);
                NSString *title = titleArray[i];
                NSString *imageStr = imageArray[i];
                JZMTBtnView *btnView = [[JZMTBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_backView1 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }else if(i < 12){
                CGRect frame = CGRectMake((i-8)*WIDTH_K/4, 0, WIDTH_K/4, 98);
                NSString *title = titleArray[i];
                NSString *imageStr = imageArray[i];
                JZMTBtnView *btnView = [[JZMTBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_backView2 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }else if(i < 16){
                CGRect frame = CGRectMake((i-12)*WIDTH_K/4, 90, WIDTH_K/4, 98);
                NSString *title = titleArray[i];
                NSString *imageStr = imageArray[i];
                JZMTBtnView *btnView = [[JZMTBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_backView2 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }else{
                CGRect frame = CGRectMake((i-16)*WIDTH_K/4, 0, WIDTH_K/4, 98);
                NSString *title = titleArray[i];
                NSString *imageStr = imageArray[i];
                JZMTBtnView *btnView = [[JZMTBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_backView3 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }
        }
        
        //
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(WIDTH_K/2-20, 186, 0, 20)];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 3;
//        self.backgroundColor = [UIColor redColor];
        [self addSubview:_pageControl];
        [_pageControl setCurrentPageIndicatorTintColor:H_DOT];
        [_pageControl setPageIndicatorTintColor:H_DOTONE];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)OnTapBtnView:(UITapGestureRecognizer *)sender{
    NSLog(@"tag:%ld",sender.view.tag);
    self.push((int)sender.view.tag);
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    _pageControl.currentPage = page;
}


@end
