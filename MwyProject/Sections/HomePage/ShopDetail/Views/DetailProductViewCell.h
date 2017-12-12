//
//  DetailProductViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailProductViewCell : UITableViewCell
@property (strong, nonatomic)  UILabel *typeName;
@property (strong, nonatomic)  UILabel *nameLab;
@property (nonatomic, strong)UIImageView *line;
-(void)setType:(NSString *)typeName nameLab:(NSString *)name;
@end
