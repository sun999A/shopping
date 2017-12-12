//
//  AdressCollectionViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "AddressCollectionViewCell.h"

@implementation AddressCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         self.backgroundColor = [UIColor whiteColor];
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
    
    UIImage *image = [UIImage imageNamed:@"h_location"];
    
    _nameLabel.font = [UIFont systemFontOfSize:14];
    _nameLabel.text = name;
    _nameLabel.numberOfLines = 2;
    _nameLabel.textColor = ME_COLOR_666666;
    CGSize newSize = [_nameLabel boundingRectWithSize:CGSizeMake(WIDTH_K - WIDTH_K / 4 - (image.size.width + ViewFromX_Y * 2 + 25), 0)];
    
    _nameLabel.frame = FRAMEMAKE_F(image.size.width + ViewFromX_Y * 2 + 25, ViewFromX_Y * 2 + 5, newSize.width, newSize.height);
    //frame.size.height = CGRectGetHeight(_nameLabel.frame) + ViewFromX_Y * 4;
    frame.size.height = 90;
    
    _photoImage.image = image;
    _photoImage.frame = FRAMEMAKE_F(25, (frame.size.height - image.size.height) / 2, image.size.width, image.size.height);
    
    
    UIImage *phoneImg = [UIImage imageNamed:@"h_dianhua"];
    [_phoneBtn setImage:phoneImg forState:UIControlStateNormal];
    
    _phoneBtn.frame = FRAMEMAKE_F(WIDTH_K - 30 - phoneImg.size.width, (frame.size.height - phoneImg.size.height)/ 2 , phoneImg.size.width, phoneImg.size.height);
    
    

    
    [_line setImage:[UIImage imageNamed:@"shu"]];
    _line.frame = FRAMEMAKE_F(WIDTH_K - 30 - CGRectGetWidth(_phoneBtn.frame) - 30, 25, 1,  frame.size.height - 50);
    
    self.frame = frame;
}

@end
