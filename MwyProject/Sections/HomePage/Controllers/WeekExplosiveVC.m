//
//  WeekExplosiveVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "WeekExplosiveVC.h"
#import "NewProViewCell.h"
@interface WeekExplosiveVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation WeekExplosiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"本周爆品"];
    [self.view addSubview:self.myTableView];
    
    
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
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64 ) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    NewProViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[NewProViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.photoImage.image = [UIImage imageNamed:@"ceshiThree"] ;
    
    [cell setShop:@"好坚果立即抢购!先到先得 好坚果立即抢购!先到先得" price:@"1234"  dicount:@"¥ 1200" place:@"印象上饶" sale:@"售出1000笔"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
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
    NewProViewCell *cell = (NewProViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
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
