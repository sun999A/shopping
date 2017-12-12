//
//  MoneyButton.h
//  LifeServices
//
//  Created by Snail iOS on 16/7/15.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoneyButton : UIButton
@property(nonatomic,strong)UIImageView *selfImg;
@property(nonatomic,strong)UILabel     *labelText;
@property(nonatomic,strong)UILabel     *balanceText;
//自定义按钮
-(void)selfSelectionImageName:(NSString *)imgName labelString:(NSString *)string balanceText:(NSString *)balanceString;
@end
