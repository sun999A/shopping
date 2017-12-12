//
//  EvaluateViewCell.h
//  MwyProject
//
//  Created by feiyu iOS on 17/1/6.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateViewCell : UITableViewCell<UITextViewDelegate>
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)PlaceholderTextView *textView;
@property(nonatomic,strong)UIImageView *line;
- (void)setName:(NSString *)name;

@end
