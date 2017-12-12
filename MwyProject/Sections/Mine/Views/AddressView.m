//
//  AddressView.m
//  Teaism
//
//  Created by ike on 15/11/5.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "AddressView.h"

@implementation AddressView{
    __strong UIImageView *line;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _name = [[UILabel alloc]init];
        [self addSubview:_name];
        
        _describe = [[UITextField alloc]init];
        [self addSubview:_describe];
        
        CellImage_K(_locateBtn);

        line = [[UIImageView alloc]init];
        [self addSubview:line];
    }
    return self;
}
-(void)setName:(NSString *)nameString Describe:(NSString *)descString{
    CGRect frame = [self frame];
    _name.text = nameString;
    _name.textColor = H_SHOPNAME;
    _name.font = [UIFont systemFontOfSize:15];
    NSDictionary *nameDic = StringFont_DicK(_name.font);
    CGSize nameSize = [_name.text sizeWithAttributes:nameDic];
    _name.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, ViewFromX_Y, nameSize.width, nameSize.height);
    frame.size.height = (ViewFromX_Y *2)+ nameSize.height;
    
    
    _describe.backgroundColor =[UIColor clearColor];
    _describe.textColor = H_SHOPNAME;
    _describe.placeholder = descString;
    _describe.font = [UIFont systemFontOfSize:15];
    _describe.frame = FRAMEMAKE_F((LABLEIMAGE_K *2) + 80, ViewFromX_Y, WIDTH_K - (LABLEIMAGE_K *3)  - 80, nameSize.height);
    [_describe setValue:ME_COLOR_CELLTEXTLABEL forKeyPath:@"_placeholderLabel.textColor"];
    [_describe setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
    //光标颜色
    //_describe.tintColor = [UIColor blackColor];

    [line setImage:[UIImage imageNamed:@"hang"]];
    line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    self.frame =frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
