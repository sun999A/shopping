//
//  ShopDetailVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/20.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "ShopDetailVC.h"
#import "LJCollectionViewFlowLayout.h"
#import "AddressCollectionViewCell.h"
#import "DiscountCollectionViewCell.h"
#import "CommentCollectionViewCell.h"
#import "CollectionViewCell.h"
#import "LookDetailVC.h"
#import "UINavigationBar+Background.h"
#import "XTPopView.h"
#import "GoodDetailVC.h"
static NSString *headerIdentifier = @"header";
static NSString *footerIdentifier = @"footer";

static NSString *addressIdentifier = @"address";
static NSString *discountIdentifier = @"discount";
static NSString *commentIdentifier = @"comment";
static NSString *goodIdentifier = @"good";
@interface ShopDetailVC ()<UICollectionViewDelegate, UICollectionViewDataSource, SDCycleScrollViewDelegate, selectIndexPathDelegate>
{
    NSInteger *scrollNum;
    UILabel *_titleLabelOne;
}
@end

@implementation ShopDetailVC
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   

    [self.navigationController.navigationBar cnSetBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBar.shadowImage = [UIImage new];

    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;//导航栏的背景色是黑色, 字体为白色
    
    
    
    //[self.navigationController.navigationBar setShadowImage:[UIImage new]];//用于去除导航栏的底线，也就是周围的边线
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //    self.myTableView.delegate = nil;
     [self.navigationController.navigationBar cnReset];
    
    
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
     [self.navigationController.navigationBar cnReset];

    UIColor *color = NAV_BG_COLOR;
    CGFloat offsetY = scrollView.contentOffset.y;
//    NSLog(@"-----1111%f", offsetY);
//     NSLog(@"-----2222%f", _collectionView.contentOffset.y);
    if (offsetY >   250) {
        //CGFloat alpha = MIN(1, (_halfHeight + 64 + offsetY)/_halfHeight);
         CGFloat alpha = (_collectionView.contentOffset.y - 250)/250;
        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:alpha]];
       
        
        UIImage *leftImage = [UIImage imageNamed:@"nav_back"];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, leftImage.size.width,leftImage.size.height);
        [leftButton setImage:leftImage forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(leftItem:)
             forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        
        UIImage *searchImage = [UIImage imageNamed:@"h_tsearch"];
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        searchButton.frame = CGRectMake(0, 0, searchImage.size.width,searchImage.size.height);
        [searchButton setImage:searchImage forState:UIControlStateNormal];
        [searchButton addTarget:self action:@selector(searchItem:)
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
    

        //_descriptionView.alpha = 1 - alpha;
    } else{
        [self.navigationController.navigationBar cnSetBackgroundColor:[color colorWithAlphaComponent:0]];
        
        UIImage *leftImage = [UIImage imageNamed:@"h_gback"];
        UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        leftButton.frame = CGRectMake(0, 0, leftImage.size.width,leftImage.size.height);
        [leftButton setImage:leftImage forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(leftItem:)
             forControlEvents:UIControlEventTouchUpInside];
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        
        
        UIImage *searchImage = [UIImage imageNamed:@"h_gsearch"];
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        searchButton.frame = CGRectMake(0, 0, searchImage.size.width,searchImage.size.height);
        [searchButton setImage:searchImage forState:UIControlStateNormal];
        [searchButton addTarget:self action:@selector(searchItem:)
               forControlEvents:UIControlEventTouchUpInside];
        
        UIImage *moreImage = [UIImage imageNamed:@"h_ggengduo"];
        UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        moreButton.frame = CGRectMake(0, 0, moreImage.size.width,moreImage.size.height);
        [moreButton setImage:moreImage forState:UIControlStateNormal];
        [moreButton addTarget:self action:@selector(moreItem:)
             forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *rightSearch  = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
        
        UIBarButtonItem *rightMore  = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
        
        self.navigationItem.rightBarButtonItems = @[rightMore, rightSearch];

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    //[self setNAVTitle:@"店铺详情"];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
    UIImage *leftImage = [UIImage imageNamed:@"h_gback"];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, leftImage.size.width,leftImage.size.height);
    [leftButton setImage:leftImage forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftItem:)
           forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
   
    
    UIImage *searchImage = [UIImage imageNamed:@"h_gsearch"];
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.frame = CGRectMake(0, 0, searchImage.size.width,searchImage.size.height);
    [searchButton setImage:searchImage forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchItem:)
           forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *moreImage = [UIImage imageNamed:@"h_ggengduo"];
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(0, 0, moreImage.size.width,moreImage.size.height);
    [moreButton setImage:moreImage forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(moreItem:)
         forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightSearch  = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    
    UIBarButtonItem *rightMore  = [[UIBarButtonItem alloc] initWithCustomView:moreButton];
    
    self.navigationItem.rightBarButtonItems = @[rightMore, rightSearch];
}
//返回

- (void)leftItem:(UIBarButtonItem *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
//搜索
- (void)searchItem:(UIButton *)button{
    NSLog(@"1111");
}

//更多
- (void)moreItem:(UIButton *)button{
    NSLog(@"2222");
    /**
     XTTypeOfUpLeft,     // 上左
     XTTypeOfUpCenter,   // 上中
     XTTypeOfUpRight,    // 上右
     
     XTTypeOfDownLeft,   // 下左
     XTTypeOfDownCenter, // 下中
     XTTypeOfDownRight,  // 下右
     
     XTTypeOfLeftUp,     // 左上
     XTTypeOfLeftCenter, // 左中
     XTTypeOfLeftDown,   // 左下
     
     XTTypeOfRightUp,    // 右上
     XTTypeOfRightCenter,// 右中
     XTTypeOfRightDown,  // 右下
     */

    CGPoint point = CGPointMake(button.center.x,button.frame.origin.y + 55);
    XTPopView *view1 = [[XTPopView alloc] initWithOrigin:point Width:130 Height:40 * 3 Type:XTTypeOfUpRight Color:[UIColor whiteColor]];
    view1.dataArray = @[@"首页",@"消息", @"收藏"];
    view1.images = @[@"h_shouye",@"h_sxiaoxi", @"h_shoucang"];
    view1.fontSize = 14;
    view1.row_height = 40;
    view1.titleTextColor = ME_COLOR_666666;
    view1.delegate = self;
    [view1 popView];
}

- (void)selectIndexPathRow:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            NSLog(@"Click 0 ......");
        }
            break;
        case 1:
        {
            NSLog(@"Clikc 1 ......");
        }
            break;
        case 2:
        {
            NSLog(@"Clikc 2 ......");
        }
            break;
        default:
            break;
    }
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        LJCollectionViewFlowLayout *flowlayout = [[LJCollectionViewFlowLayout alloc] init];
        //设置滚动方向
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        //左右间距
        flowlayout.minimumInteritemSpacing = 5;
        //上下间距
        flowlayout.minimumLineSpacing = 5;
        //flowlayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowlayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor: S_BACKGROUND];
        //注册cell
        [_collectionView registerClass:[AddressCollectionViewCell class] forCellWithReuseIdentifier:addressIdentifier];
        [_collectionView registerClass:[DiscountCollectionViewCell class] forCellWithReuseIdentifier:discountIdentifier];
        
         [_collectionView registerClass:[CommentCollectionViewCell class] forCellWithReuseIdentifier:commentIdentifier];
        
         [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:goodIdentifier];
        
        
        //collectionView注册头分区的id
        //[self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
        
        
        //collectionView注册脚分区的id
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier];
    }
    return _collectionView;
}

