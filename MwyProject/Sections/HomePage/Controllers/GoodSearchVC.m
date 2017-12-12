//
//  GoodSearchVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/19.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodSearchVC.h"
#import "SearchHisViewCell.h"
#import "GoodSearchDeVC.h"

#define KSearchRecordArr @"KsearchRecordArr"//搜索的记录
@interface GoodSearchVC ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UIButton *goodBtn;
    UIButton *shopBtn;
}
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation GoodSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self.view addSubview:self.myTableView];
    [self.view addSubview:self.topView];
    
    self.navigationItem.titleView = self.titleView;
    [self loadData];
    // Do any additional setup after loading the view.
}
- (UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.frame = CGRectMake(0, 0, WIDTH_K, 65);
        
        goodBtn = [UIButton new];
        goodBtn.layer.cornerRadius = 12;
        goodBtn.clipsToBounds = YES;
        [goodBtn setTitle:@"商品" forState:UIControlStateNormal];
        goodBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [goodBtn setTitleColor:H_GOODSEARCH forState:UIControlStateNormal];
        [goodBtn setTitleColor:H_GOODSEA forState:UIControlStateSelected];
        goodBtn.backgroundColor = [UIColor whiteColor];
        goodBtn.selected = YES;
        goodBtn.layer.borderColor = H_GOODSEA.CGColor;
       
        goodBtn.layer.borderWidth = 1;
        [goodBtn addTarget:self action:@selector(goodClick:) forControlEvents:UIControlEventTouchUpInside];
        NSDictionary *goodDic = StringFont_DicK(goodBtn.titleLabel.font);
        CGSize goodSize = [goodBtn.titleLabel.text  sizeWithAttributes:goodDic];
        
        goodBtn.frame = FRAMEMAKE_F(WIDTH_K / 2 - goodSize.width  - 70, 20, goodSize.width + 50, goodSize.height + 10)
        
        
        shopBtn = [UIButton new];
        shopBtn.layer.cornerRadius = 12;
        shopBtn.clipsToBounds = YES;
        [shopBtn setTitle:@"商家" forState:UIControlStateNormal];
        shopBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [shopBtn setTitleColor:H_GOODSEARCH forState:UIControlStateNormal];
        [shopBtn setTitleColor:H_GOODSEA forState:UIControlStateSelected];
        shopBtn.backgroundColor = [UIColor whiteColor];
        shopBtn.layer.borderColor = H_GOODSEARCH.CGColor;
        
        shopBtn.layer.borderWidth = 1;
         [shopBtn addTarget:self action:@selector(shopClick:) forControlEvents:UIControlEventTouchUpInside];
        NSDictionary *shopDic = StringFont_DicK(shopBtn.titleLabel.font);
        CGSize shopSize = [shopBtn.titleLabel.text  sizeWithAttributes:shopDic];
        
        shopBtn.frame = FRAMEMAKE_F(WIDTH_K / 2 + 20, 20, shopSize.width + 50, shopSize.height + 10)
        [_topView addSubview:goodBtn];
        [_topView addSubview:shopBtn];
        
        
        
    }
    return _topView;
}
//商品

- (void)goodClick:(UIButton *)button{
    button.selected = YES;
    shopBtn.selected = NO;
    goodBtn.layer.borderColor = H_GOODSEA.CGColor;
    shopBtn.layer.borderColor = H_GOODSEARCH.CGColor;
    
}

//店铺

- (void)shopClick:(UIButton *)button{
    button.selected = YES;
    goodBtn.selected = NO;
    goodBtn.layer.borderColor = H_GOODSEARCH.CGColor;
    shopBtn.layer.borderColor = H_GOODSEA.CGColor;
    
}
- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, WIDTH_K, 40)];
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.delegate = self;
        _searchBar.frame = CGRectMake(20, 5, WIDTH_K - 80, 30);

        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.layer.cornerRadius = 15;
        _searchBar.clipsToBounds = YES;
        _searchBar.translucent = YES; //是否半透明
        _searchBar.placeholder = @"商品搜索";
        _searchBar.showsCancelButton = NO;
        [_searchBar setImage:[UIImage imageNamed:@"h_search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
        for (UIView* subview in [[_searchBar.subviews lastObject] subviews]) {
            
            if ([subview isKindOfClass:[UITextField class]]) {
                UITextField *textField = (UITextField*)subview;
                //textField.background = [UIImage imageNamed:@"h_sousuo"];
                textField.textColor = [UIColor whiteColor];                         //修改输入字体的颜色
                [textField setBackgroundColor:H_SEARCHS];      //修改输入框的颜色
                [textField setValue:H_SEARCHTIT forKeyPath:@"_placeholderLabel.textColor"];   //修改placeholder的颜色
            } else if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [subview removeFromSuperview];
            }
        }
        
        
        [_titleView addSubview:_searchBar];
    }
    return _titleView;
}

