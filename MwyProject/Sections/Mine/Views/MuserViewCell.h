//
//  MuserViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/17.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MuserViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *lineView;

@property(nonatomic,strong)UIImageView *selectImg;
@property(nonatomic,strong)UIImageView *moreImage;
@property(nonatomic,strong)UIButton *moreButton;
-(void)userNameImages:(NSString *)nameImage userNameString:(NSString *)string;
@end
