//
//  MyAccountVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/6.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MyAccountVC.h"
#import "UserNameView.h"
#import "MsellViewCell.h"
#import "MsellVC.h"
#import "MshoppingVC.h"
#import "MaddShopVC.h"
@interface MyAccountVC ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation MyAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"我的账户"];
    [self.view addSubview:self.myTableView];

    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = S_BACKGROUND;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self sellTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self shopTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
}

- (UITableViewCell *)sellTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    UserNameView *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[UserNameView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell userNameImages:@"m_sale" userNameString:@"销售统计"];
    
    return cell;
}

- (UITableViewCell *)shopTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MsellViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[MsellViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell userNameImages:@[@"m_shop", @"m_add"][indexPath.row] userNameString:@[@"我的商家", @"新增商家"][indexPath.row] num:@[@"120", @"+1"][indexPath.row]];
    if (indexPath.row == 1) {
        cell.numLab.backgroundColor = M_NUMBER;
        cell.numLab.textColor = [UIColor whiteColor];
        cell.numLab.layer.cornerRadius = 5;
        cell.numLab.clipsToBounds = YES;
    }
    return cell;
}


//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else{
        return 10;
    }
}

//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserNameView *cell = (UserNameView *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return  cell.frame.size.height;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        MsellVC *accountVC = [[MsellVC alloc] init];
        [self.navigationController pushViewController:accountVC animated:YES];

    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            MshoppingVC *accountVC = [[MshoppingVC alloc] init];
            [self.navigationController pushViewController:accountVC animated:YES];
        }else{
         
            MaddShopVC *accountVC = [[MaddShopVC alloc] init];
            [self.navigationController pushViewController:accountVC animated:YES];
        }
    }
    
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
