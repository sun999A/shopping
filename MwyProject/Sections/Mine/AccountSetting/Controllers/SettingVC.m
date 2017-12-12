//
//  SettingVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/11.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "SettingVC.h"
#import "AnameViewCell.h"
#import "AshipViewCell.h"
#import "AinformateViewCell.h"
@interface SettingVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"设置"];
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64) style:UITableViewStyleGrouped];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = S_BACKGROUND;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
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
        return [self currentTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        if (indexPath.row == 0) {
            return [self setTableView:tableView cellForRowAtIndexPath:indexPath];
        }else{
             return [self infoTableView:tableView cellForRowAtIndexPath:indexPath];
        }
    }
}
//当前版本
- (UITableViewCell *)currentTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AnameViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[AnameViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell userName:@"当前版本" phone:@"1.0"];
    
    return cell;
}

//账号设置
- (UITableViewCell *)setTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AshipViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[AshipViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell userName:@"账号设置"];
    
    
    return cell;
}


//消息推送
- (UITableViewCell *)infoTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AinformateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[AinformateViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [cell userName:@"消息推送"];
    
    
    return cell;
}
-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        NSLog(@"1");
    }else {
        NSLog(@"0");
    }
}

//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        AnameViewCell *cell = (AnameViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else{
        AshipViewCell *cell = (AshipViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
