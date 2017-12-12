//
//  ShopGoDetailVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/22.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "ShopGoDetailVC.h"
#import "SegmentTapView.h"
#import "GoodImageController.h"
#import "GoodProductController.h"
#import "GoodShopController.h"
#import "FlipTableView.h"
#import "GoodButton.h"
@interface ShopGoDetailVC ()<SegmentTapViewDelegate,FlipTableViewDelegate>
@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;

@end

@implementation ShopGoDetailVC
{

    GoodImageController *imageVC;
    GoodProductController *productVC;
    GoodShopController *shopVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initSegment];
    [self initFlipTableView];
    [self.view addSubview:self.bottomView];
    // Do any additional setup after loading the view.
}
-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_K, 40) withDataArray:[NSArray arrayWithObjects:@"图文详情",@"产品参数",@"店铺推荐", nil] withFont:16];
    self.segment.textNomalColor = ME_COLOR_666666;
    self.segment.textSelectedColor = NAV_BG_COLOR;
    self.segment.lineColor = NAV_BG_COLOR;
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"hang"];
    imageView.alpha = 0.5;
    imageView.frame = FRAMEMAKE_F(0, CGRectGetMaxY(self.segment.frame) - 1, WIDTH_K,  1);
    [self.view addSubview:imageView];
    
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT_K - 64 - 50, WIDTH_K, 50)];
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0,  0, WIDTH_K, 1)];
        line.image = [UIImage imageNamed:@"hang"];
        [_bottomView addSubview:line];
        
        UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(50 - 1,  10, 1, 50 - 20)];
        line1.image = [UIImage imageNamed:@"shu"];
        [_bottomView addSubview:line1];
        
        UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(100 - 1,  10, 1, 50 - 20)];
        line2.image = [UIImage imageNamed:@"shu"];
        [_bottomView addSubview:line2];
        
        
        NSArray *imgArray = @[@"g_shoucang",@"g_shangjia",@"g_dianhua"];
        NSArray *nameArr  = @[@"收藏",@"商家",@"咨询"];
        for (int i = 0; i < imgArray.count; i ++){
            __strong GoodButton *btn = [[GoodButton alloc]init];
            [btn selfSelectionImageName:[imgArray objectAtIndex:i] labelString:[nameArr objectAtIndex:i] balanceText:nil];
            btn.labelText.textColor = [UIColor grayColor];
            if (i == 0) {
                btn.frame = FRAMEMAKE_F( ((150 / 3) * (i % 3)) + 12, 5,50,50);
            }else if (i == 1) {
                btn.frame = FRAMEMAKE_F( ((150 / 3) * (i % 3)) + 12, 7,50,50);
            } else{
                btn.frame = FRAMEMAKE_F( ((150 / 3) * (i % 3)) + 12, 6,50,50);
                
            }
            btn.tag = i;
            [btn addTarget:self action:@selector(userButtonClick:) forControlEvents:1<<6];
            [_bottomView addSubview:btn];
            
            
            //加入购物车
            UIButton *buyCartBtn = [UIButton new];
            [buyCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
            buyCartBtn.titleLabel.font = TITLEFONT_16;
            [buyCartBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            //            NSDictionary *setDic = StringFont_DicK(buyBtn.titleLabel.font);
            //            CGSize setSize = [buyBtn.titleLabel.text sizeWithAttributes:setDic];
            //settleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            //settleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            [buyCartBtn addTarget:self action:@selector(cartBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [buyCartBtn setBackgroundColor:H_CART];
            buyCartBtn.frame = FRAMEMAKE_F(WIDTH_K -(WIDTH_K - 150), 0, (WIDTH_K - 150) / 2, CGRectGetHeight(_bottomView.frame));
            [_bottomView addSubview:buyCartBtn];
            
            //立即购买
            UIButton *buyBtn = [UIButton new];
            [buyBtn setTitle:@"立即购买" forState:UIControlStateNormal];
            buyBtn.titleLabel.font = TITLEFONT_16;
            [buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [buyBtn addTarget:self action:@selector(buyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [buyBtn setBackgroundColor:NAV_BG_COLOR];
            buyBtn.frame = FRAMEMAKE_F(CGRectGetMaxX(buyCartBtn.frame), 0, (WIDTH_K - 150) / 2, CGRectGetHeight(_bottomView.frame));
            [_bottomView addSubview:buyBtn];
            
        }
    }
    
    
    return _bottomView;
    
}

//收藏 商家 咨询
-(void)userButtonClick:(id)sender{
    UIButton *button = (UIButton *)sender;
    if (button.tag == 0) {
        NSLog(@"11111");
    }else{
        NSLog(@"2222");
        
    }
}

//加入购物车
-(void)cartBtnClick:(UIButton *)sender{
    NSLog(@"2222");
}
//立即购买
-(void)buyBtnClick:(UIButton *)sender{
    NSLog(@"11111");
}

-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    
    imageVC = [[GoodImageController alloc] init];
    productVC = [[GoodProductController alloc] init];
    shopVC = [[GoodShopController alloc] init];
    [self.controllsArray addObject:imageVC];
    [self.controllsArray addObject:productVC];
    [self.controllsArray addObject:shopVC];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 40, WIDTH_K, self.view.frame.size.height - 154) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
}
#pragma mark -------- select Index
-(void)selectedIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.flipView selectIndex:index];
    
}
-(void)scrollChangeToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.segment selectIndex:index];
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
