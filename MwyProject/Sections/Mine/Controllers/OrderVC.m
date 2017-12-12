//
//  OrderVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/5.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "OrderVC.h"
#import "LSHorizontalMenuView.h"
#import "OrderGoodViewCell.h"
#import "EvaluateVC.h"
@interface OrderVC ()<LSHorizontalMenuViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation OrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNAVTitle:@"我的订单"];
    self.hidesBottomBarWhenPushed = YES;
    LSHorizontalMenuView *menuView = [[LSHorizontalMenuView alloc] initWithFrame:CGRectMake(0, 0, WIDTH_K, 44)];
    menuView.delegate = self;
    [menuView setTitleColor:H_SUBSTRACT forState:UIControlStateNormal];
    [menuView setButtonTitles:@[@"全部",@"待付款", @"待发货", @"待收货", @"待评价"] canMove:YES index:0];
    [menuView moveIndex:_moveInteger];
    menuView.itemstyle = UIHorItemStyleHorLine;
    
    [self.view addSubview:menuView];
    
    
    _orderTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, KHFullScreenWidth, KHFullScreenHeight - 64 - 44) style:UITableViewStyleGrouped];
    _orderTable.dataSource = self;
    _orderTable.delegate = self;
    _orderTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_orderTable];
    // Do any additional setup after loading the view.
}

- (void)menuView:(LSHorizontalMenuView*)menuView didSelectItemAtIndex:(NSInteger)index{
    
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
    OrderGoodViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[OrderGoodViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.imgView setImage:[UIImage imageNamed:@"ceshiThree"]];
    [cell setName:@"好坚果立即抢购 好坚果立即抢购 好坚果立即抢购 好坚果立即抢购" priceNum:@"x1" price:@"¥30.00" standard:@"规格: 大包"];
    
    
    return cell;
    
}

///设置区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 55;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 140;
}

//区头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    view.backgroundColor = S_BACKGROUND;
    
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor whiteColor];
    backView.frame = FRAMEMAKE_F(0, 10, WIDTH_K, 45);
    
    UIView *shopView = [UIView new];
    UIImageView *_photoImage = [UIImageView new];
    _photoImage.image = [UIImage imageNamed:@"g_shangjia"];
    _photoImage.frame = FRAMEMAKE_F(LABLEIMAGE_K + 5, (45 - _photoImage.image.size.height) / 2, _photoImage.image.size.width, _photoImage.image.size.height);
   
    
    UILabel *_titleLabel = [UILabel new];
    LabelSet(_titleLabel, @"孙记店", ME_COLOR_666666, 15, titleDic, titleSize);
    _titleLabel.frame = FRAMEMAKE_F(CGRectGetMaxX(_photoImage.frame) + 10, (45 - titleSize.height) / 2, titleSize.width, titleSize.height);
    
    UIImageView *backImage = [UIImageView new];
    backImage.image = [UIImage imageNamed:@"s_arrow"];
    backImage.frame = FRAMEMAKE_F(CGRectGetMaxX(_titleLabel.frame) + 15, (45 - backImage.image.size.height) / 2, backImage.image.size.width, backImage.image.size.height);
    [shopView addSubview:_photoImage];
    [shopView addSubview:_titleLabel];
    [shopView addSubview:backImage];
    
    shopView.userInteractionEnabled = YES;
    shopView.frame = FRAMEMAKE_F(0, 0, CGRectGetWidth(_photoImage.frame) + CGRectGetWidth(backImage.frame) + CGRectGetWidth(_titleLabel.frame) + 40, 45);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shopClick:)];
    [shopView addGestureRecognizer:tap];

    
    
    UILabel *_moreLabel = [UILabel new];
    LabelSet(_moreLabel, @"待付款", NAV_BG_COLOR, 14, moreDic, moreSize);
    
    _moreLabel.frame = FRAMEMAKE_F(WIDTH_K - moreSize.width - 15, (45 - moreSize.height) / 2, moreSize.width, moreSize.height);
    

    [backView addSubview:shopView];
    [backView addSubview:_moreLabel];
    [view addSubview:backView];
    return view;
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
   
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor whiteColor];
    
    UIView *backView = [UIView new];
    backView.frame = FRAMEMAKE_F(0, 0, WIDTH_K, 45);
    backView.backgroundColor = M_BACKGRO;
    [view addSubview:backView];
    
    UILabel *freightLab = [UILabel new];
    LabelSet(freightLab, @"运费", H_SHOPNAME, 14, moreDic, moreSize);
    
    freightLab.frame = FRAMEMAKE_F( 15, (45 - moreSize.height) / 2, moreSize.width, moreSize.height);
    
    UILabel *priceLab = [UILabel new];
    LabelSet(priceLab, @"¥3.00", ME_COLOR_666666, 14, priDic, priSize);
    
    priceLab.frame = FRAMEMAKE_F( WIDTH_K - 15 - priSize.width, (45 - priSize.height) / 2, priSize.width, priSize.height);
    
    [backView addSubview:freightLab];
    [backView addSubview:priceLab];
    [view addSubview:backView];
    
    UILabel *freight = [UILabel new];
    LabelSet(freight, @"(含运费¥3.00)", H_SHOPNAME, 14, freightDic, freightSize);
    
    freight.frame = FRAMEMAKE_F(WIDTH_K - 15 - freightSize.width, CGRectGetMaxY(backView.frame)+(45 - freightSize.height) / 2, freightSize.width, freightSize.height);
    
    
    
    UILabel *priceLabel = [UILabel new];
    priceLabel.textColor = S_OPRICE;
