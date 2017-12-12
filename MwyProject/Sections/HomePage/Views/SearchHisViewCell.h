//
//  SearchHisViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchHisViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *lineView;

@property(nonatomic,strong)UILabel *nameLab;
-(void)setName:(NSString *)name;

@end
