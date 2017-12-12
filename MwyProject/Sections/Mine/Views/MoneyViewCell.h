//
//  MoneyViewCell.h
//  LifeServices
//
//  Created by Snail iOS on 16/7/15.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BadgeView.h"
@interface MoneyViewCell : UITableViewCell
@property(nonatomic,strong)void(^push)(id btn);
@property(nonatomic,strong) BadgeView *badgeView;

-(void)setTableViewCellBtnImg:(NSArray *)imgArr labelName:(NSArray *)nameArr numberArr:(NSArray *)numberArr;

@end
