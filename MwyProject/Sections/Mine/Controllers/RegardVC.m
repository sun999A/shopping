//
//  RegardVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "RegardVC.h"
#import "MheadViewCell.h"
#import "MintroViewCell.h"
@interface RegardVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RegardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"关于我们"];
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

//当前多少个区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self headCellEithTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self indroduceCellEithTableView:tableView cellForRowAtIndexPath:indexPath];
    }
}

- (UITableViewCell *)headCellEithTableView:tableView cellForRowAtIndexPath:indexPath{
    NSString *cellId =[NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MheadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MheadViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //CFShow(CFBridgingRetain(infoDictionary));
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    // app版本
    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // app build版本
    //NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    //    [cell setTableViewCell:[NSString stringWithFormat:@"%@ V%@.0",[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey],[[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]]];
    [cell.img setImage:[UIImage imageNamed:@"m_minwuyou"]];
    [cell setTableViewName:app_Name build:app_Version];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableViewCell *)indroduceCellEithTableView:tableView cellForRowAtIndexPath:indexPath{
    NSString *cellId =[NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MintroViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MintroViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
   
    [cell userNameIntro:@"  江西民无忧控制控股集团成立于2013年9月，注册资金为人民币1亿元。拥有自主的技术研发及国内的顶尖电商运营团队，对区块链技术做更广的应用和研发，实现以区块链+物联网为基础的电子商务平台，将传统互联网商业重新组织，构建新的互联网诚信体系，致力打造中国民生分享经济第一品牌。现已发展江西、浙江、湖南、贵州、山西、福建等各区域分公司及代理。"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak RegardVC *videoSelf = self;
    if (indexPath.section == 0) {
        MheadViewCell *favourCell = (MheadViewCell *)[videoSelf tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return favourCell.frame.size.height;
    }else{
        MintroViewCell *favourCell = (MintroViewCell *)[videoSelf tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return favourCell.frame.size.height;
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
