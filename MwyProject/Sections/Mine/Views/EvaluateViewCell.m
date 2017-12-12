//
//  EvaluateViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/6.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "EvaluateViewCell.h"

@implementation EvaluateViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _textView = [[PlaceholderTextView alloc] init];
        [self addSubview:self.textView];
       
        CellImage_K(_line);
        CellImage_K(_imgView);
       
        
    }
    return self;
}

- (void)setName:(NSString *)name{
    CGRect frame = [self frame];
    
    _imgView.frame = FRAMEMAKE_F(15, 15, 90, 90);
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    
    
    frame.size.height = WIDTH_K / 2;
    
    
    _textView.frame = FRAMEMAKE_F(CGRectGetMaxX(_imgView.frame) + 10, 15, WIDTH_K - CGRectGetMaxX(_imgView.frame) - 25, WIDTH_K / 2 - 30);
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.delegate = self;
    _textView.font = [UIFont systemFontOfSize:18.f];
    _textView.textColor = H_SHOPNAME;
    _textView.textAlignment = NSTextAlignmentLeft;
    _textView.editable = YES;
//    _textView.layer.cornerRadius = 4.0f;
//    _textView.layer.borderColor = [UIColor grayColor].CGColor;
//    _textView.layer.borderWidth = 0.5;
    _textView.placeholderColor = CIRCLE_COLOR;
    _textView.placeholder = @"说些什么。。。";
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    self.frame = frame;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([@"\n" isEqualToString:text] == YES)
    {
        [textView resignFirstResponder];
        
        
        return NO;
    }
    
    return YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
