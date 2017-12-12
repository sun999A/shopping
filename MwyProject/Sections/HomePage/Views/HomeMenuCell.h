//
//  HomeMenuCell.h
//  meituan
//
//  Created by jinzelu on 15/6/30.
//  Copyright (c) 2015年 jinzelu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JZMTBtnView.h"


@interface HomeMenuCell : UITableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier imageArray:(NSArray *)imageArray titleArray:(NSArray *)titleArray;
@property(nonatomic,copy)void(^push)(int btn);
@end
