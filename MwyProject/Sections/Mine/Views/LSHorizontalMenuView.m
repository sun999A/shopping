//
//  LSHorizontalMenuView.m
//  NingxiaInternational
//
//  Created by  tsou117 on 15/6/3.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//
#define kColor_line ME_COLOR_666666
#define kColor_lanWithAlpha NAV_BG_COLOR

#import "LSHorizontalMenuView.h"

@implementation LSHorizontalMenuView
{
    UIScrollView* rootScrollView;
    CGFloat content_w;
    NSMutableArray* itemArr;
    
    NSInteger selectedIndex;
    UILabel* moveLb;
    
    //color

    //分割线
    NSMutableArray* lines;
    
}
@synthesize delegate = _delegate;
@synthesize normalColor = _normalColor;
@synthesize selectedColor = _selectedColor;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.backgroundColor = [UIColor whiteColor];
        
        //
        rootScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        rootScrollView.showsHorizontalScrollIndicator = NO;
        rootScrollView.scrollsToTop = NO;
        [self addSubview:rootScrollView];
        
        //初始
        content_w = 0;
        itemArr = [NSMutableArray array];
        _normalColor = [UIColor redColor];
        _selectedColor = kColor_lanWithAlpha;
        
        moveLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 2)];
        moveLb.backgroundColor = _selectedColor;
        moveLb.clipsToBounds = YES;
        [rootScrollView addSubview:moveLb];

    }
    return self;
}

- (void)setButtonTitles:(NSArray*)titles canMove:(BOOL)canmove index:(NSInteger)index{
    //
   
    selectedIndex = index;
    
    if (titles.count == 0 || titles == nil) {
        return;
    }
    
    //
    for (LSBarItem* obj in itemArr) {
        [obj removeFromSuperview];
    }
    [itemArr removeAllObjects];
    
    if (canmove) {
        /*
         1,可无限添加
         2,下划线与文字等宽
         3,按钮长度随文字长度而变化
         */
        for (int i = 0; i< titles.count; i++) {
            LSBarItem* item = [[LSBarItem alloc] initWithTitle:titles[i]];
            NSLog(@"-----title%@", titles[i]);
            item.titleLabel.textColor = _normalColor;
            item.tag = 100+i;
            [rootScrollView addSubview:item];
            
            item.frame = CGRectMake(content_w, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
            
            content_w += item.bounds.size.width;
            
            [itemArr addObject:item];
            
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionofSelectItem:)];
            [item addGestureRecognizer:tap];
            
            
        }
    }else{
        /*
         按钮不会溢出屏幕宽度 指定宽度为 屏幕宽/个数 每个按钮等宽
         */
        for (int i = 0; i< titles.count; i++) {
            LSBarItem* item = [[LSBarItem alloc] initWithTitle:titles[i] itemWidth:WIDTH_K/titles.count];
            item.titleLabel.textColor = _normalColor;
            item.tag = 100+i;
            [rootScrollView addSubview:item];
            
            item.frame = CGRectMake(content_w, item.frame.origin.y, item.frame.size.width, item.frame.size.height);
            
            content_w += item.bounds.size.width;
            
            [itemArr addObject:item];
            
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(actionofSelectItem:)];
            [item addGestureRecognizer:tap];
            
        }
    }
    
    //
    
    CGFloat item_jx = 0;
    
    if (content_w < self.bounds.size.width) {
        //
        item_jx = (self.bounds.size.width-content_w)/(itemArr.count+1);
        
        CGFloat add_w = item_jx;
        
        for (int i = 0; i< itemArr.count; i++) {
            LSBarItem* item = (LSBarItem*)itemArr[i];
            //
            
            item.frame = CGRectMake(add_w, 0, item.frame.size.width, item.frame.size.height);
            
            
            add_w += item_jx+item.frame.size.width;
        }
    }
    
    //添加栏目分割线
    [self showFengeLineWithItemjx:item_jx];
    
    //
    LSBarItem* item = (LSBarItem*)itemArr[selectedIndex];
    item.titleLabel.textColor = _selectedColor;
    moveLb.frame = CGRectMake(item.frame.origin.x+(item.frame.size.width-item.titleLabel.frame.size.width)/2, self.frame.size.height-moveLb.frame.size.height, item.titleLabel.frame.size.width, moveLb.frame.size.height);
    
    
    //
    rootScrollView.contentSize = CGSizeMake(content_w, self.frame.size.height);
    
    
    //
//    UILabel* line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
//    line.backgroundColor = kColor_line;
//    [self addSubview:line];
    
    self.itemstyle = _itemstyle;

}

#pragma mark - 添加栏目间的分割线
- (void)showFengeLineWithItemjx:(CGFloat)item_jx{
    
    //item间的分割线
    
    lines = [NSMutableArray array];
    
    for (int i = 0; i<itemArr.count; i++) {
        //
        if (i < itemArr.count-1) {
            //
            LSBarItem* item = (LSBarItem*)itemArr[i];
            
            UILabel* line = [[UILabel alloc] initWithFrame:CGRectMake(item.frame.origin.x+item.frame.size.width+item_jx*0.5, 10, 0.5, 20)];
            line.backgroundColor = kColor_line;
            [rootScrollView addSubview:line];
            
            [lines addObject:line];
        }
    }
}

- (void)hiddenFenggeLine{
    
    if (_itemstyle == UIHorItemStyleNone) {
        return;
    }
    
    for (UILabel* line in lines) {
        //
        line.hidden = YES;
    }
    
}

#pragma mark - 选择一个栏目

