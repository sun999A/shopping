//
//  GoodPropertyViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodPropertyViewCell : UITableViewCell

@property (strong, nonatomic)  UILabel *typeName;
@property (strong, nonatomic)  UILabel *nameLab;

-(void)setType:(NSString *)typeName nameLab:(NSString *)name;

@end
