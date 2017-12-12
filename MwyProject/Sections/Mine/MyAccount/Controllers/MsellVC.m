//
//  MsellVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "MsellVC.h"
#import "MstatisticsViewCell.h"

@interface MsellVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation MsellVC

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

//设置每个区的行数
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell %ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    MstatisticsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MstatisticsViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
   
    [cell userName:@"零食" price:@"12.75万"];
    
    
    return cell;
    
}

///设置区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 45;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 50;
}

//区头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = S_BACKGROUND;
    
    UILabel *_shopLabel = [UILabel new];
    _shopLabel.textColor = H_SUBSTRACT;
    NSString *string = @"2017.1";
    NSString *str = [NSString stringWithFormat:@"日期: %@" , string];
    NSRange range = [str rangeOfString:[NSString stringWithFormat:@"%@" , string]];
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str];
    [attribute addAttribute:NSForegroundColorAttributeName value:H_SHOPNAME range:range];
    _shopLabel.font = [UIFont systemFontOfSize:15];
    _shopLabel.attributedText = attribute;
    
    NSDictionary *shopDic = StringFont_DicK(_shopLabel.font);
    CGSize shopSize = [_shopLabel.text sizeWithAttributes:shopDic];
    
    _shopLabel.frame = FRAMEMAKE_F(15, (45 - shopSize.height) / 2, shopSize.width, shopSize.height);
    
    
    [view addSubview:_shopLabel];
    return view;
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *priceLabel = [UILabel new];
    priceLabel.textColor = S_OPRICE;
  
    priceLabel.font = [UIFont systemFontOfSize:14];
    priceLabel.text = @"¥30.00万";
    //priceLabel.attributedText = attributePrice;
    
    NSDictionary *priceDic = StringFont_DicK(priceLabel.font);
    CGSize priceSize = [priceLabel.text sizeWithAttributes:priceDic];
    
    priceLabel.frame = FRAMEMAKE_F(WIDTH_K - 15 -  priceSize.width, (50 - priceSize.height) / 2, priceSize.width, priceSize.height);
    [self fuwenbenLabel:priceLabel FontNumber:[UIFont systemFontOfSize:12] AndRange:NSMakeRange(0, 1) AndColor:S_OPRICE];
    
    UILabel *sellLab = [UILabel new];
    LabelSet(sellLab, @"销售额共计:", ME_COLOR_CELLTEXTLABEL, 14, sellDic, sellSize);
    sellLab.frame = FRAMEMAKE_F(WIDTH_K - 27 - priceSize.width - sellSize.width, (50 - sellSize.height) / 2, sellSize.width, sellSize.height);

    [view addSubview:priceLabel];
    [view addSubview:sellLab];
    return view;
}



//设置不同字体颜色
-(void)fuwenbenLabel:(UILabel *)labell FontNumber:(id)font AndRange:(NSRange)range AndColor:(UIColor *)vaColor
{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:labell.text];
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:vaColor range:range];
    labell.attributedText = str;
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak MsellVC *favSelf = self;
    MstatisticsViewCell *cell = (MstatisticsViewCell *)[favSelf tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
