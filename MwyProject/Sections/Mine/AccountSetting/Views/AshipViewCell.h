//
//  HshipViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/9.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AshipViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *lineView;
@property(nonatomic,strong)UILabel *nameLab;


@property(nonatomic,strong)UIImageView *selectImg;
-(void)userName:(NSString *)name;

@end
