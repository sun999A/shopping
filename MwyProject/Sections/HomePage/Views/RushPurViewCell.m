//
//  RushPurViewCell.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "RushPurViewCell.h"

@implementation RushPurViewCell
{
    __strong UILabel     *priceLine;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CellImage_K(_photoImage);
        CellImage_K(_line);
        
        CellLabelAlloc_K(_shopLabel);
        CellLabelAlloc_K(_discountLabel);
        CellLabelAlloc_K(_priceLabel);
        CellLabelAlloc_K(_placeLabel);
        CellLabelAlloc_K(_signLabel);
        
        priceLine = [UILabel new];
        [_discountLabel addSubview:priceLine];
        
        _buyButton = [UIButton new];
        [self addSubview:_buyButton];
        
        
    }
    return self;
}
- (void)setShop:(NSString *)shop  price:(NSString *)price dicount:(NSString *)discount place:(NSString *)place{
    
    CGRect frame = [self frame];
    _photoImage.frame = FRAMEMAKE_F(5, 5, 130, 130);
    _photoImage.contentMode = UIViewContentModeScaleAspectFit;
    
    //    UIImage *image  = [self imageCompressForWidth:_photoImage.image targetWidth:300];
    //    NSLog(@"----1%@", NSStringFromCGSize(_photoImage.image.size));
    //    _photoImage.image = image;
    //
    //    NSLog(@"----2%@", NSStringFromCGSize( _photoImage.image.size));
    
     frame.size.height = CGRectGetHeight(_photoImage.frame) + 10;
    
    
    _shopLabel.font = [UIFont systemFontOfSize:15];
    _shopLabel.text = shop;
    _shopLabel.numberOfLines = 2;
    _shopLabel.textColor = H_SHOPNAME;
    CGSize newSize = [_shopLabel boundingRectWithSize:CGSizeMake(WIDTH_K - CGRectGetMaxX(_photoImage.frame) - ViewFromX_Y * 3, 0)];
    
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
        _shopLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + ViewFromX_Y + 5, 5, newSize.width, newSize.height);
    }else{
        _shopLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + ViewFromX_Y + 5, CGRectGetMinY(_photoImage.frame) + 8, newSize.width, newSize.height);
    }
   
    
    
    LabelSet(_placeLabel, place, ME_COLOR_CELLTEXTLABEL, 13, placeDic, placeSize);
    _placeLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + ViewFromX_Y + 5, (_photoImage.frame.size.height + 10) / 2 - placeSize.height / 2, placeSize.width , placeSize.height);
    
    
    LabelSet(_signLabel, @"¥", S_OPRICE, 12, signDic, signSize);
    _signLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_placeLabel.frame), CGRectGetMaxY(_photoImage.frame) - 10 - signSize.height, signSize.width, signSize.height);
    
    _priceLabel.textColor = S_OPRICE;
    _priceLabel.text = price;
    _priceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
//    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
//        _priceLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
//    }else{
//        
//    }
    NSDictionary *priceDic = StringFont_DicK(_priceLabel.font);
    CGSize priceSize = [_priceLabel.text  sizeWithAttributes:priceDic];
    
    
    _priceLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_signLabel.frame) + 2, CGRectGetMaxY(_photoImage.frame) - priceSize.height - 8, priceSize.width , priceSize.height);
    
    
    
    
    LabelSet(_discountLabel, discount, ME_COLOR_CELLTEXTLABEL, 13, discountDic, discountSize);
    _discountLabel.frame = FRAMEMAKE_F(CGRectGetMinX(_placeLabel.frame),CGRectGetMaxY(_photoImage.frame) - 10 - _priceLabel.height - discountSize.height, discountSize.width, discountSize.height);
    priceLine.backgroundColor = ME_COLOR_CELLTEXTLABEL;
    priceLine.frame = FRAMEMAKE_F(0, discountSize.height/2, discountSize.width, 1);
    
    
    
    _buyButton.layer.cornerRadius = 12;
    _buyButton.clipsToBounds = YES;
    [_buyButton setTitle:@"立即抢购" forState:UIControlStateNormal];
    _buyButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buyButton.backgroundColor = NAV_BG_COLOR;
    NSDictionary *canDic = StringFont_DicK(_buyButton.titleLabel.font);
    CGSize canSize = [_buyButton.titleLabel.text  sizeWithAttributes:canDic];
    
    _buyButton.frame = FRAMEMAKE_F(WIDTH_K - canSize.width  - 35, frame.size.height - 18 - canSize.height, canSize.width + 20, canSize.height + 10)
    
    
    
    
    [_line setImage:[UIImage imageNamed:@"hang"]];
    _line.frame = FRAMEMAKE_F(0, frame.size.height - 1, WIDTH_K, 1);
    
    self.frame = frame;
}

- (UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth
{
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = (targetWidth / width) * height;
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
    [sourceImage drawInRect:CGRectMake(0,0,targetWidth, targetHeight)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
