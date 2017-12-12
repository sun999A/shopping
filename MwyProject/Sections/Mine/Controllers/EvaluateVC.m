//
//  EvaluateVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/5.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "EvaluateVC.h"
#import "EvaluateViewCell.h"
@interface EvaluateVC ()<UITableViewDelegate, UITableViewDataSource,DYRateViewDelegate>

@end

@implementation EvaluateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNAVTitle:@"评价"];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.myTableView];
    
    // Do any additional setup after loading the view.
}
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT_K - 64 - 48, WIDTH_K, 48)];
        UIButton *groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [groupBtn setTitle:@"发表评论" forState:UIControlStateNormal];
        [groupBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [groupBtn setBackgroundColor:NAV_BG_COLOR];
        groupBtn.titleLabel.font = TITLEFONT_18;
        groupBtn.frame = FRAMEMAKE_F(0, 0, WIDTH_K, 48);
        [groupBtn addTarget:self action:@selector(publishClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:groupBtn];
    }
    return _bottomView;
}

- (void)publishClick:(UIButton *)button{
    NSLog(@"111");
    
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64 - 48) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = S_BACKGROUND;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell %ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    EvaluateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[EvaluateViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.imgView setImage:[UIImage imageNamed:@"ceshiThree"]];
    [cell setName:@""];
    return cell;
}


//设置区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 60;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 45;
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak EvaluateVC *favSelf = self;
    EvaluateViewCell *cell = (EvaluateViewCell *)[favSelf tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

//区头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = S_BACKGROUND;
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.frame = FRAMEMAKE_F(0, 0, WIDTH_K, 50);
    
    UIImageView *_photoImage = [UIImageView new];
    _photoImage.image = [UIImage imageNamed:@"g_shangjia"];
    _photoImage.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, (50 - _photoImage.image.size.height) / 2, _photoImage.image.size.width, _photoImage.image.size.height);
    
    
    UILabel *_titleLabel = [UILabel new];
    LabelSet(_titleLabel, @"孙记店", ME_COLOR_666666, 15, titleDic, titleSize);
    _titleLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + 10, (50 - titleSize.height) / 2, titleSize.width, titleSize.height);
    
   
    [backView addSubview:_photoImage];
    [backView addSubview:_titleLabel];
   
    
    UILabel *_starLabel = [[UILabel alloc] init];
    LabelSet(_starLabel, @"5.0", H_SCORE, 14, starDic, starSize);
    _starLabel.frame = FRAMEMAKE_F(WIDTH_K - 15 - starSize.width,  (50 - starSize.height) / 2, starSize.width, starSize.height);
    
    //星星
     DYRateView *rateView = [[DYRateView alloc] initWithFrame:CGRectMake(WIDTH_K - 25 - starSize.width - 110, (50 - 20) / 2 + 3  , 110, 20) fullStar:[UIImage imageNamed:@"icon_pl_list_rating_star"] emptyStar:[UIImage imageNamed:@"icon_pl_list_rating_star_gray"] emptyStarHalf:[UIImage imageNamed:@"icon_pl_list_rating_star_half"]];
   
    rateView.editable = YES;
    rateView.delegate = self;
    rateView.padding = 10;
    rateView.alignment = RateViewAlignmentLeft;
    rateView.tag = 101;
    [backView addSubview:_starLabel];
    [backView addSubview:rateView];
    

    [view addSubview:backView];
    return view;
    
}
- (void)rateView:(DYRateView *)rateView changedToNewRate:(NSNumber *)rate{
    //rates = [rate floatValue];
    if (rateView.tag == 101) {
        NSLog(@"显示选择的等级值:%@",rate);

    }else{
         NSLog(@"等级值:%@",rate);
    }
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *_commentLabel = [UILabel new];
    LabelSet(_commentLabel, @"商品满意度", ME_COLOR_666666, 16, commentDic, commentSize);
    _commentLabel.frame = FRAMEMAKE_F( 15,  (45 - commentSize.height) / 2, commentSize.width, commentSize.height);
    
    
    UILabel *_starLabel = [[UILabel alloc] init];
    LabelSet(_starLabel, @"5.0", H_SCORE, 14, starDic, starSize);
    _starLabel.frame = FRAMEMAKE_F(WIDTH_K - 15 - starSize.width,  (50 - starSize.height) / 2, starSize.width, starSize.height);
    
    //星星
    DYRateView *rateView = [[DYRateView alloc] initWithFrame:CGRectMake(WIDTH_K - 25 - starSize.width - 110, (45 - 20) / 2 + 7 , 110, 20) fullStar:[UIImage imageNamed:@"icon_pl_list_rating_star"] emptyStar:[UIImage imageNamed:@"icon_pl_list_rating_star_gray"] emptyStarHalf:[UIImage imageNamed:@"icon_pl_list_rating_star_half"]];
    
    rateView.editable = YES;
    rateView.delegate = self;
    rateView.padding = 10;
    rateView.alignment = RateViewAlignmentLeft;
    rateView.tag = 102;
    [view addSubview:_commentLabel];
    [view addSubview:_starLabel];
    [view addSubview:rateView];
    
    return view;
    
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
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
