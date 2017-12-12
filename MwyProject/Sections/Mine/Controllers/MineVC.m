//
//  MineVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/15.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "MineVC.h"
#import "UserNameView.h"
#import "MoneyViewCell.h"
#import "HeadNavView.h"
#import "SJAvatarBrowser.h"
#import "MuserViewCell.h"
#import "RegardVC.h"
#import "CollectVC.h"
#import "ShipAddressVC.h"
#import "OrderVC.h"
#import "MyAccountVC.h"
#import "AccountSetVC.h"
#import "SettingVC.h"
static NSString *clearIdentifier = @"clear";
@interface MineVC ()<UITableViewDataSource,UITableViewDelegate>{
    __strong NSArray     *userImgs;
    __strong NSArray     *userNames;
    __strong HeadNavView *headView;
    UILabel *labelText;

}


@end

@implementation MineVC
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[self createImageWithColor:NAV_BG_COLOR]
                                                 forBarPosition:UIBarPositionAny
                                                     barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
   
}


- (UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (SYSTEM_VERSION >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = nil;
    // Do any additional setup after loading the view.
    
    NSArray *img1 = @[@"m_shouhuo"];
    NSArray *img2 = @[@"m_shoucang", @"m_shezhi"];
    NSArray *img3 = @[@"m_fenxiang"];
    NSArray *img4 = @[@"m_yijian", @"m_kefu"];
    NSArray *img5 = @[@"m_guanyu"];
    userImgs = @[img1, img2, img3, img4, img5];
    
    NSArray *name1 = @[@"收货地址"];
    NSArray *name2 = @[@"我的收藏", @"设置"];
    NSArray *name3 = @[@"分享"];
    NSArray *name4 = @[@"意见反馈", @"客服电话"];
    NSArray *name5 = @[@"关于我们"];
    userNames = @[name1, name2, name3, name4, name5];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, WIDTH_K, HEIGHT_K - 64 - 49) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    //_tableView.backgroundColor = [UIColor greenColor];
    
    //_tableView.bounces = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
     CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY <   0){
         _tableView.backgroundColor = NAV_BG_COLOR;
    }else{
        _tableView.backgroundColor = S_BACKGROUND;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return userNames.count + 1;
}
//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else{
        NSArray *array = [userNames objectAtIndex:section - 1];
        return array.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self ordersTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self shopTableView:tableView cellForRowAtIndexPath:indexPath];
    }
}
- (UITableViewCell *)ordersTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return [self orderTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self moneyTableView:tableView cellForRowAtIndexPath:indexPath];
    }
}

//我的消费
- (UITableViewCell *)orderTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MuserViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[MuserViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clearIdentifier];
    }
    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    //    NSArray *array = [userNames objectAtIndex:indexPath.section];
    //    NSArray *imgArr = [userImgs objectAtIndex:indexPath.section];
    [cell userNameImages:@"m_dingdan" userNameString:@"我的订单"];
    [cell.moreButton addTarget:self action:@selector(orderClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}

- (void)orderClick:(UIButton *)button{
    NSLog(@"666666");
}
//待付款

- (UITableViewCell *)moneyTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MoneyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[MoneyViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clearIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *imgArray = @[@"m_daifu",@"m_daifa",@"m_daishou",@"m_daiping",@"m_daitui"];
    NSArray *nameArr  = @[@"待付款",@"待发货",@"待收货",@"待评价",@"退款/售后"];
    NSArray *numberArr = @[@"1", @"2", @"3", @"4",@"0"];
    [cell setTableViewCellBtnImg:imgArray labelName:nameArr numberArr:numberArr];
    cell.push =^(id string){
        if ([string isEqual:@"0"]) {
            self.hidesBottomBarWhenPushed = YES;
            OrderVC *orderVC = [[OrderVC alloc] init];
            orderVC.moveInteger = 1;
            [self.navigationController pushViewController:orderVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }else if ([string isEqual:@"1"]) {
            self.hidesBottomBarWhenPushed = YES;
            MyAccountVC *accountVC = [[MyAccountVC alloc] init];
            [self.navigationController pushViewController:accountVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;

        }else if ([string isEqual:@"2"]) {
            self.hidesBottomBarWhenPushed = YES;
            NSLog(@"1111");
            self.hidesBottomBarWhenPushed = NO;
        }else if ([string isEqual:@"3"]) {
            self.hidesBottomBarWhenPushed = YES;
           NSLog(@"3333");
            self.hidesBottomBarWhenPushed = NO;
        }else{
            [self.view showHintView:@"暂未开通"];
        }
    };
    return cell;
    
}

//我的店铺
- (UITableViewCell *)shopTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    UserNameView *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[UserNameView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clearIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell userNameImages:userImgs[indexPath.section-1][indexPath.row] userNameString:userNames[indexPath.section-1][indexPath.row]];
    
    return cell;
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return WIDTH_K / 3;
    }else{
        return 10;
    }
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    __strong UIView *view = [[UIView alloc]init];
    view.backgroundColor = S_BACKGROUND;
    return view;
}



//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == userNames.count) {
        return 20;
    }else{
        return 0.0001;
    }
    
}


//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserNameView *cell = (UserNameView *)[self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return  cell.frame.size.height;
}
//点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 5) {
        self.hidesBottomBarWhenPushed = YES;
        RegardVC *regardVC = [[RegardVC alloc] init];
        [self.navigationController pushViewController:regardVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else if (indexPath.section == 1){
        self.hidesBottomBarWhenPushed = YES;
        ShipAddressVC *shipVC = [[ShipAddressVC alloc] init];
        [self.navigationController pushViewController:shipVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            self.hidesBottomBarWhenPushed = YES;
            CollectVC *collectVC = [[CollectVC alloc] init];
            [self.navigationController pushViewController:collectVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }else{
            self.hidesBottomBarWhenPushed = YES;
            SettingVC *setVC = [[SettingVC alloc] init];
            [self.navigationController pushViewController:setVC animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
    }
}
//区头内添加内容
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __strong UIView *view = [[UIView alloc]init];
    view.backgroundColor = S_BACKGROUND;
    if (section == 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_K, WIDTH_K/ 3)];
        imageView.backgroundColor = NAV_BG_COLOR;
        
        [view addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        headView =[[HeadNavView alloc]init];
        headView.frame = FRAMEMAKE_F(0, 0, WIDTH_K, WIDTH_K/3);
        [headView addTarget:self action:@selector(headSelection) forControlEvents:1<<6];
        [headView userName:@"立即登录"];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        headView.headImg.userInteractionEnabled = YES;
        [headView.headImg addGestureRecognizer:tap];
        
         [imageView addSubview:headView];
        
    }
    return view;
    
}
- (void)headSelection{
    self.hidesBottomBarWhenPushed = YES;
    AccountSetVC *accountVC = [[AccountSetVC alloc] init];
    [self.navigationController pushViewController:accountVC animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
//点击头像放大

- (void)click:(UITapGestureRecognizer *)tap{
    NSLog(@"------放大");
    [SJAvatarBrowser showImage:(UIImageView*)tap.view];
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
