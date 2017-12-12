//
//  HomePageVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/15.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "HomePageVC.h"
#import "HomeMenuCell.h"
#import "RecommendViewCell.h"
#import "TimeLimViewCell.h"
#import "RushPurVC.h"
#import "GoodSearchVC.h"
#import "NewProductVC.h"
#import "WeekExplosiveVC.h"
#import "InfomationVC.h"
#import "ShopDetailVC.h"
@interface HomePageVC ()<UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate, UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation HomePageVC
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
     [self.view addSubview:self.homeTable];
    
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
    self.navigationItem.titleView = self.titleView;
    
    // Do any additional setup after loading the view.
}
//右边
- (void)infoBtnClick:(UIButton *)sender{
    [sender hideRedPoint];
    self.hidesBottomBarWhenPushed=YES;
    InfomationVC *infoVC = [[InfomationVC alloc] init];
    [self.navigationController pushViewController:infoVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (UITableView *)homeTable{
    if (!_homeTable) {
        _homeTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64 - 49) style:UITableViewStyleGrouped];
        _homeTable.dataSource = self;
        _homeTable.delegate = self;
        _homeTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        
    }
    return _homeTable;
}
- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, WIDTH_K, 40)];
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.delegate = self;
        _searchBar.frame = CGRectMake(40, 5, WIDTH_K - 120, 30);
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
    self.hidesBottomBarWhenPushed=YES;
    GoodSearchVC *searchVC = [[GoodSearchVC alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 10;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self sortCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
        
    }else if (indexPath.section == 1){
        return [self timeCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else {
        return [self shopCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }
    
    
}
//分类
- (UITableViewCell *)sortCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"menucell";
    HomeMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    NSArray *imgArray = @[@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne", @"ceshiOne", @"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne",@"ceshiOne", @"ceshiOne", @"ceshiOne",@"ceshiOne",@"ceshiOne", @"ceshiOne", @"ceshiOne"];
    NSArray *nameArr  = @[@"特价专区",@"美食",@"宾馆住宿",@"生鲜水果",@"海外代购",@"逢年过节", @"生活驿站", @"土特产", @"外卖", @"优惠券",@"特价专区",@"美食",@"宾馆住宿",@"生鲜水果",@"海外代购",@"逢年过节", @"生活驿站", @"土特产", @"外卖", @"优惠券"];
    
    if (!cell) {
        cell = [[HomeMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier imageArray:imgArray titleArray:nameArr];
    }
    
    
    __weak HomePageVC *selfBlock = self;
    cell.push =^(int string){
        if (string == 10) {
            selfBlock.hidesBottomBarWhenPushed=YES;
//            SpecialVC *hotelVC = [[SpecialVC alloc] init];
//            [selfBlock.navigationController pushViewController:hotelVC animated:YES];
            
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if(string == 20){
            selfBlock.hidesBottomBarWhenPushed=YES;
            NSLog(@"1111");
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 25){
            selfBlock.hidesBottomBarWhenPushed=YES;
           NSLog(@"2222");
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 3){
            selfBlock.hidesBottomBarWhenPushed=YES;
          
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 4){
            selfBlock.hidesBottomBarWhenPushed=YES;
           
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 5){
            selfBlock.hidesBottomBarWhenPushed=YES;
           
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 6){
            selfBlock.hidesBottomBarWhenPushed=YES;
           
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 7){
            selfBlock.hidesBottomBarWhenPushed=YES;
           
            selfBlock.hidesBottomBarWhenPushed=NO;
        }else if (string == 8){
            [self.view showHintView:@"暂未开通"];
        }else{
            [self.view showHintView:@"暂未开通"];
          
        }
    };
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//限时抢购

- (UITableViewCell *)timeCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    TimeLimViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[TimeLimViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.photoImg.image = [UIImage imageNamed:@"ceshiTwo"];
    [cell setLeftTitle:@"" centerTitle:@"新品推荐" rightTitle:@"本周爆品" time:3800];
    
    [cell.leftBtn addTarget:self action:@selector(leftSeledBtn:) forControlEvents:1<<6];
    [cell.centerBtn addTarget:self action:@selector(centerSeledBtn:) forControlEvents:1<<6];
    [cell.rightBtn addTarget:self action:@selector(rightSeledBtn:) forControlEvents:1<<6];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)leftSeledBtn:(UIButton *)button{
    self.hidesBottomBarWhenPushed=YES;
    RushPurVC *rushVC = [[RushPurVC alloc] init];
    [self.navigationController pushViewController:rushVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
- (void)centerSeledBtn:(UIButton *)button{
    self.hidesBottomBarWhenPushed=YES;
    NewProductVC *newVC = [[NewProductVC alloc] init];
    [self.navigationController pushViewController:newVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (void)rightSeledBtn:(UIButton *)button{
    self.hidesBottomBarWhenPushed=YES;
    WeekExplosiveVC *weekVC = [[WeekExplosiveVC alloc] init];
    [self.navigationController pushViewController:weekVC animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

//推荐商家
- (UITableViewCell *)shopCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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
    if (section == 0) {
        return WIDTH_K / 2 - 60;
    }else if (section == 1){
        return 0.001;
    }else{
        return 55;
    }
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else{
        return 0.001;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak HomePageVC *preferSelf = self;
    if (indexPath.section == 0) {
       
        return 216;
    }else if(indexPath.section == 1){
       
        TimeLimViewCell *newCell = (TimeLimViewCell *)[preferSelf tableView:_homeTable cellForRowAtIndexPath:indexPath];
        return newCell.frame.size.height;
    }else{
        RecommendViewCell *newCell = (RecommendViewCell *)[preferSelf tableView:_homeTable cellForRowAtIndexPath:indexPath];
        return newCell.frame.size.height;
    }
    
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 2) {
        self.hidesBottomBarWhenPushed=YES;
        ShopDetailVC *shopVC = [[ShopDetailVC alloc] init];
        [self.navigationController pushViewController:shopVC animated:YES];
        self.hidesBottomBarWhenPushed=NO;
    }
    
}

//区头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __strong UIView *view = [UIView new];
    //view.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KHFullScreenWidth, WIDTH_K / 2 - 60) delegate:self placeholderImage:[UIImage imageNamed:@"litongOne"]];
        //cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        //         --- 模拟加载延迟
        
        //cycleScrollView.imageURLStringsGroup = mainArray;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //cycleScrollView.imageURLStringsGroup = mainArray;
        });
        
        
        [view addSubview:cycleScrollView];
    }else if (section == 2){
        view.backgroundColor = [UIColor whiteColor];
        UIImageView *line = [UIImageView new];
        UIImageView *line1 = [UIImageView new];
        UIImageView *line2 = [UIImageView new];

        UILabel *_titleLabel = [UILabel new];
        LabelSet(_titleLabel, @"推荐商家", ME_COLOR_666666, 14, titleDic, titleSize);
        _titleLabel.frame = FRAMEMAKE_F(WIDTH_K / 2 - titleSize.width / 2, 20, titleSize.width, titleSize.height);
        
        
        line.image = [UIImage imageNamed:@"hang"];
        line.frame = FRAMEMAKE_F(CGRectGetMinX( _titleLabel.frame) - 8 - 30, CGRectGetMidY(_titleLabel.frame), 30, 1);
        
        line1.image = [UIImage imageNamed:@"hang"];
        line1.frame = FRAMEMAKE_F(CGRectGetMaxX( _titleLabel.frame) + 8 , CGRectGetMidY(_titleLabel.frame), 30, 1);
        
        line2.image = [UIImage imageNamed:@"hang"];
        line2.frame = FRAMEMAKE_F(0 , 54, WIDTH_K, 1);
        [view addSubview:_titleLabel];
        [view addSubview:line1];
        [view addSubview:line];
        [view addSubview:line2];
        
    }
    return view;
}

//头部点击事件
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if(cycleScrollView.tag == 120){
        
        self.hidesBottomBarWhenPushed=YES;
       
        self.hidesBottomBarWhenPushed= NO;
        
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
