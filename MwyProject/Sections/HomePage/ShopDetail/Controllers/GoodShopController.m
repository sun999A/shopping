//
//  GoodShopController.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/23.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodShopController.h"
#import "LJCollectionViewFlowLayout.h"
#import "CollectionViewCell.h"

static NSString *goodIdentifier = @"good";
@interface GoodShopController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GoodShopController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
     [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view.
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
        flowlayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        flowlayout.itemSize = CGSizeMake((WIDTH_K - 15) / 2 , (WIDTH_K - 15) / 2 + 60);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 154) collectionViewLayout:flowlayout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView setBackgroundColor: S_BACKGROUND];
        //注册cell
      
        
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:goodIdentifier];
        

    }
    return _collectionView;
}

#pragma mark - collectionView代理方法实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodIdentifier forIndexPath:indexPath];
    cell.imageV.image = [UIImage imageNamed:@"ceshiThree"] ;
    [cell setName:@"春节特价大礼包,春节特价大礼包,春节特价大礼包" price:@"79999.99" disPrice:@"¥80000.00"];
    
    
    return cell;

}

//点击
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
