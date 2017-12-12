//
//  GoodButton.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/22.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodButton.h"

@implementation GoodButton
-(id)init{
    self = [super init];
    if (self){
        
        
        _selfImg = [[UIImageView alloc]init];
        [self addSubview:_selfImg];
        
        _labelText = [[UILabel alloc]init];
        [self addSubview:_labelText];
        
        _balanceText = [[UILabel alloc]init];
        [self addSubview:_balanceText];
    }
    return self;
}
-(void)selfSelectionImageName:(NSString *)imgName labelString:(NSString *)string balanceText:(NSString *)balanceString{
    
    UIImage *selImg = [UIImage imageNamed:imgName];
    [_selfImg setImage:selImg];
    
    //    NSLog(@"  %ld , %ld",(long)selImg.size.width,(long)selImg.size.height);
    
    [_labelText setText:string];
    _labelText.textColor = [UIColor blackColor];
    _labelText.font = [UIFont systemFontOfSize:10];
    NSDictionary *labelDic = StringFont_DicK(_labelText.font);
    CGSize labelSize = [_labelText.text sizeWithAttributes:labelDic];
    
    //    NSLog(@"name %@ %ld",string, (long)labelSize.width);
    
    if (labelSize.width > selImg.size.width || labelSize.width == selImg.size.width){
        _selfImg.frame = FRAMEMAKE_F((labelSize.width - _selfImg.image.size.width)/2, 0, _selfImg.image.size.width, _selfImg.image.size.height);
        _labelText.frame = FRAMEMAKE_F((labelSize.width - selImg.size.width)/2 - 5, _selfImg.image.size.height + 5, labelSize.width, labelSize.height);
    }
    
    if (labelSize.width < selImg.size.width){
        _labelText.frame = FRAMEMAKE_F((selImg.size.width - labelSize.width) / 2,_selfImg.image.size.height + 5, labelSize.width, labelSize.height);
        _selfImg.frame = FRAMEMAKE_F(_labelText.center.x - (selImg.size.width /2 ), 0, _selfImg.image.size.width, _selfImg.image.size.height);
    }
    
    if (balanceString != nil) {
        [_balanceText setText:balanceString];
        _balanceText.textColor = NAVCOLOR_C(252.0, 73.0, 72.0);
        _balanceText.font = [UIFont systemFontOfSize:12];
        NSDictionary *balanceDic = StringFont_DicK(_balanceText.font);
        CGSize balanceSize = [_balanceText.text sizeWithAttributes:balanceDic];
        _balanceText.frame = FRAMEMAKE_F(0, 0, balanceSize.width, balanceSize.height);
        _balanceText.frame = FRAMEMAKE_F((balanceSize.width - labelSize.width)/2,self.frame.size.height - labelSize.height, labelSize.width, labelSize.height);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
