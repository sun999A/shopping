//
//  MsellViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/6.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsellViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *lineView;
@property(nonatomic,strong)UILabel *numLab;


@property(nonatomic,strong)UIImageView *selectImg;
-(void)userNameImages:(NSString *)nameImage userNameString:(NSString *)string num:(NSString *)num;
@end
