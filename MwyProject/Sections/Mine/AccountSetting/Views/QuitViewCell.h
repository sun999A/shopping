//
//  QuitViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/9.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuitViewCell : UITableViewCell
//按钮
@property(nonatomic,strong)UIButton *setpBtn;

-(void)setImage:(UIImage *)image btnName:(NSString *)string;
@end
