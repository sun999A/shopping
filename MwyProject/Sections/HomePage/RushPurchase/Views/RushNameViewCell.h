//
//  RushNameViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RushNameViewCell : UITableViewCell
//name
@property(nonatomic,strong)UILabel *name;




@property (nonatomic,strong)UILabel *saleLabel;

@property (nonatomic,strong)UILabel *placeLabel;
@property (nonatomic,strong)UILabel *expressLabel;




-(void)setName:(NSString *)name   sale:(NSString *)sale express:(NSString *)express place:(NSString *)place;
@end