#pragma mark - collectionView代理方法实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0 || section == 1 || section == 2) {
        return 1;
    } else {
        return 20;
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

#pragma mark - item 大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        return CGSizeMake(WIDTH_K , 90);
        
    } else if (indexPath.section == 1) {
        
        return CGSizeMake(WIDTH_K , 60);
        
    } else  if (indexPath.section == 2) {
        
        return CGSizeMake(WIDTH_K , 45);
        
    } else{
        return CGSizeMake((WIDTH_K - 15) / 2 , (WIDTH_K - 15) / 2 + 60);
    }
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self addressCollectionView:_collectionView cellForItemAtIndexPath:indexPath];
        
    }else if (indexPath.section == 1){
        return [self discountCollectionView:_collectionView cellForItemAtIndexPath:indexPath];
    }else  if (indexPath.section == 2){
        return [self commentCollectionView:_collectionView cellForItemAtIndexPath:indexPath];
    }else{
       return [self goodCollectionView:_collectionView cellForItemAtIndexPath:indexPath];
    }

}


//地址
- (UICollectionViewCell *)addressCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    AddressCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:addressIdentifier forIndexPath:indexPath];
    
    [cell setName:@"杭州市滨江区江晖路487号3号楼903"];
    [cell.phoneBtn addTarget:self action:@selector(phoneButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

//电话

- (void)phoneButton:(UIButton *)button{
    NSString *phone = @"15612341234";
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",phone];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];

}
//减 折
- (UICollectionViewCell *)discountCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DiscountCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:discountIdentifier forIndexPath:indexPath];
    
    [cell setShopSubstract:@"满100减20,满200减50" discount:@"全场5折"];
    [cell.shopBtn addTarget:self action:@selector(detailButton:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
//商家详情

- (void)detailButton:(UIButton *)button{
    LookDetailVC *lookVC = [[LookDetailVC alloc] init];
    [self.navigationController pushViewController:lookVC animated:YES];
}


//评价
- (UICollectionViewCell *)commentCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:commentIdentifier forIndexPath:indexPath];
    [cell setShopStarNum:@"5.0" star:3.5];
    
    
    return cell;
}


//商品
- (UICollectionViewCell *)goodCollectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodIdentifier forIndexPath:indexPath];
    cell.imageV.image = [UIImage imageNamed:@"ceshiThree"] ;
    [cell setName:@"春节特价大礼包,春节特价大礼包,春节特价大礼包" price:@"79999.99" disPrice:@"¥80000.00"];
    
    
    return cell;
}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodDetailVC *goodVC = [[GoodDetailVC alloc] init];
    [self.navigationController pushViewController:goodVC animated:YES];
}
#pragma mark - 头脚高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(WIDTH_K , WIDTH_K / 2 + 60);
    }else if (section == 1 || section == 2) {
        return CGSizeMake(WIDTH_K ,1);
    } else{
        return CGSizeMake(WIDTH_K, 45);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(WIDTH_K ,1);
    }else if (section == 1 || section == 2) {
        return CGSizeMake(WIDTH_K ,10);
    } else{
        return CGSizeMake(WIDTH_K, 10);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                         layout:(UICollectionViewLayout *)collectionViewLayout
         insetForSectionAtIndex:(NSInteger)section{
    if (section == 3) {
        return UIEdgeInsetsMake(5, 5, 5.0f, 5.0f);
        
    }else{
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *headIdentifier=[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headIdentifier];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headIdentifier forIndexPath:indexPath];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KHFullScreenWidth, WIDTH_K / 2 + 60) delegate:self placeholderImage:[UIImage imageNamed:@"litongOne"]];
        if (indexPath.section == 0) {
            //cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
            cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
            //         --- 模拟加载延迟
            cycleScrollView.autoScroll = NO;
            cycleScrollView.showPageControl = NO;
            cycleScrollView.titleLabelTextFont = [UIFont systemFontOfSize:16];
            

            
            //cycleScrollView.imageURLStringsGroup = mainArray;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                cycleScrollView.imageURLStringsGroup = @[@"ceshiOne", @"ceshiTwo", @"ceshiThree"];
                //cycleScrollView.titlesGroup = @[@"印象杭州", @"印象郑州", @"印象上海"];
            });
            NSInteger num = 3;
            NSString *title = [NSString stringWithFormat:@" 1/%ld ", num];
           
            UIImageView *bottomView = [UIImageView new];
            bottomView.image = [UIImage imageNamed:@"h_detail"];
            bottomView.frame = FRAMEMAKE_F(0, CGRectGetMaxY(cycleScrollView.frame) - 30, WIDTH_K, 30);
            [cycleScrollView addSubview:bottomView];
            
            _titleLabelOne = [UILabel new];
            LabelSet(_titleLabelOne, title, [UIColor whiteColor], 16, titleDic, titleSize);
            _titleLabelOne.frame = FRAMEMAKE_F(WIDTH_K  - titleSize.width - 15, 7, titleSize.width, titleSize.height);
            [bottomView addSubview:_titleLabelOne];
            
            
            UILabel *_titleLabel = [UILabel new];
            LabelSet(_titleLabel, @"印象杭州", [UIColor whiteColor], 16, titlesDic, titlesSize);
            _titleLabel.frame = FRAMEMAKE_F(15, 7, titlesSize.width, titlesSize.height);
            [bottomView addSubview:_titleLabelOne];
             [bottomView addSubview:_titleLabel];
            [view addSubview:cycleScrollView];
            cycleScrollView.backgroundColor = [UIColor greenColor];
        }else if(indexPath.section == 3){
            view.backgroundColor = [UIColor whiteColor];
            UIImageView *line = [UIImageView new];
            UIImageView *line1 = [UIImageView new];
           
            UILabel *_titleLabel = [UILabel new];
            LabelSet(_titleLabel, @"商家商品", ME_COLOR_666666, 15, titleDic, titleSize);
            _titleLabel.frame = FRAMEMAKE_F(WIDTH_K / 2 - titleSize.width / 2, (45-titleSize.height) / 2, titleSize.width, titleSize.height);
            
            
            line.image = [UIImage imageNamed:@"hang"];
            line.frame = FRAMEMAKE_F(CGRectGetMinX( _titleLabel.frame) - 8 - 30, CGRectGetMidY(_titleLabel.frame), 30, 1);
            
            line1.image = [UIImage imageNamed:@"hang"];
            line1.frame = FRAMEMAKE_F(CGRectGetMaxX( _titleLabel.frame) + 8 , CGRectGetMidY(_titleLabel.frame), 30, 1);
            
//            line2.image = [UIImage imageNamed:@"hang"];
//            line2.frame = FRAMEMAKE_F(0 , 54, WIDTH_K, 1);
            [view addSubview:_titleLabel];
            [view addSubview:line1];
            [view addSubview:line];
            //[view addSubview:line2];

        }else{
             view.backgroundColor = [UIColor whiteColor];
        }
        
        return view;
    }else {
         UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
        
        if (indexPath.section == 1 || indexPath.section == 2){
            view.backgroundColor = S_BACKGROUND;
        }else{
            view.backgroundColor = S_BACKGROUND;
        }
        return view;
    }
   
    
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    NSLog(@"-----%ld", index);
    _titleLabelOne.text = [NSString stringWithFormat:@"%ld/3", index + 1];
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"-----%ld", index);
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
