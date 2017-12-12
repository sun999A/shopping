//
//  DetailNameViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "DetailNameViewCell.h"

@implementation DetailNameViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CellImage_K(_photoImage);
        CellImage_K(_line);
        
        CellLabelAlloc_K(_nameLabel);
        
        
        _phoneBtn = [UIButton new];
        [self addSubview:_phoneBtn];
        
        
        
        
    }
    return self;
}

- (void)setName:(NSString *)name{
    CGRect frame = [self frame];
    
   
    
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.text = name;
    _nameLabel.numberOfLines = 1;
    _nameLabel.textColor = ME_COLOR_666666;
    CGSize newSize = [_nameLabel boundingRectWithSize:CGSizeMake(WIDTH_K - WIDTH_K / 4 - 15, 0)];
    
    _nameLabel.frame = FRAMEMAKE_F(15, (90 - newSize.height) / 2, newSize.width, newSize.height);
    //frame.size.height = CGRectGetHeight(_nameLabel.frame) + ViewFromX_Y * 4;
    frame.size.height = 90;
    
   
    
    
    UIImage *phoneImg = [UIImage imageNamed:@"h_dianhua"];
    [_phoneBtn setImage:phoneImg forState:UIControlStateNormal];
    
    _phoneBtn.frame = FRAMEMAKE_F(WIDTH_K - 30 - phoneImg.size.width, (frame.size.height - phoneImg.size.height)/ 2 , phoneImg.size.width, phoneImg.size.height);
    
    
    
    
    [_line setImage:[UIImage imageNamed:@"shu"]];
    _line.frame = FRAMEMAKE_F(WIDTH_K - 30 - CGRectGetWidth(_phoneBtn.frame) - 30, 25, 1,  frame.size.height - 50);
    
    [_photoImage setImage:[UIImage imageNamed:@"hang"]];
    _photoImage.frame = FRAMEMAKE_F(15, frame.size.height - 1, WIDTH_K - 30,  1);
    
    self.frame = frame;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
