//
//  GoodRushVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodRushVC.h"
#import "GoodRushDetailVC.h"
#import "ShopGoDetailVC.h"
@interface GoodRushVC ()<UIScrollViewDelegate>
{
    GoodRushDetailVC *goodVC;
    ShopGoDetailVC *detailVC;
}
@property (nonatomic , strong) UISegmentedControl *segmentController;
@end

@implementation GoodRushVC

- (void)loadView
{
    [super loadView];
    self.rootView = [[RootView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *searchImage = [UIImage imageNamed:@"g_cart"];
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, searchImage.size.width,searchImage.size.height);
    [searchButton setImage:searchImage forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(cartItem:)
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
    
    self.segmentController = [[UISegmentedControl alloc] initWithItems:@[@"商品" , @"详情"]];
    self.segmentController.frame = CGRectMake(0, 22, 150, 30);
    [self.segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateSelected];
    [self.segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName: H_TOP, NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    //[self.segmentController setBackgroundImage:[UIImage new] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    [self.segmentController setTintColor: [UIColor clearColor]];
    self.segmentController.selectedSegmentIndex = 0;
    //添加点击事件
    [self.segmentController addTarget:self action:@selector(segmentControllerAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segmentController;
    
    
    goodVC = [[GoodRushDetailVC alloc] init];
    
    detailVC = [[ShopGoDetailVC alloc] init];
    
    
    
    //添加子控制器
    [self addChildViewController:goodVC];
    [self addChildViewController:detailVC];
    goodVC.view.frame = CGRectMake(0, 0, WIDTH_K, HEIGHT_K);
    detailVC.view.frame = CGRectMake(WIDTH_K, 0, WIDTH_K, HEIGHT_K);
//    [self.view addSubview:goodVC.view];
//    [self.view addSubview:detailVC.view];
    
    [self.rootView.scrollerView addSubview:goodVC.view];
    [self.rootView.scrollerView addSubview:detailVC.view];
    self.rootView.scrollerView.delegate = self;
    self.rootView.scrollerView.scrollEnabled = NO;
    // Do any additional setup after loading the view.
}
//返回

- (void)cartItem:(UIButton *)button{
    NSLog(@"2222");
}
//搜索
- (void)moreItem:(UIButton *)button{
    NSLog(@"1111");
}
#pragma mark - scroller 代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //拿到偏移量
    CGPoint offset = scrollView.contentOffset;
    //算出偏移了几个frame.width
    NSInteger currentIndex = offset.x / self.rootView.frame.size.width;
    //根据currenrIndex 修改pageControl显示的点的位置
    self.segmentController.selectedSegmentIndex = currentIndex;
    
}

#pragma mark - segment点击事件实现
- (void)segmentControllerAction:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            //商品
        {
            self.rootView.scrollerView.contentOffset = CGPointMake(0, 0);
            //self.view.frame = FRAMEMAKE_F(0, 0, WIDTH_K, HEIGHT_K);
        }
            ;
            break;
        case 1:
            //详情
        {
            self.rootView.scrollerView.contentOffset = CGPointMake(WIDTH_K, 0);
            //self.view.frame = FRAMEMAKE_F(WIDTH_K, 0, WIDTH_K, HEIGHT_K);
        }
            
        default:
            break;
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
