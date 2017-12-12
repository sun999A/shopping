//
//  AinformateViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/11.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "AinformateViewCell.h"

@implementation AinformateViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        _lineView = [[UIImageView alloc]init];
        [self addSubview:_lineView];
        
        _switchView = [[UISwitch alloc]init];
        [self addSubview:_switchView];
        
        CellLabelAlloc_K(_nameLab);
    }
    return self;
}

-(void)userName:(NSString *)name{
    CGRect frame = [self frame];
    frame.size.height = 50;
    
    LabelSet(_nameLab, name, H_SHOPNAME, 16, numDic, numSize);
    _nameLab.frame = FRAMEMAKE_F(15, (frame.size.height - numSize.height) / 2, numSize.width, numSize.height);
    
    
    [_lineView setImage:[UIImage imageNamed:@"hang"]];
    _lineView.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    
    _switchView.backgroundColor = [UIColor whiteColor];
    _switchView.onTintColor = NAV_BG_COLOR;
    _switchView.tintColor = S_BACKGROUND;
    [_switchView setOn:YES animated:YES];
    _switchView.frame =FRAMEMAKE_F(WIDTH_K - 15 - 50,(frame.size.height - 30)/2, 50, 30);
    
    
    self.frame = frame;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
