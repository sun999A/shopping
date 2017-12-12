//
//  GoodSelectViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodSelectViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *nameLab;

@property(nonatomic,strong)UIImageView *selectImg;

-(void)userNameString:(NSString *)string;
@end
