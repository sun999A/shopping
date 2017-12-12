//
//  SiteView.h
//  Teaism
//
//  Created by ike on 15/11/5.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


//地址管理
@interface SiteView : UITableViewCell

//收货人
@property(nonatomic,strong)UILabel *consignee;
//手机号码
@property(nonatomic,strong)UILabel *number;
//收货地址
@property(nonatomic,strong)UILabel *receive;

@property (nonatomic, strong)UIImageView *push;
-(void)setSiteConsignee:(NSString *)consiString iPoneNumber:(NSString *)number receiveString:(NSString *)string;

@end
