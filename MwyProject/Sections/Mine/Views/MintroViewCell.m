//
//  MintroViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MintroViewCell.h"

@implementation MintroViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CellLabelAlloc_K(_name);
    }
    return self;
}

-(void)userNameIntro:(NSString *)name{
     CGRect frame = [self frame];
    
    
    _name.font = TITLEFONT_14;
    //_contentLabel.text = content;
    _name.numberOfLines = 0;
    _name.textColor = ME_COLOR_CELLTEXTLABEL;
    _name.text = name;
    //    self.attString = [[NSAttributedString alloc] initWithString:content];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:_name.text attributes:@{NSKernAttributeName : @(0.5f)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_name.text length])];
    _name.attributedText = attributedString;
    
    CGSize size = CGSizeMake(WIDTH_K - ViewFromX_Y * 3, 500000);
    CGSize labelSize = [_name sizeThatFits:size];
    _name.frame = CGRectMake(LABLEIMAGE_K + 5, ViewFromX_Y * 2, labelSize.width,labelSize.height);
    
    frame.size.height = CGRectGetHeight(_name.frame) + 40;
   

    
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
