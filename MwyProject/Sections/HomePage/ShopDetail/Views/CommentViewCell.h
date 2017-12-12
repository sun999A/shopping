//
//  CommentViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentViewCell : UITableViewCell
@property (nonatomic,strong)UILabel *commentLabel;
@property (strong, nonatomic)  UIImageView *line;
@property (nonatomic,strong)UILabel *starLabel;

- (void)setShopStarNum:(NSString *)starNum  star:(float)star;
@end
