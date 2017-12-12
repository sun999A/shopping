//
//  LeagueShopVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/15.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "LeagueShopVC.h"
#import "RecommendViewCell.h"
#import "JFCityViewController.h"
#import "JFLocation.h"
#import "JFAreaDataManager.h"
#import "MXPullDownMenu.h"
#import "ShopDetailVC.h"


#define KCURRENTCITYINFODEFAULTS [NSUserDefaults standardUserDefaults]
@interface LeagueShopVC ()<UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate,JFLocationDelegate,MXPullDownMenuDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
/** 城市定位管理器*/
@property (nonatomic, strong) JFLocation *locationManager;
/** 城市数据管理器*/
@property (nonatomic, strong) JFAreaDataManager *manager;
/** 选择的结果*/
@property (strong, nonatomic) UILabel *moreLabel;



@property (strong, nonatomic) NSIndexPath *index;
@property (nonatomic, strong) NSArray *titleA;
@end

@implementation LeagueShopVC


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (SYSTEM_VERSION >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    //[self showTabBar];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
     [self.view addSubview:self.myTableView];
    
    self.navigationItem.titleView = self.titleView;
    
    UIBarButtonItem *leftBtn  = [[UIBarButtonItem alloc]
                                 initWithCustomView:self.leftView];
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    UIImage *infoImage = [UIImage imageNamed:@"h_xiaoxi"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, infoImage.size.width,infoImage.size.height);
    [backButton setImage:infoImage forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(infoBtnClick:)
         forControlEvents:UIControlEventTouchUpInside];
    [backButton showRedAtOffSetX:-3 AndOffSetY:0.01 OrValue:nil];
    UIBarButtonItem *rightBtn  = [[UIBarButtonItem alloc]
                                  initWithCustomView:backButton];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    
    self.titleA = @[@[@"拱墅区", @"江干区", @"滨江区", @"余杭区", @"上城区", @"下城区"], @[@"综合排序", @"价格降序", @"价格升序"],@[@"智能排序", @"离我最近", @"评分最高", @"最新发布"], @[@"全部", @"酒店", @"美食"]];
    MXPullDownMenu *menu = [[MXPullDownMenu alloc] initWithArray:self.titleA selectedColor:H_MAP];
    menu.delegate = self;
    menu.frame = CGRectMake(0, 0, menu.frame.size.width, menu.frame.size.height);
    [self.view addSubview:menu];
    
//    self.menu = [[SPullDownMenuView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40) withTitle:self.titleA withSelectColor:H_MAP];
//    self.menu.delegate = self;
//    [self.view addSubview:self.menu];
    
    
    
    self.locationManager = [[JFLocation alloc] init];
    _locationManager.delegate = self;
}

#pragma mark - MXPullDownMenuDelegate

- (void)PullDownMenu:(MXPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row
{
    NSLog(@"%ld -- %ld", (long)column, (long)row);
}



- (JFAreaDataManager *)manager {
    if (!_manager) {
        _manager = [JFAreaDataManager shareManager];
        [_manager areaSqliteDBData];
    }
    return _manager;
}

//左边
- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [UIView new];
        
        _moreLabel = [UILabel new];
        LabelSet(_moreLabel, @"选择位置", [UIColor whiteColor], 14, moreDic, moreSize);
        _moreLabel.frame = FRAMEMAKE_F(0, 10, moreSize.width, moreSize.height);
        
        UIImageView *moreImage = [UIImageView new];
        moreImage.image = [UIImage imageNamed:@"h_sanjiao"];
        moreImage.frame = FRAMEMAKE_F(CGRectGetMaxX(_moreLabel.frame) + 6, 15,  moreImage.image.size.width,  moreImage.image.size.height);
        
        _leftView.frame = FRAMEMAKE_F(0, 0, CGRectGetWidth( _moreLabel.frame) + CGRectGetWidth(moreImage.frame) + 10, 44);
        [_leftView addSubview:moreImage];
        [_leftView addSubview:_moreLabel];
        //[_leftView addSubview:_moreButton];
        moreImage.userInteractionEnabled = YES;
        _leftView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftClick:)];
        [_leftView addGestureRecognizer:tap];
        
    }
    return _leftView;
}

