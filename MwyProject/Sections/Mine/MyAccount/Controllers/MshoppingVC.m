//
//  MshoppingVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MshoppingVC.h"
#import "MshoppingViewCell.h"
@interface MshoppingVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MshoppingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNAVTitle:@"销售统计"];
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = S_BACKGROUND;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell %ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MshoppingViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MshoppingViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.imgView.image = [UIImage imageNamed:@"ceshiThree"];
    [cell setShop:@"杭州孙记店" name:@"孙大大" deal:@"月交易额:" price:@"¥20000"];
    
    return cell;
    
}
///设置区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 45;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak MshoppingVC *favSelf = self;
    MshoppingViewCell *cell = (MshoppingViewCell *)[favSelf tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
//区头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = S_BACKGROUND;
    
    UILabel *_shopLabel = [UILabel new];
    _shopLabel.textColor = ME_COLOR_CELLTEXTLABEL;
    _shopLabel.font = [UIFont systemFontOfSize:15];
    _shopLabel.text = @"所有商家 (120)";
    
    NSDictionary *shopDic = StringFont_DicK(_shopLabel.font);
    CGSize shopSize = [_shopLabel.text sizeWithAttributes:shopDic];
    
    _shopLabel.frame = FRAMEMAKE_F(15, (45 - shopSize.height) / 2, shopSize.width, shopSize.height);
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"m_ascend"];
    imgView.frame = FRAMEMAKE_F(WIDTH_K - 15 - imgView.image.size.width, (45 - imgView.image.size.height) / 2, imgView.image.size.width,imgView.image.size.height)
    
    UILabel *dealLab = [UILabel new];
    LabelSet(dealLab, @"月交易额升序", NAV_BG_COLOR, 15, dealDic, dealSize);
    dealLab.frame = FRAMEMAKE_F(WIDTH_K - 25 - CGRectGetWidth(imgView.frame) - dealSize.width, (45 - dealSize.height) / 2, dealSize.width, dealSize.height)
    
    [view addSubview:imgView];
    [view addSubview:dealLab];
    [view addSubview:_shopLabel];
    return view;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
