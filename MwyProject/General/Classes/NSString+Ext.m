//
//  NSString+Ext.m
//  Comics
//
//  Created by yuety on 13-8-7.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import "NSString+Ext.h"

@implementation NSString (Ext)
+(BOOL)isNullOrEmpty:(NSString*)str
{
    if (str == nil || str == NULL) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

+(NSString*)unescapes:(NSString*)str
{
    return [NSString unescapes:str def:nil];
}

+(NSString*)unescapes:(id)str def:(NSString*)def
{
    if(str && str!= [NSNull null])
        return [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    else
        return def;
}

-(NSInteger)lastIndexOf:(NSString *)searchstring
{
    
    NSRange start=[self rangeOfString:searchstring options:NSBackwardsSearch];
    if (start.location == NSNotFound)
        return -1;
    else
        return self.length - start.location - searchstring.length;
}

-(NSInteger)lastIndexOfI:(NSString *)searchstring
{
    
    NSRange start=[self rangeOfString:searchstring options:NSBackwardsSearch+NSCaseInsensitiveSearch];
    if (start.location == NSNotFound)
        return -1;
    else
        return start.location;
}

-(NSInteger)indexOf:(NSString *)searchstring
{
    NSRange start=[self rangeOfString:searchstring];
    if (start.location == NSNotFound)
        return -1;
    else
        return start.location;
}


-(NSInteger)indexOfI:(NSString *)searchstring
{
    NSRange start=[self rangeOfString:searchstring options:NSCaseInsensitiveSearch];
    if (start.location == NSNotFound)
        return -1;
    else
        return start.location;
}

-(NSInteger)indexOf:(NSString *)searchstring start:(int)start
{
    NSRange start2=[self rangeOfString:searchstring options:NSCaseInsensitiveSearch range:NSMakeRange(start, self.length-start) ];
    
    if (start2.location == NSNotFound)
        return -1;
    else
        return start2.location;
}

-(NSString *)subString:(NSInteger)start
{
    NSRange srange=NSMakeRange(start,[self length]-start);
    
    return [self substringWithRange:srange];
}


-(NSString *)subString:(NSInteger)start length:(NSInteger)length
{   
    NSRange srange=NSMakeRange(start,length);
    
    return [self substringWithRange:srange];
}

-(NSString *)replace:(NSString *)what with:(NSString *)with
{
    return [self stringByReplacingOccurrencesOfString:what withString:with];
}

-(NSString *)replaceI:(NSString *)what with:(NSString *)with
{
    NSRange range = NSMakeRange(0, [self length]);
    return [self stringByReplacingOccurrencesOfString:what withString:with options:NSCaseInsensitiveSearch range:range];
}

-(NSString *)remove:(NSString *)what
{
    return [self stringByReplacingOccurrencesOfString:what withString:@""];
}

-(NSString *)removeI:(NSString *)what
{
    NSRange range = NSMakeRange(0, [self length]);
    return [self stringByReplacingOccurrencesOfString:what withString:@"" options:NSCaseInsensitiveSearch range:range];
}

-(NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSString *)lTrim
{
    
    if ([self length]==0) return self;
    NSInteger i=0;
    
    while (i<[self length])
    {
        unichar thechar = [self characterAtIndex:i];
        if (thechar==' ' || thechar=='\n')
        {
            i++;
        }
        else
        {
            break;
        }
        
    }
    
    return [self subString:i];
}

-(NSString *)rTrim
{
    
    NSInteger i=[self length]-1;
    if (i==-1) return self;
    
    while (i>0)
    {
        unichar thechar = [self characterAtIndex:i];
        if (thechar==' ' || thechar=='\n')
        {
            i--;
        }
        else
        {
            break;
        }
        
    }
    
    return [self subString:0 length:i+1];
}

-(NSArray *)split:(NSString *)withwhat
{
    NSArray *chunks = [self componentsSeparatedByString: withwhat];
    return chunks;
}

-(NSString*)padRight:(NSInteger)totallength
{
    if ([self length]>=totallength) return self;
    return [self stringByPaddingToLength:totallength withString: @" " startingAtIndex:0];
}

-(NSString *)padLeft:(NSInteger)totallength
{
    if ([self length]>=totallength) return self;
    
    NSString *emptyString = @"";
	NSString *padString = [emptyString stringByPaddingToLength:totallength-[self length] withString:@" " startingAtIndex:0];
	return [padString stringByAppendingString:self];
}

-(BOOL)startsWith:(NSString*)subString
{
    return [self indexOf:subString]==0;
}


-(BOOL)endsWith:(NSString*)subString
{
    NSInteger idx = [self lastIndexOf:subString];
    return idx==0;
}

-(BOOL)isArchivePath
{
    NSString* name = [self lowercaseString];
    
    return ([name endsWith:@".zip"] || [name endsWith:@".rar"] || [name endsWith:@".7z"]||
            [name endsWith:@".cbz"] || [name endsWith:@".cbr"] || [name endsWith:@".cb7"]);
}

-(BOOL)isImagePath
{
    NSString* name = [self lowercaseString];
    
    return ([name endsWith:@".jpg"] || [name endsWith:@".png"] || [name endsWith:@".gif"]);
}

-(id)jsonValue
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}

-(CGFloat) heightOfText:(UIFont*)font
{
    if (SYSTEM_VERSION>=7)
    {
        return [self sizeWithAttributes:@{ NSFontAttributeName : font}].height;
    }
    else
    {
        return [self sizeWithFont:font constrainedToSize:CGSizeMake(320,100) lineBreakMode:NSLineBreakByCharWrapping].height;
    }
    
}

-(CGFloat) heightOfText:(UIFont*)font inSize:(CGSize)size
{
//    CGRect rect = [self boundingRectWithSize:size
//                                     options:NSStringDrawingUsesLineFragmentOrigin
//                                  attributes:@{NSFontAttributeName: font}
//                                     context:nil];
//    
//    return rect.size.height;
    
    
    CGSize mysize;
    if (SYSTEM_VERSION >=7)
    {
        mysize = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin
                                      attributes:@{NSFontAttributeName:font}
                                         context:nil].size;
    }
    else
    {
        mysize = [self sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];
    }
    
    return mysize.height;
    
}


@end