- (void)actionofSelectItem:(UITapGestureRecognizer*)sender{
    
    NSLog(@"前一个选择%ld",(long)selectedIndex);
    
    
    LSBarItem* beforItem = (LSBarItem*)itemArr[selectedIndex];
    beforItem.titleLabel.textColor = _normalColor;
    
    NSInteger index = sender.view.tag-100;
    selectedIndex = index;
    
    //移动滑块
    LSBarItem* item = (LSBarItem*)itemArr[index];
    
    item.titleLabel.textColor = [self changeTitleLbStatus];
    
    if (content_w > self.frame.size.width){
        //
        if (content_w - item.frame.origin.x-item.frame.size.width <= self.bounds.size.width*0.5) {
            //停止移动,复原
            NSLog(@"stop");
            [rootScrollView setContentOffset:CGPointMake(content_w-self.frame.size.width, 0) animated:YES];
        }else if (item.frame.origin.x > self.bounds.size.width*0.5) {
            //向右移动scrollview
            NSLog(@"move on right");
            [rootScrollView setContentOffset:CGPointMake(item.frame.origin.x-item.frame.size.width*1.5, 0) animated:YES];
        }else{
            [rootScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
    }else{

    }

    
    [UIView animateWithDuration:0.15 animations:^{
        //
        if (_itemstyle == UIHorItemStyleHorLine) {
            //
            moveLb.frame = CGRectMake(item.frame.origin.x+(item.frame.size.width-item.titleLabel.frame.size.width)/2, self.frame.size.height-moveLb.frame.size.height, item.titleLabel.frame.size.width, moveLb.frame.size.height);
        }else if (_itemstyle == UIHorItemStyleRound){
            //
            moveLb.frame = CGRectMake(item.frame.origin.x, item.titleLabel.frame.origin.y-2.5, item.frame.size.width, item.titleLabel.frame.size.height+5);
            moveLb.layer.cornerRadius = moveLb.frame.size.height*0.5;
        }

        
        
    } completion:^(BOOL finished) {
        //
    }];
    
    //delegate
    if ([_delegate respondsToSelector:@selector(menuView:didSelectItemAtIndex:)]) {
        [_delegate menuView:self didSelectItemAtIndex:index];
    }
    
}

//直接去到指定的index
- (void)moveIndex:(NSInteger)moveindex{
    // itemArr
    
    LSBarItem* item = itemArr[moveindex];
    [self actionofSelectItem:item.gestureRecognizers.firstObject];
    
}

#pragma mark - 设置状态颜色

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    if (state == UIControlStateNormal) {
        //
        _normalColor = color;
        for (int i = 0; i< itemArr.count; i++) {
            LSBarItem* item = (LSBarItem*)itemArr[i];
            item.titleLabel.textColor = color;
        }
        
        
    }
    if (state == UIControlStateSelected) {
        //
        _selectedColor = color;
        LSBarItem* item = (LSBarItem*)itemArr[selectedIndex];
        item.titleLabel.textColor = [self changeTitleLbStatus];
        
        moveLb.backgroundColor = color;
    }
}

- (UIColor*)changeTitleLbStatus{
    
    
    return _itemstyle == UIHorItemStyleRound ? [UIColor whiteColor] : _selectedColor;
}

#pragma mark - 设置显示风格

- (void)setItemstyle:(UIHorItemStyle)itemstyle{
    _itemstyle = itemstyle;
    
    
    if (itemArr.count == 0) {
        return;
    }
    LSBarItem* item = (LSBarItem*)itemArr[selectedIndex];
    item.titleLabel.textColor = [self changeTitleLbStatus];
    
    [self hiddenFenggeLine];
    
    switch (_itemstyle) {
        case UIHorItemStyleHorLine:{
            //
            moveLb.hidden = NO;
            moveLb.frame = CGRectMake(item.frame.origin.x+(item.frame.size.width-item.titleLabel.frame.size.width)/2, self.frame.size.height-moveLb.frame.size.height, item.titleLabel.frame.size.width, moveLb.frame.size.height);
            break;
        }
        case UIHorItemStyleRound:{
            //
            moveLb.hidden = NO;
            moveLb.frame = CGRectMake(item.frame.origin.x, item.titleLabel.frame.origin.y-2.5, item.frame.size.width, item.titleLabel.frame.size.height+5);
            moveLb.layer.cornerRadius = moveLb.frame.size.height*0.5;
            break;
        }
        case UIHorItemStyleNone:{
            //
            moveLb.hidden = YES;

            break;
        }
        default:
            break;
    }
    
}

@end

@implementation LSBarItem
{
}

- (instancetype)initWithTitle:(NSString*)title
{
    self = [super init];
    if (self) {
        //
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        
        CGRect rect = CGRectMake(0, 0, 10, 40);
        self.frame = rect;
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = 1;
        _titleLabel.text = title;
        [self addSubview:_titleLabel];
        [_titleLabel sizeToFit];

        CGFloat title_w = _titleLabel.frame.size.width+20;
        
        self.frame = CGRectMake(rect.origin.x, rect.origin.y, title_w, rect.size.height);
        
        _titleLabel.center = self.center;
        
    }
    return self;
}

- (instancetype)initWithTitle:(NSString*)title itemWidth:(CGFloat)itemwidth
{
    self = [super init];
    if (self) {
        //
       
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        
        CGRect rect = CGRectMake(0, 0, itemwidth, 40);
        self.frame = rect;
        
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = 1;
        _titleLabel.text = title;
        [self addSubview:_titleLabel];
        [_titleLabel sizeToFit];
        
        CGFloat title_w = itemwidth;
        
        self.frame = CGRectMake(rect.origin.x, rect.origin.y, title_w, rect.size.height);
        
        _titleLabel.frame = CGRectMake(0, 0, title_w, _titleLabel.bounds.size.height);
        _titleLabel.center = self.center;
    }
    return self;
}

@end












