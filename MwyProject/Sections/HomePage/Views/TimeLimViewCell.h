//
//  TimeLimViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/16.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGClockView.h"
@interface TimeLimViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIImageView *leftImg;
@property(nonatomic,strong)UIImageView *photoImg;
@property(nonatomic,strong)UILabel  *leftTitle;
@property(nonatomic,strong)UILabel  *leftName;

@property(nonatomic,strong)UIButton *centerBtn;
@property(nonatomic,strong)UIImageView *centerImg;
@property(nonatomic,strong)UILabel  *centerTitle;
@property(nonatomic,strong)UILabel  *centerName;

@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIImageView *rightImg;
@property(nonatomic,strong)UILabel  *rightTitle;
@property(nonatomic,strong)UILabel  *rightName;
@property (nonatomic, strong) GGClockView *clockView;

-(void)setLeftTitle:(NSString *)leftT centerTitle:(NSString *)centerT  rightTitle:(NSString *)rightT time:(NSInteger)time;
@end
