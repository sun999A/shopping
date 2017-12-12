//
//  GoodCommentViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodCommentViewCell : UITableViewCell
@property (nonatomic, strong)UIView *view;
@property (nonatomic, strong)UIImageView *line;
@property (nonatomic, strong)UIImageView *nameImg;
@property (nonatomic, strong)UILabel *nameLab;
@property (nonatomic, strong)UILabel *timeLab;
@property (nonatomic, strong)UILabel *contentLab;


- (void)setName:(NSString *)name content:(NSString *)content time:(NSString *)time;

@end