//左边
- (void)leftClick:(UIButton *)button{
    NSLog(@"111");
    JFCityViewController *cityViewController = [[JFCityViewController alloc] init];
    cityViewController.title = @"城市";
    __weak typeof(self) weakSelf = self;
    [cityViewController choseCityBlock:^(NSString *cityName) {
        weakSelf.moreLabel.text = cityName;
    }];
    
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:cityViewController];
    [self presentViewController:navigationController animated:YES completion:nil];


}
#pragma mark --- JFLocationDelegate

//定位中...
- (void)locating {
    NSLog(@"定位中...");
}

//定位成功
- (void)currentLocation:(NSDictionary *)locationDictionary {
    NSString *city = [locationDictionary valueForKey:@"City"];
    if (![_moreLabel.text isEqualToString:city]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"您定位到%@，确定切换城市吗？",city] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _moreLabel.text = city;
            [KCURRENTCITYINFODEFAULTS setObject:city forKey:@"locationCity"];
            [KCURRENTCITYINFODEFAULTS setObject:city forKey:@"currentCity"];
            [self.manager cityNumberWithCity:city cityNumber:^(NSString *cityNumber) {
                [KCURRENTCITYINFODEFAULTS setObject:cityNumber forKey:@"cityNumber"];
            }];
        }];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

/// 拒绝定位
- (void)refuseToUsePositioningSystem:(NSString *)message {
    NSLog(@"%@",message);
}

/// 定位失败
- (void)locateFailure:(NSString *)message {
    NSLog(@"%@",message);
}

//右边
- (void)infoBtnClick:(UIButton *)sender{
    [sender hideRedPoint];
}


- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, KHFullScreenWidth, KHFullScreenHeight - 64 - 49 - 40) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, WIDTH_K, 40)];
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.delegate = self;
        _searchBar.frame = CGRectMake(0, 5, WIDTH_K - 150, 30);
        //    _searchBar.backgroundColor = G_SEARCH;
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.layer.cornerRadius = 15;
        _searchBar.clipsToBounds = YES;
        _searchBar.translucent = YES; //是否半透明
        _searchBar.placeholder = @"输入店铺、商品";
        _searchBar.showsCancelButton = NO;
        [_searchBar setImage:[UIImage imageNamed:@"h_search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        for (UIView* subview in [[_searchBar.subviews lastObject] subviews]) {
            
            if ([subview isKindOfClass:[UITextField class]]) {
                UITextField *textField = (UITextField*)subview;
                //textField.background = [UIImage imageNamed:@"h_sousuo"];
                textField.textColor = H_SEARCHTIT;                         //修改输入字体的颜色
                [textField setBackgroundColor:H_SEARCHS];      //修改输入框的颜色
                [textField setValue:H_SEARCHTIT forKeyPath:@"_placeholderLabel.textColor"];   //修改placeholder的颜色
            } else if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subview removeFromSuperview];
            }
        }
        
        UIButton *search = [UIButton new];
        search.frame = FRAMEMAKE_F(0, 5, WIDTH_K - 100, 30);
        [search addTarget:self action:@selector(clickSearch:) forControlEvents:UIControlEventTouchUpInside];
        [_searchBar addSubview:search];
        
        [_titleView addSubview:_searchBar];
    }
    return _titleView;
}

//搜索
- (void)clickSearch:(UIButton *)button{
    NSLog(@"333");
}
#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    RecommendViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[RecommendViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.photoImage.image = [UIImage imageNamed:@"ceshiTwo"];
    [cell setShopName:@"江城理发店" substract:@"满100送20,满200送50" discount:@"全场5折" distance:@"500m" starNum:@"5.0" star:3.5];
    [cell.phoneButton addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.phoneButton.tag = indexPath.row;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

//打电话

- (void)phoneClick:(UIButton *)button{
    NSLog(@"---------打电话");
}


//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed=YES;
    ShopDetailVC *shopVC = [[ShopDetailVC alloc] init];
    [self.navigationController pushViewController:shopVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendViewCell *cell = (RecommendViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
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