//    NSString *stringPri = [NSString stringWithFormat:@"¥%.2f",vmodel.totalprice] ;
//    NSString *strPri = [NSString stringWithFormat:@"实付: %@" , stringPri];
//    NSRange rangePri = [strPri rangeOfString:[NSString stringWithFormat:@"%@" , stringPri]];
//    NSMutableAttributedString *attributePrice = [[NSMutableAttributedString alloc] initWithString:strPri];
//    [attributePrice addAttribute:NSForegroundColorAttributeName value:NAV_BG_COLOR range:rangePri];
    priceLabel.font = [UIFont systemFontOfSize:16];
    priceLabel.text = @"¥30.00";
    //priceLabel.attributedText = attributePrice;
    
    NSDictionary *priceDic = StringFont_DicK(priceLabel.font);
    CGSize priceSize = [priceLabel.text sizeWithAttributes:priceDic];
    
    priceLabel.frame = FRAMEMAKE_F(WIDTH_K - 25 - freightSize.width - priceSize.width , (45 - priceSize.height) / 2+ CGRectGetMaxY(backView.frame), priceSize.width, priceSize.height);
     [self fuwenbenLabel:priceLabel FontNumber:[UIFont systemFontOfSize:12] AndRange:NSMakeRange(0, 1) AndColor:S_OPRICE];
    
    
    UILabel *_shopLabel = [UILabel new];
    _shopLabel.textColor = H_SUBSTRACT;

    _shopLabel.font = [UIFont systemFontOfSize:15];
    _shopLabel.text = @"共1件商品";
    NSDictionary *shopDic = StringFont_DicK(_shopLabel.font);
    CGSize shopSize = [_shopLabel.text sizeWithAttributes:shopDic];
    
    _shopLabel.frame = FRAMEMAKE_F(WIDTH_K - 55 - freightSize.width - priceSize.width - shopSize.width, (45 - shopSize.height) / 2 + CGRectGetMaxY(backView.frame), shopSize.width, shopSize.height);
    [view addSubview:priceLabel];
    [view addSubview:_shopLabel];
    [view addSubview:freight];
    
    UIImageView *line = [UIImageView new];
    line.image = [UIImage imageNamed:@"hang"];
    line.frame = FRAMEMAKE_F(0, 90 - 1, WIDTH_K, 1);
    
    
    
    UIButton *_ascertainBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    UIButton *_cancelBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    
    _ascertainBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_ascertainBtn setTitleColor:NAV_BG_COLOR forState:UIControlStateNormal];
    
    
    [_ascertainBtn setTitle:@"确认收货" forState:UIControlStateNormal];
    
    NSDictionary *ascDic = StringFont_DicK(_ascertainBtn.titleLabel.font);
    CGSize ascSize = [ _ascertainBtn.titleLabel.text sizeWithAttributes:ascDic];
    _ascertainBtn.frame = FRAMEMAKE_F(WIDTH_K - 15 - ascSize.width - 20, CGRectGetMaxY(line.frame) + (50 - (ascSize.height + 20)) / 2 , ascSize.width + 20 , ascSize.height + 20 );
    _ascertainBtn.layer.borderWidth = 1;
    _ascertainBtn.layer.borderColor = NAV_BG_COLOR.CGColor;
    _ascertainBtn.layer.cornerRadius = 5;
    _ascertainBtn.clipsToBounds = YES;
    
    [_ascertainBtn addTarget:self action:@selector(commentClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
     [_cancelBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    _cancelBtn.layer.borderWidth = 1;
    _cancelBtn.layer.borderColor = ME_COLOR_666666.CGColor;
    _cancelBtn.layer.cornerRadius = 5;
    _cancelBtn.clipsToBounds = YES;
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    NSDictionary *canDic = StringFont_DicK(_cancelBtn.titleLabel.font);
    CGSize canSize = [_ascertainBtn.titleLabel.text  sizeWithAttributes:canDic];
    
    _cancelBtn.frame = FRAMEMAKE_F(WIDTH_K - CGRectGetWidth(_ascertainBtn.frame) - 15 - 10 - canSize.width - 20, CGRectGetMaxY(line.frame) + (50 - (canSize.height + 20)) / 2, canSize.width + 20, canSize.height + 20)
    [_cancelBtn setTitleColor:ME_COLOR_666666 forState:UIControlStateNormal];
    
    
    
    UIImageView *line1 = [UIImageView new];
    line1.image = [UIImage imageNamed:@"shu"];
    line1.frame = FRAMEMAKE_F(CGRectGetMaxX(_shopLabel.frame) + 15, CGRectGetMaxY( backView.frame) + 10, 1, 45 - 20);
    [view addSubview:line];
    [view addSubview:line1];
    
    [view addSubview:_ascertainBtn];
    [view addSubview:_cancelBtn];
    
    return view;
    
}

//评价

- (void)commentClick:(UIButton *)button{
    EvaluateVC *evaluateVC = [[EvaluateVC alloc] init];
    [self.navigationController pushViewController:evaluateVC animated:YES];
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

//点击进入店铺

- (void)shopClick:(UITapGestureRecognizer *)tap{
    NSLog(@"111111");
}

//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak OrderVC *favSelf = self;
    OrderGoodViewCell *cell = (OrderGoodViewCell *)[favSelf tableView:_orderTable cellForRowAtIndexPath:indexPath];
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
