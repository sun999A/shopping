//
//  UILabel+Ext.m
//  Comics
//
//  Created by yuety on 13-8-10.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import "UILabel+Ext.h"

@implementation UILabel (Ext)

-(CGFloat) widthOfText
{
    if(self.text)
    {
        if (SYSTEM_VERSION >=7)
        {
            return [self.text sizeWithAttributes:@{ NSFontAttributeName : self.font}].width;
        }
        else
        {
            return [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(320,100) lineBreakMode:NSLineBreakByCharWrapping].width;
        }
    }
    else
    {
        return 0;
    }
    
}

-(CGFloat) widthOfText:(CGSize)size
{
    if(self.text)
        return [self sizeOfText:size].width;
    else
        return 0;
}


-(CGFloat) heightOfText
{
    if(self.text)
    {
        if (SYSTEM_VERSION >=7)
        {
            return [self.text sizeWithAttributes:@{ NSFontAttributeName : self.font}].height;
        }
        else
        {
            return [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(320,100) lineBreakMode:NSLineBreakByCharWrapping].height;
        }
    }
    
    else
    {
        return 0;
    }
    
}

-(CGFloat) heightOfText:(CGSize)size
{
    if(self.text)
        return [self sizeOfText:size].height;
    else
        return 0;
}

-(CGSize) sizeOfText:(CGSize)size
{    if(self.text)
    {
        CGSize mysize;
        if (SYSTEM_VERSION >=7)
        {
            mysize = [self.text boundingRectWithSize:size
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName: self.font}
                                           context:nil].size;
        }
        else
        {
            mysize = [self.text sizeWithFont:self.font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
        }
        
        
        
        return mysize;
    }
    else
        return CGSizeMake(0, 0);
}

@end
