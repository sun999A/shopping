//
//  SiteView.m
//  Teaism
//
//  Created by ike on 15/11/5.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "SiteView.h"

@implementation SiteView{
   
    __strong UIImageView *line;
}

@synthesize push;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _consignee = [[UILabel alloc]init];
        [self addSubview:_consignee];
        
        _number = [[UILabel alloc]init];
        [self addSubview:_number];
        
        _receive = [[UILabel alloc]init];
        [self addSubview:_receive];
        
        push = [[UIImageView alloc]init];
        [self addSubview:push];
        
        line = [[UIImageView alloc]init];
        [self addSubview:line];
        
        
    }
    return self;
}
-(void)setSiteConsignee:(NSString *)consiString iPoneNumber:(NSString *)number receiveString:(NSString *)string{
    //_consignee.text = [NSString stringWithFormat:@"收 货 人:%@",consiString];
    CGRect frame = [self frame];
    _consignee.text = consiString;
    _consignee.textColor = H_SHOPNAME;
    _consignee.font = [UIFont systemFontOfSize:16];
    NSDictionary *conDic = StringFont_DicK(_consignee.font);
    CGSize conSize = [_consignee.text sizeWithAttributes:conDic];
    _consignee.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, ViewFromX_Y * 2, conSize.width, conSize.height);
    
    _number.text = number;
    _number.textColor = ME_COLOR_CELLTEXTLABEL;
    _number.font = [UIFont systemFontOfSize:16];
    NSDictionary *numDic = StringFont_DicK(_number.font);
    CGSize numSize = [_number.text sizeWithAttributes:numDic];
    _number.frame = FRAMEMAKE_F(CGRectGetMaxX(_consignee.frame) + 10, CGRectGetMinY(_consignee.frame), numSize.width, numSize.height);
    
    
    
    _receive.text = string;
    _receive.textColor = H_SHOPNAME;
    _receive.font = [UIFont systemFontOfSize:14];
    CGSize receSize = [_receive boundingRectWithSize:CGSizeMake(WIDTH_K - 100, 0)];
    _receive.numberOfLines = 0;
    _receive.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5,CGRectGetMaxY(_consignee.frame) + 10, receSize.width, receSize.height);

    frame.size.height = CGRectGetHeight(_consignee.frame) + receSize.height + 50;
    
    
    UIImage *pushImg =[UIImage imageNamed:@"m_edit"];
    [push setImage:pushImg];
    push.frame = FRAMEMAKE_F(WIDTH_K - 15 - pushImg.size.width, (frame.size.height - pushImg.size.height)/2, pushImg.size.width, pushImg.size.height);
    
    [line setImage:[UIImage imageNamed:@"hang"]];
    line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    self.frame = frame;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
