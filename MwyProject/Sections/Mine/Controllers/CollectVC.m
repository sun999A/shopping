//
//  CollectVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "CollectVC.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"
#import "CshopController.h"
#import "CgoodController.h"
@interface CollectVC ()<SegmentTapViewDelegate,FlipTableViewDelegate>
@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;
@end

@implementation CollectVC
{
   
    CshopController *shopVC;
    CgoodController *goodVC;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"我的收藏"];
    [self initSegment];
    [self initFlipTableView];
    // Do any additional setup after loading the view.
}
-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_K, 40) withDataArray:[NSArray arrayWithObjects:@"商品",@"商家", nil] withFont:16];
    self.segment.textNomalColor = H_SHOPNAME;
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
-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    
    shopVC = [[CshopController alloc] init];
    goodVC = [[CgoodController alloc] init];
   
    [self.controllsArray addObject:goodVC];
    [self.controllsArray addObject:shopVC];
   
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 40, WIDTH_K, self.view.frame.size.height - 104) withArray:_controllsArray];
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
