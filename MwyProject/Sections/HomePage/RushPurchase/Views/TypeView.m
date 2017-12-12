
//
//  TypeView.m
//  AddShoppingCart
//
//  Created by 主用户 on 16/3/23.
//  Copyright © 2016年 江萧. All rights reserved.
//

#import "TypeView.h"

@implementation TypeView
-(instancetype)initWithFrame:(CGRect)frame andDatasource:(NSArray *)arr :(NSString *)typeName
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
        lab.text = typeName;
        lab.textColor = ME_COLOR_666666;
        lab.font = [UIFont systemFontOfSize:14];
        [self addSubview:lab];
        
        BOOL  isLineReturn = NO;
        float upX = 15;
        float upY = 45;
        for (int i = 0; i<arr.count; i++) {
            NSString *str = [arr objectAtIndex:i] ;
          
            NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont boldSystemFontOfSize:13] forKey:NSFontAttributeName];
            CGSize size = [str sizeWithAttributes:dic];
            //NSLog(@"%f",size.height);
            if ( upX > (self.frame.size.width- 15 -size.width-55)) {
                
                isLineReturn = YES;
                upX = 15;
                upY += 45;
            }
            
            UIButton *btn= [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(upX, upY, size.width+30, 30);
            [btn setBackgroundColor:M_BORDER];
            [btn setTitleColor:ME_COLOR_666666 forState:0];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [btn setTitle:[arr objectAtIndex:i] forState:0];
            btn.layer.cornerRadius = 5;
            btn.layer.borderColor = [UIColor clearColor].CGColor;
            btn.layer.borderWidth = 0;
            [btn.layer setMasksToBounds:YES];
            
            [self addSubview:btn];
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(touchbtn:) forControlEvents:UIControlEventTouchUpInside];
            upX+=size.width+55;
        }

        upY +=30;
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, upY+14, self.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
        
        self.height = upY+15;
        
        self.seletIndex = -1;
    }
    return self;
}
-(void)touchbtn:(UIButton *)btn
{
    
    if (btn.selected == NO) {
        
        self.seletIndex = (int)btn.tag-100;
        btn.backgroundColor = S_COUNT;
        
        
//        for (UIView *view in self.subviews) {
//            if ([view class] == [UIButton class]) {
//                UIButton *bt = (UIButton *)view;
//                bt.selected = NO;
//                if (bt.tag == btn.tag) {
//                    bt.selected = YES;
//                }
//            }
//            
//        }
    }else
    {
        self.seletIndex = -1;
        btn.selected = NO;
        btn.backgroundColor = M_BORDER;
    }
    [self.delegate btnindex:(int)btn.tag-100];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
