//
//  RemarkBtnCell.m
//  KFS
//
//  Created by mc on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "RemarkBtnCell.h"

@implementation RemarkBtnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _commentLabel.layer.borderWidth = 1;
    _commentLabel.layer.borderColor = NAV_BG_COLOR.CGColor;
    _commentLabel.layer.cornerRadius = 15;
    _commentLabel.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
