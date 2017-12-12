//
//  ChoseView.h
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TypeView.h"
#import "BuyCountView.h"
@interface ChoseView : UIView<UITextFieldDelegate,UIAlertViewDelegate,TypeSeleteDelegete>
@property (nonatomic, strong) UIView *keyBoardTopView;

@property(nonatomic, strong)UIView *alphaiView;
@property(nonatomic, strong)UIView *whiteView;

@property(nonatomic, strong)UIImageView *img;

@property(nonatomic, strong)UILabel *lb_price;
@property(nonatomic, strong)UILabel *lb_stock;
@property(nonatomic, strong)UILabel *lb_detail;
@property(nonatomic, strong)UILabel *lb_line;

@property(nonatomic, strong)UIScrollView *mainscrollview;

@property(nonatomic, strong)TypeView *sizeView;
@property(nonatomic, strong)TypeView *colorView;
@property(nonatomic, strong)BuyCountView *countView;

@property(nonatomic, strong)UIButton *bt_sure;
@property(nonatomic, strong)UIButton *bt_cancle;

@property(nonatomic)NSArray *sizearr;
@property(nonatomic)NSArray *colorarr;
@property(nonatomic)NSDictionary *stockdic;
@property(nonatomic) int stock;

-(void)initTypeView:(NSArray *)sizeArr :(NSArray *)colorArr :(NSDictionary *)stockDic;
@end
