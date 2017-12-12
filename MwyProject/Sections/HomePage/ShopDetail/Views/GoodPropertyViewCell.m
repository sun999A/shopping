//
//  GoodPropertyViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodPropertyViewCell.h"

@implementation GoodPropertyViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
    
        CellLabelAlloc_K(_typeName);
        CellLabelAlloc_K(_nameLab);
      
    }
    return self;
}
-(void)setType:(NSString *)typeName nameLab:(NSString *)name{
    CGRect frame = [self frame];
    
    LabelSet(_typeName, typeName, ME_COLOR_666666, 14, typeNameDic, typeNameSize);
    _typeName.frame = FRAMEMAKE_F(15, 8, typeNameSize.width, typeNameSize.height);
    
    
    LabelSet(_nameLab, name, H_SUBSTRACT, 14, labelDic, labeSize);
    _nameLab.frame = FRAMEMAKE_F(WIDTH_K / 2 - 50, 8, labeSize.width, labeSize.height);
    
    
    
    
    frame.size.height = CGRectGetHeight(_typeName.frame) + 16;
    

    self.frame = frame;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
