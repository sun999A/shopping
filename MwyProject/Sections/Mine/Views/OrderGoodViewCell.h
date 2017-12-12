//
//  OrderGoodViewCell.h
//  LitongProject
//
//  Created by feiyu iOS on 16/12/10.
//  Copyright © 2016年 Feiyu iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderGoodViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *priceNum;
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UILabel *standardLab;
@property(nonatomic,strong)UIImageView *line;
-(void)setName:(NSString *)name priceNum:(NSString *)num price:(NSString *)price standard:(NSString *)standard;
@end
