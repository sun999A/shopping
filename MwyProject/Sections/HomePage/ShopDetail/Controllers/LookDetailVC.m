//
//  LookDetailVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "LookDetailVC.h"
#import "DetailNameViewCell.h"
#import "ShopAddressViewCell.h"
#import "ShopPreViewCell.h"
#import "CommentViewCell.h"
#import "ShopIntroViewCell.h"

@interface LookDetailVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation LookDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNAVTitle:@"商家详情"];
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64 ) style:UITableViewStyleGrouped];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [self nameCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
        
    }else if (indexPath.row == 1){
        return [self preCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else if (indexPath.row == 2){
        return [self addressCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else if (indexPath.row == 3){
        return [self commentCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else{
        return [self indroduceCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }
    
}


//商家名字
- (UITableViewCell *)nameCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    DetailNameViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[DetailNameViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setName:@"印象上饶"];
    [cell.phoneBtn addTarget:self action:@selector(phoneButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//电话

- (void)phoneButton:(UIButton *)button{
    NSString *phone = @"15612341234";
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
    
}

//商家优惠
- (UITableViewCell *)preCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    ShopPreViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ShopPreViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setShop:@"商家优惠" substract:@"满100送20,满200送50" discount:@"全场5折"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//商家地址
- (UITableViewCell *)addressCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    ShopAddressViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ShopAddressViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setName:@"商家地址" address:@"杭州市滨江区江晖路487号3号楼903"];
     [cell.mapBtn addTarget:self action:@selector(mapButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//进入地图

- (void)mapButton:(UIButton *)button{
    NSLog(@"11111");
}
//商家评价
- (UITableViewCell *)commentCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    CommentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CommentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setShopStarNum:@"5.0" star:3.5];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//商家介绍
- (UITableViewCell *)indroduceCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    ShopIntroViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[ShopIntroViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setName:@"商家介绍" detail:@"据外媒12月19日消息，美国大选选举人投票结果出炉。选举委员会正式公布，特朗普获得超过270张选举人票，冲过最后一关，将入主白宫。"];
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
    if (indexPath.row == 0) {
        DetailNameViewCell *cell = (DetailNameViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
        
    }else if (indexPath.row == 1){
        ShopPreViewCell *cell = (ShopPreViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else if (indexPath.row == 2){
        ShopAddressViewCell *cell = (ShopAddressViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else if (indexPath.row == 1){
        CommentViewCell *cell = (CommentViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else{
        ShopIntroViewCell *cell = (ShopIntroViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }
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
