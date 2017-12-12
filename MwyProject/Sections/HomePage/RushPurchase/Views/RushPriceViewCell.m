//
//  RushPriceViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "RushPriceViewCell.h"

@implementation RushPriceViewCell
{
    UILabel *priceLine;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = NAV_BG_COLOR;
        _price  = [[UILabel alloc]init];
        [self addSubview:_price];
        
        
        
        
        CellLabelAlloc_K(_name);
        CellLabelAlloc_K(_disPrice);
       
        priceLine = [UILabel new];
        [_disPrice addSubview:priceLine];
        _clockView = [[GGClockView alloc] init];
        [self addSubview:_clockView];
        
    }
    return self;
}

-(void)setName:(NSString *)name  price:(NSString *)price disPrice:(NSString *)disPrice time:(NSInteger )time{
    CGRect frame = [self frame];
    
    LabelSet(_name, name, H_TIME, 12, stDic, stSize);
    _name.frame = FRAMEMAKE_F(WIDTH_K - 15 - stSize.width,  15, stSize.width, stSize.height);
    
    
    
    _clockView.time = time;
    _clockView.timeBackgroundColor = [UIColor clearColor];
    _clockView.timeTextColor = H_TIME;
    _clockView.colonColor = H_TIME;
    _clockView.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    _clockView.frame = FRAMEMAKE_F(WIDTH_K - 15 - 70, CGRectGetMaxY(_name.frame) + 5, 70, 20);
    
    frame.size.height = CGRectGetHeight(_name.frame) + CGRectGetHeight(_clockView.frame) + 35;
    
    
    _price.text = price;
    _price.textColor = [UIColor whiteColor];
    _price.font = [UIFont fontWithName:@"Helvetica-Bold" size:32];
    NSDictionary *teaDic = StringFont_DicK(_price.font);
    CGSize teaSize = [_price.text sizeWithAttributes:teaDic];
    _price.frame = FRAMEMAKE_F(LABLEIMAGE_K * 2, (frame.size.height -  teaSize.height) / 2, teaSize.width, teaSize.height);
    [self fuwenbenLabel:_price FontNumber:[UIFont systemFontOfSize:15] AndRange:NSMakeRange(0, 1) AndColor:[UIColor whiteColor]];
    
    LabelSet(_disPrice, disPrice, H_SEARCHTIT, 12, discountDic, discountSize);
    _disPrice.frame = FRAMEMAKE_F(CGRectGetMaxX(_price.frame), CGRectGetMaxY( _price.frame) - discountSize.height - 5, discountSize.width, discountSize.height);
    priceLine.backgroundColor = H_SEARCHTIT;
    priceLine.frame = FRAMEMAKE_F(0, discountSize.height/2, discountSize.width, 1);
    
   
    
   
    
    self.frame = frame;
}
//设置不同字体颜色
-(void)fuwenbenLabel:(UILabel *)labell FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:labell.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    labell.attributedText = str;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
