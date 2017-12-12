//
//  ViewControllerBase.m
//  Collector
//
//  Created by kunhong on 14-8-21.
//  Copyright (c) 2014年 kunhong. All rights reserved.
//

#import "ViewControllerBase.h"

@interface ViewControllerBase ()<UIGestureRecognizerDelegate>
@property(nullable, nonatomic, weak) id<UINavigationControllerDelegate> delegate;

@property(nullable, nonatomic, readonly) UIGestureRecognizer *interactivePopGestureRecognizer NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
@end

@implementation ViewControllerBase


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor= NAV_BG_COLOR;
    
}
//-(void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    if (SYSTEM_VERSION >= 7.0) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
//    }
//    
//}
//

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];  //左右 按钮 的 颜色
    self.edgesForExtendedLayout = UIRectEdgeNone;// 不延伸到bar下面
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;  //状态栏字体颜色
    //[self preferredStatusBarStyle];
    if (SYSTEM_VERSION >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;      // 手势有效设置为YES  无效为NO
        
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }

    
    // 记录当前正在操作的ViewController
    //[SessionUtil g].currentViewController = self;
    
    // 当堆栈中有视图的话，就出现返回按钮
    if (self.navigationController.viewControllers.count > 1 || self.presentingViewController)
    {
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0,22,30);
        [backButton setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backBtnClick:)
             forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *leftBtn  = [[UIBarButtonItem alloc]
                                     initWithCustomView:backButton];
        self.navigationItem.leftBarButtonItem = leftBtn;
        
    }
}

//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

// 设置视图的nav 头部文字
-(void)setNAVTitle:(NSString *)title
{
    if(self.navigationItem.titleView == nil)
    {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , 180, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
        if(title.length >= 10) // 10个汉字
        {
            titleLabel.font = [UIFont systemFontOfSize:16];  // 字多了就用小号字体
        }
        else
        {
            titleLabel.font = [UIFont systemFontOfSize:20];  // 字少了就用大号字体
        }
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        self.navigationItem.titleView = titleLabel;
    }
    else
    {
        ((UILabel *)self.navigationItem.titleView).text = title;
    }
}


// 事件：返回按钮点击事件
-(void)backBtnClick:(id)sender
{
    [self back];
}

// 返回上一个页面
-(void)back
{
    if(self.navigationController.viewControllers.count > 1)
    {
        // 当是Push进来的页面，用pop的方法弹出
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (self.presentingViewController) {
        // 当是present进来的页面，用dismiss的方法来关闭
        [self dismissViewControllerAnimated:YES completion:^(void){ }];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
