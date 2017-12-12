//
//  AheadViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/9.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AheadViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *headView;
@property(nonatomic,strong)UILabel *nameLab;


@property(nonatomic,strong)UIImageView *selectImg;
-(void)userNameImages:(NSString *)name;
@end
