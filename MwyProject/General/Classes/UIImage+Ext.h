//
//  UIImage+Ext.h
//  LitongProject
//
//  Created by Snail iOS on 16/10/13.
//  Copyright © 2016年 Feiyu iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ext)
- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;

-(UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
@end
