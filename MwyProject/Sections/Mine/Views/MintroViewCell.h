//
//  MintroViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MintroViewCell : UITableViewCell
@property(nonatomic,strong)UILabel     *name;

-(void)userNameIntro:(NSString *)name;
@end
