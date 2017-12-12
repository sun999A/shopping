//
//  DetailProductViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "DetailProductViewCell.h"

@implementation DetailProductViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        CellLabelAlloc_K(_typeName);
        CellLabelAlloc_K(_nameLab);
        CellImage_K(_line);
    }
    return self;
}
-(void)setType:(NSString *)typeName nameLab:(NSString *)name{
    CGRect frame = [self frame];
    
    LabelSet(_typeName, typeName, ME_COLOR_CELLTEXTLABEL, 14, typeNameDic, typeNameSize);
    _typeName.frame = FRAMEMAKE_F(15, ViewFromX_Y * 2, typeNameSize.width, typeNameSize.height);
    
    
    LabelSet(_nameLab, name, ME_COLOR_666666, 14, labelDic, labeSize);
    _nameLab.frame = FRAMEMAKE_F(CGRectGetMaxX(_typeName.frame), CGRectGetMinY(_typeName.frame), labeSize.width, labeSize.height);
    
    
    
    
    frame.size.height = CGRectGetHeight(_typeName.frame) + 40;
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(15 , frame.size.height - 1, WIDTH_K - 30, 1);

    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
