//
//  LSHorizontalMenuView.h
//  NingxiaInternational
//
//  Created by  tsou117 on 15/6/3.
//  Copyright (c) 2015年  tsou117. All rights reserved.
//

#import "FBaseView.h"

#define KHorMenuItemTitle @"itemName"

typedef NS_ENUM(NSInteger, UIHorItemStyle) {
    
    UIHorItemStyleNone = 0,          //无
    UIHorItemStyleHorLine,              //水平线
    UIHorItemStyleRound,              //圆形的
};

@class LSHorizontalMenuView;

@protocol LSHorizontalMenuViewDelegate <NSObject>

- (void)menuView:(LSHorizontalMenuView*)menuView didSelectItemAtIndex:(NSInteger)index;

@end

@interface LSHorizontalMenuView : FBaseView

@property (nonatomic,weak) id <LSHorizontalMenuViewDelegate> delegate;

@property (nonatomic,copy,readonly) UIColor* normalColor;
@property (nonatomic,copy,readonly) UIColor* selectedColor;

@property (nonatomic,assign) UIHorItemStyle itemstyle;

//- (id)initWithFrame:(CGRect)frame titleOfBtns:(NSArray*)titles;
//
////Users/mc/Desktop/LifeServices/LifeServices/Sections**
// *  初始一个多标签选项栏
// *
// *  @param frame  范围
// *  @param titles 标签标题
// *  @param index  位于index的标签高亮
// *
// *  @return 无
// */
//- (id)initWithFrame:(CGRect)frame titleOfBtns:(NSArray*)titles canMove:(BOOL)canmove index:(NSInteger)index;

- (void)setButtonTitles:(NSArray*)titles canMove:(BOOL)canmove index:(NSInteger)index;

//设置状态颜色
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

//直接去到指定的index
- (void)moveIndex:(NSInteger)moveindex;


@end

#pragma mark
@interface LSBarItem : UIImageView

@property (nonatomic,strong) UILabel* titleLabel;

/**
 *  自适应文字宽度布局
 *
 *  @param title 当前标题
 *
 *  @return 无
 */
- (instancetype)initWithTitle:(NSString*)title;

/**
 *  指定item宽度布局
 *
 *  @param title     当前标题
 *  @param itemwidth 宽度
 *
 *  @return 无
 */
- (instancetype)initWithTitle:(NSString*)title itemWidth:(CGFloat)itemwidth;








@end

