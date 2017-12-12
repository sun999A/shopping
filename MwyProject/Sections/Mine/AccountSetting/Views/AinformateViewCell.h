//
//  AinformateViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/11.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AinformateViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *lineView;
@property(nonatomic,strong)UILabel *nameLab;


@property(nonatomic,strong)UISwitch *switchView;
-(void)userName:(NSString *)name;
@end
