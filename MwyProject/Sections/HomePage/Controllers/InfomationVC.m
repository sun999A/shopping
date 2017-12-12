//
//  InfomationVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "InfomationVC.h"
#import "InfoViewCell.h"
@interface InfomationVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation InfomationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"消息"];
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view.
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
    InfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[InfoViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.photoImage.image = [UIImage imageNamed:@"ceshiThree"] ;
    
    [cell setName:@"你的订单已发货" order:@"你的订单号1000000000000" time:@"06-20 12:22" detail:@"(点击查看详情)"];
    cell.detailLabel.tag = indexPath.row;
    cell.detailLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(detailClick:)];
    [cell.detailLabel addGestureRecognizer:tap];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//详情点击
- (void)detailClick:(UITapGestureRecognizer *)tap{
    NSLog(@"--------%ld", tap.view.tag);
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
    InfoViewCell *cell = (InfoViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
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
