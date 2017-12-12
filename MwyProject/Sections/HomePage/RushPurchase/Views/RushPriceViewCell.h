//
//  RushPriceViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGClockView.h"
@interface RushPriceViewCell : UITableViewCell
//name
@property(nonatomic,strong)UILabel *name;

//价格
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UILabel *disPrice;
@property (nonatomic, strong) GGClockView *clockView;

-(void)setName:(NSString *)name  price:(NSString *)price disPrice:(NSString *)disPrice time:(NSInteger )time;

@end
