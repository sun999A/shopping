//
//  AddressView.h
//  Teaism
//
//  Created by ike on 15/11/5.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

//添加地址View
@interface AddressView : UITableViewCell

@property(nonatomic,strong)UILabel      *name;
@property(nonatomic,strong)UITextField  *describe;
@property(nonatomic,strong)UIImageView  *locateBtn;

-(void)setName:(NSString *)nameString Describe:(NSString *)descString;

@end
