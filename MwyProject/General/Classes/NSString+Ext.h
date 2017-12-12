//
//  NSString+Ext.h
//  Comics
//
//  Created by yuety on 13-8-7.
//  Copyright (c) 2013年 noear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ext)
+(BOOL)isNullOrEmpty:(NSString*)str;
+(NSString*)unescapes:(NSString*)str;
+(NSString*)unescapes:(NSString*)str def:(NSString*)def;

-(NSInteger)lastIndexOf:(NSString *)searchstring;
-(NSInteger)lastIndexOfI:(NSString *)searchstring;

-(NSInteger)indexOf:(NSString *)searchstring;
-(NSInteger)indexOfI:(NSString *)searchstring;
-(NSInteger)indexOf:(NSString *)searchstring start:(int)start;

-(NSString*)padLeft:(NSInteger)totallength;
-(NSString*)padRight:(NSInteger)totallength;

-(NSString*)remove:(NSString *)what;
-(NSString*)removeI:(NSString *)what;

-(NSString*)replace:(NSString *)what with:(NSString *)with;
-(NSString*)replaceI:(NSString *)what with:(NSString *)with;

-(NSString*)subString:(NSInteger)start;
-(NSString*)subString:(NSInteger)start length:(NSInteger)length;

-(NSString*)trim;
-(NSString*)lTrim;
-(NSString*)rTrim;

-(NSArray*)split:(NSString *)withwhat;

-(BOOL)startsWith:(NSString*)subString;
-(BOOL)endsWith:(NSString*)subString;

-(BOOL)isArchivePath;
-(BOOL)isImagePath;

-(id)jsonValue;


-(CGFloat) heightOfText:(UIFont*)font;
-(CGFloat) heightOfText:(UIFont*)font inSize:(CGSize)size;




@end
