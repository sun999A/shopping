//
//  QuitViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/9.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "QuitViewCell.h"

@implementation QuitViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = M_BACKGRO;
        _setpBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_setpBtn];
        
    }
    return self;
}
-(void)setImage:(UIImage *)image btnName:(NSString *)string{
    CGRect frame =[self frame];
    
    [_setpBtn setTitle:string forState:UIControlStateNormal];
    [_setpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _setpBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    _setpBtn.frame = FRAMEMAKE_F(15, 0, WIDTH_K - (LABLEIMAGE_K * 3), 45);
    _setpBtn.layer.cornerRadius = 22.5;
    _setpBtn.clipsToBounds = YES;
    frame.size.height = 50;
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
