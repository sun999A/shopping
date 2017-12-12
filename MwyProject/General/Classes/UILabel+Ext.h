//
//  UILabel+Ext.h
//  Comics
//
//  Created by yuety on 13-8-10.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Ext)

-(CGFloat) widthOfText;
-(CGFloat) widthOfText:(CGSize)size;

-(CGFloat) heightOfText;
-(CGFloat) heightOfText:(CGSize)size;

-(CGSize) sizeOfText:(CGSize)size;

@end
