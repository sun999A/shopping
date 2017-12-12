//
//  RushPurVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "RushPurVC.h"
#import "RushPurViewCell.h"
#import "GGClockView.h"
#import "GoodRushVC.h"
@interface RushPurVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RushPurVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"限时抢购"];
    [self.view addSubview:self.myTableView];
    [self.view addSubview:self.topView];
    
    UIImage *searchImage = [UIImage imageNamed:@"h_tsearch"];
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, searchImage.size.width,searchImage.size.height);
    [searchButton setImage:searchImage forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchItem:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *moreImage = [UIImage imageNamed:@"h_gengduo"];
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(0, 0, moreImage.size.width,moreImage.size.height);
    [moreButton setImage:moreImage forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(moreItem:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightSearch  = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    
     UIBarButtonItem *rightMore  = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    
     self.navigationItem.rightBarButtonItems = @[rightMore, rightSearch];
    
    


    // Do any additional setup after loading the view.
}

//搜索
- (void)searchItem:(UIButton *)button{
    NSLog(@"1111");
}

//更多
- (void)moreItem:(UIButton *)button{
     NSLog(@"2222");
}



- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, KHFullScreenWidth, KHFullScreenHeight - 64 - 45) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = SLABEL_ONE;
        _topView.frame = CGRectMake(0, 0, WIDTH_K, 45);
        UIImageView *timeImage = [UIImageView new];
        timeImage.image = [UIImage imageNamed:@"h_xianshi"];
        timeImage.frame = FRAMEMAKE_F(15, (45 - timeImage.image.size.height) / 2, timeImage.image.size.width, timeImage.image.size.height);
        
        GGClockView *_clockView = [[GGClockView alloc] init];
        _clockView.time = 300;
        _clockView.timeBackgroundColor = [UIColor clearColor];
        _clockView.timeTextColor = [UIColor whiteColor];
        _clockView.colonColor = [UIColor whiteColor];
        _clockView.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        _clockView.frame = FRAMEMAKE_F(WIDTH_K - 15 - 70, (45 - 20) / 2, 70, 20);

        UILabel *timeLable = [UILabel new];
        timeLable.text = @"距离结束还有:";
        timeLable.font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
        timeLable.textColor = [UIColor whiteColor];
        NSDictionary *timeDic = StringFont_DicK(timeLable.font);
        CGSize timeSize = [timeLable.text sizeWithAttributes:timeDic];
        timeLable.frame = FRAMEMAKE_F(WIDTH_K - 70 - 20 - timeSize.width, (45 - timeSize.height) / 2, timeSize.width, timeSize.height);
        
        [_topView addSubview:_clockView];
        [_topView addSubview:timeImage];
        [_topView addSubview:timeLable];
      
        
    }
    return _topView;
}

#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    RushPurViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[RushPurViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
   
    cell.photoImage.image = [UIImage imageNamed:@"ceshiThree"] ;
    
    [cell setShop:@"好坚果立即抢购!先到先得 好坚果立即抢购!先到先得" price:@"1234"  dicount:@"¥ 1200" place:@"印象上饶"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.buyButton addTarget:self action:@selector(buyClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.buyButton.tag = indexPath.row;
    return cell;
    
}

//立即抢购

- (void)buyClick:(UIButton *)sender{
    GoodRushVC *goodVC = [[GoodRushVC alloc] init];
    [self.navigationController pushViewController:goodVC animated:YES];
   
    
    
}


//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RushPurViewCell *cell = (RushPurViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return  cell.frame.size.height;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (SYSTEM_VERSION >= 6.0) {
        if (self.isViewLoaded && self.view.window == nil) {
            self.view = nil;
        }
    }
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
