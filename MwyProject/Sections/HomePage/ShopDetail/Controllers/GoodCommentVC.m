//
//  GoodCommentVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodCommentVC.h"
#import "GoodCommentViewCell.h"
@interface GoodCommentVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation GoodCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNAVTitle:@"全部评论"];
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64) style:UITableViewStyleGrouped];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}
//当前多少个区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
    
    
}
//评价
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    GoodCommentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[GoodCommentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.nameImg.image = [UIImage imageNamed:@"g_touxiang"];
    [cell setName:@"马克" content:@"非常满意,非常好非常满意,非常好非常满意,非常好非常满意,非常好" time:@"2016-12-23 11:52:50"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 45;
    }else{
        return 0.001;
    }
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

//区头内添加内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *_commentLabel = [UILabel new];
    LabelSet(_commentLabel, @"买家评价(120)", H_SHOPNAME, 16, commentDic, commentSize);
    _commentLabel.frame = FRAMEMAKE_F(15,  (45 - commentSize.height) / 2, commentSize.width, commentSize.height);
    
    
    //星星
    DYRateView *rateView = [[DYRateView alloc] init];
    rateView.frame = FRAMEMAKE_F(WIDTH_K - 15 - 80, (45 - 20) / 2 + 4, 80, 20);
    rateView.isshow = YES;
    rateView.rate = 3.5;
    rateView.alignment = RateViewAlignmentLeft;
    
    UILabel *_starLabel = [UILabel new];
    LabelSet(_starLabel, @"商品满意度", ME_COLOR_CELLTEXTLABEL, 14, starDic, starSize);
    _starLabel.frame = FRAMEMAKE_F(WIDTH_K - CGRectGetWidth(rateView.frame) - 25 - starSize.width,  (45 - starSize.height) / 2, starSize.width, starSize.height);
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0,  45- 1, WIDTH_K, 1)];
    line.image = [UIImage imageNamed:@"hang"];
    [view addSubview:line];
    
    
    [view addSubview:_commentLabel];
    [view addSubview:rateView];
    [view addSubview:_starLabel];
    return view;
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak GoodCommentVC *videoSelf = self;
    GoodCommentViewCell *cell = (GoodCommentViewCell *)[videoSelf tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (SYSTEM_VERSION >= 6.0) {
        if (self.isViewLoaded && self.view.window == nil) {
            self.view = nil;
        }
    }
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
