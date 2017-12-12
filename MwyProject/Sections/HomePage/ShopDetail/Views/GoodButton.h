//
//  GoodButton.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/22.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodButton : UIButton
@property(nonatomic,strong)UIImageView *selfImg;
@property(nonatomic,strong)UILabel     *labelText;
@property(nonatomic,strong)UILabel     *balanceText;
//自定义按钮
-(void)selfSelectionImageName:(NSString *)imgName labelString:(NSString *)string balanceText:(NSString *)balanceString;
@end
