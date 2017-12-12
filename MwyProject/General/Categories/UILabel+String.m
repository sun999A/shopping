//
//  UILabel+String.m
//  Teaism
//
//  Created by ike on 15/11/2.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "UILabel+String.h"

@implementation UILabel (String)
- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    return retSize;
}

@end
