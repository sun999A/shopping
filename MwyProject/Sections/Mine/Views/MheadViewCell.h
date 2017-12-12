//
//  MheadViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MheadViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel     *name;
@property(nonatomic,strong)UILabel     *build;
@property(nonatomic,strong)UIImageView *line;

-(void)setTableViewName:(NSString *)name build:(NSString *)build;
@end
