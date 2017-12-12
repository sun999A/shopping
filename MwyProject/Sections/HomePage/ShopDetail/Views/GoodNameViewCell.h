//
//  GoodNameViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/22.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodNameViewCell : UITableViewCell
//name
@property(nonatomic,strong)UILabel *name;

//价格
@property(nonatomic,strong)UILabel *price;
@property(nonatomic,strong)UILabel *disPrice;


@property (nonatomic,strong)UILabel *saleLabel;

@property (nonatomic,strong)UILabel *placeLabel;
@property (nonatomic,strong)UILabel *expressLabel;


@property (nonatomic,strong)UILabel *signLabel;

-(void)setName:(NSString *)name  price:(NSString *)price disPrice:(NSString *)disPrice sale:(NSString *)sale express:(NSString *)express place:(NSString *)place;

@end
