//
//  AnameViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/9.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "AnameViewCell.h"

@implementation AnameViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    
        
        _lineView = [[UIImageView alloc]init];
        [self addSubview:_lineView];
        
        _selectImg = [[UIImageView alloc]init];
        [self addSubview:_selectImg];
        
        CellLabelAlloc_K(_nameLab);
        CellLabelAlloc_K(_phoneLab);
    }
    return self;
}

-(void)userName:(NSString *)name phone:(NSString *)phone{
    CGRect frame = [self frame];
    frame.size.height = 50;
    LabelSet(_nameLab, name, H_SHOPNAME, 16, numDic, numSize);
    _nameLab.frame = FRAMEMAKE_F(15, (frame.size.height - numSize.height) / 2, numSize.width, numSize.height);
    
    [_lineView setImage:[UIImage imageNamed:@"hang"]];
    _lineView.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    
    
    
    LabelSet(_phoneLab, phone, ME_COLOR_CELLTEXTLABEL, 14, phoneDic, phoneSize);
    _phoneLab.frame = FRAMEMAKE_F(WIDTH_K - 15  - phoneSize.width, (frame.size.height - phoneSize.height) / 2, phoneSize.width, phoneSize.height);
    
    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
