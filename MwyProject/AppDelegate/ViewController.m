//
//  ViewController.m
//  LitongProject
//
//  Created by Snail iOS on 16/9/21.
//  Copyright © 2016年 Feiyu iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>


@property(nonatomic,strong)HomePageVC *page1;
@property(nonatomic,strong)LeagueShopVC *page2;
@property(nonatomic,strong)WorryPrecionsVC *page3;
@property (nonatomic, strong) ShopCartVC *page4;
@property(nonatomic,strong)MineVC *page5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.delegate = self;
    
    self.page1=[[HomePageVC alloc]init];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:self.page1];
    self.page1.tabBarItem.image = [[UIImage imageNamed:@"tab_home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_homeselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page1.tabBarItem.title = @"首页";
    //[self addChildViewController:nav1];
    
    self.page2=[[LeagueShopVC alloc]init];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:self.page2];
    self.page2.tabBarItem.image = [[UIImage imageNamed:@"tab_league"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_leagueselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page2.tabBarItem.title = @"联盟商家";
    //[self addChildViewController:nav2];
    
    self.page3=[[WorryPrecionsVC alloc]init];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:self.page3];
    self.page3.tabBarItem.image = [[UIImage imageNamed:@"tab_worry"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_worryselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page3.tabBarItem.title = @"无忧宝";
    //[self addChildViewController:nav3];
    
    self.page4=[[ShopCartVC alloc]init];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:self.page4];
    self.page4.tabBarItem.image = [[UIImage imageNamed:@"tab_cart"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_cartselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page4.tabBarItem.title = @"购物车";
    self.page4.tabBarItem.tag = 3;
    //self.page4.tabBarItem.badgeValue = @"2";
    
    
    self.page5=[[MineVC alloc]init];
    UINavigationController *nav5=[[UINavigationController alloc]initWithRootViewController:self.page5];
    self.page5.tabBarItem.image = [[UIImage imageNamed:@"tab_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page5.tabBarItem.selectedImage = [[UIImage imageNamed:@"tab_mineselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.page5.tabBarItem.title = @"我的";
    self.page5.tabBarItem.tag = 4;
    //    [self.page4.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    //     [self.page4.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor greenColor]} forState:UIControlStateNormal];
    
    
    //[self addChildViewController:nav4];
    //RGBCOLOR(233, 95, 29)
    self.tabBar.tintColor = NAV_BG_COLOR;
    self.tabBar.barTintColor = [UIColor whiteColor];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4, nav5];

    // Do any additional setup after loading the view.
}
- (void)setTabBarItem:(UITabBarItem *)item image:(NSString *)image selectedImage:(NSString *)selected title:(NSString *)title tag:(NSInteger)tag{
    
    
    item.title = title;
    
    item.tag = tag;
    
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
