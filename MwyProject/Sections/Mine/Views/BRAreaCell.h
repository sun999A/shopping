//
//  BRAreaCell.h
//  LitongProject
//
//  Created by Snail iOS on 16/11/8.
//  Copyright © 2016年 Feiyu iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BRAreaCell : UITableViewCell
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *date;
@property(nonatomic,strong)UIButton *seled;

-(void)setLabel:(NSString *)string date:(NSString *)text;
@end
