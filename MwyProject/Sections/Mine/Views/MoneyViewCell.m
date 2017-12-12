//
//  MoneyViewCell.m
//  LifeServices
//
//  Created by Snail iOS on 16/7/15.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import "MoneyViewCell.h"
#import "MoneyButton.h"
@implementation MoneyViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(void)setTableViewCellBtnImg:(NSArray *)imgArr labelName:(NSArray *)nameArr numberArr:(NSArray *)numberArr{
    CGRect frame = [self frame];
    frame.size.height = 80;
    
    self.frame = frame;
    for (int i = 0; i < imgArr.count; i ++){
        __strong MoneyButton *btn = [[MoneyButton alloc]init];
        [btn selfSelectionImageName:[imgArr objectAtIndex:i] labelString:[nameArr objectAtIndex:i] balanceText:nil];
        //btn.labelText.textColor = [UIColor grayColor];
        if (i == 0) {
              btn.frame = FRAMEMAKE_F(15 + ((WIDTH_K / 5) * (i % 5)),12, 50, 50);
        }else  if (i == 4) {
            btn.frame = FRAMEMAKE_F(10 + ((WIDTH_K / 5) * (i % 5)),15, 50, 50);
            btn.labelText.frame = FRAMEMAKE_F(0, 15, 80, 50);
        } else{
            btn.frame = FRAMEMAKE_F(15 + ((WIDTH_K / 5) * (i % 5)),15, 50, 50);
        }
       
        btn.tag = i;
        [btn addTarget:self action:@selector(userButtonClick:) forControlEvents:1<<6];
        // 购物车角标视图
        self.badgeView = [[BadgeView alloc] initWithFrame:CGRectMake(btn.frame.size.width - 20, -5, 18, 18) withString:nil];
        self.badgeView.textLabel.text = [numberArr objectAtIndex:i];
        [btn addSubview:self.badgeView];
        if ([[numberArr objectAtIndex:i] isEqualToString:@"0"]) {
            self.badgeView.hidden = YES;    // 初始状态隐藏
            
        }
        [self addSubview:btn];
    }
}
-(void)userButtonClick:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSString *string = [NSString stringWithFormat:@"%ld",(long)button.tag];
    self.push(string);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