-(NSMutableArray *)myArray{
    if (!_myArray) {
        _myArray = [NSMutableArray new];
    }
    return _myArray;
}
- (void)loadData{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *arr = [defaults objectForKey:KSearchRecordArr];
    if ((!(arr.count==0))&&(![arr isKindOfClass:[NSNull class]])) {
        
        //self.HistoryFooter.deleteBtn.enabled = YES;
        self.myArray = [arr mutableCopy];
    }
    
}



- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, KHFullScreenWidth, KHFullScreenHeight - 64 - 65) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}
#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    SearchHisViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SearchHisViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if (self.myArray.count!=0) {
        
        [cell setName:self.myArray[self.myArray.count-1-indexPath.row]];
    }

  
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}



//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchHisViewCell *cell = (SearchHisViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return  cell.frame.size.height;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     __strong UIView *view = [UIView new];
    UILabel *_titleLabel = [UILabel new];
    LabelSet(_titleLabel, @"搜索历史", SLABEL_ONE, 16, titleDic, titleSize);
    _titleLabel.frame = FRAMEMAKE_F(15, (45 - titleSize.height) / 2, titleSize.width, titleSize.height);
    
    
    UILabel *_moreLabel = [UILabel new];
    LabelSet(_moreLabel, @"清空", H_GOODSEARCH, 14, moreDic, moreSize);
    
    _moreLabel.frame = FRAMEMAKE_F(WIDTH_K - moreSize.width - 15, (45 - moreSize.height) / 2, moreSize.width, moreSize.height);
    
    UIImageView *moreImage = [UIImageView new];
    moreImage.image = [UIImage imageNamed:@"h_delete"];
    moreImage.frame = FRAMEMAKE_F(WIDTH_K - 15 - moreSize.width - 5 -moreImage.image.size.width, (45 - moreImage.image.size.height) / 2,  moreImage.image.size.width,  moreImage.image.size.height);
    
    
    UIButton *_moreButton = [UIButton new];
    [_moreButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    _moreButton.frame = FRAMEMAKE_F(WIDTH_K - LABLEIMAGE_K * 2 - moreSize.width - CGRectGetWidth(moreImage.frame) , _moreLabel.frame.origin.y, moreSize.width + CGRectGetWidth(moreImage.frame) + 5, moreSize.height);
    [_moreButton addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *line = [UIImageView new];
    [line setImage:[UIImage imageNamed:@"hang"]];
    line.frame = FRAMEMAKE_F(15, 45 - 1, WIDTH_K - 30, 1);
    [view addSubview:_moreLabel];
    [view addSubview:_moreButton];
    [view addSubview:moreImage];
    [view addSubview:_titleLabel];
    [view addSubview:line];
    return view;
}


- (void)deleteClick:(UIButton *)button{
    [self createdAlertview:@"确定要删除历史记录"];
}
- (void)createdAlertview:(NSString *)str{
    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:@"温馨提示" message:str  preferredStyle:UIAlertControllerStyleAlert];
    [alertCtl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alertCtl addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.myArray removeAllObjects];
        //self.HistoryFooter.deleteBtn.enabled = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.myArray forKey:KSearchRecordArr];
        [defaults synchronize];
        [self.myTableView reloadData];
        
    }]];
    [self presentViewController:alertCtl animated:YES completion:nil];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   

}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    //    [UIView animateWithDuration:0.3 animations:^{
    //        self.navigationController.navigationBarHidden = YES;
    //        _searchBar.frame = CGRectMake(0, 20, WIDTH_K, 44);
    _searchBar.showsCancelButton = YES;
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            cancel.titleLabel.font = [UIFont systemFontOfSize:14];
            [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
    //    }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    //    _searchBar.frame = CGRectMake(0, 0, WIDTH_K, 44);
    //    self.navigationController.navigationBarHidden = NO;
    _searchBar.showsCancelButton = NO;
    [_searchBar resignFirstResponder];
    _searchBar.text = @"";
    
    [_myTableView reloadData];
}

-(void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
     NSLog(@"search text :%@",[searchBar text]);
    [self.myArray addObject:[searchBar text]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.myArray forKey:KSearchRecordArr];
    [defaults synchronize];
    [self.myTableView reloadData];
    GoodSearchDeVC *search = [GoodSearchDeVC new];
    search.searchTitle = [searchBar text];
    [self.navigationController pushViewController:search animated:YES];
}

#pragma mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    NSLog(@"------%@", searchText);
    
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
