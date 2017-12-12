//
//  GoodRushDetailVC.m
//  MwyProject
//
//  Created by feiyu iOS on 16/12/24.
//  Copyright © 2016年 Mwy Group. All rights reserved.
//

#import "GoodRushDetailVC.h"
#import "GoodButton.h"
#import "GoodNameViewCell.h"
#import "GoodSelectViewCell.h"
#import "GoodPropertyViewCell.h"
#import "GoodServiceViewCell.h"
#import "GoodCommentViewCell.h"
#import "GoodPreferViewCell.h"
#import "RemarkBtnCell.h"
#import "GoodCommentVC.h"
#import "RushPriceViewCell.h"
#import "RushNameViewCell.h"
#import "RushTimeViewCell.h"
#import "ChoseView.h"
static NSString *cellIndentifier = @"serviceCell";
@interface GoodRushDetailVC ()<UITableViewDelegate,UITableViewDataSource, SDCycleScrollViewDelegate, selectIndexPathDelegate>
{
    ChoseView *choseView;
    NSArray *sizearr;//型号数组
    NSArray *colorarr;//分类数组
    NSDictionary *stockdic;//商品库存量
    CGPoint center;

}

@end

@implementation GoodRushDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.myTableView];
    
    sizearr = [[NSArray alloc] initWithObjects:@"S",@"M",@"L",nil];
    colorarr = [[NSArray alloc] initWithObjects:@"蓝色咖啡色湖蓝色",@"红色湖蓝色湖蓝色湖蓝色",@"湖蓝色湖蓝色湖蓝色湖蓝色湖蓝色",@"咖啡色",@"蓝色",@"红色",@"湖蓝色",@"咖啡色",@"蓝色",@"红色",@"湖蓝色",@"蓝色咖啡色湖蓝色",@"红色湖蓝色湖蓝色湖蓝色",@"湖蓝色湖蓝色湖蓝色湖蓝色湖蓝色",@"咖啡色",@"蓝色",@"红色",@"湖蓝色",@"咖啡色",@"蓝色",@"红色",@"湖蓝色",nil];
    NSString *str = [[NSBundle mainBundle] pathForResource: @"stock" ofType:@"plist"];
    stockdic = [[NSDictionary alloc] initWithContentsOfURL:[NSURL fileURLWithPath:str]];
    
    
    [self initChoseView];
    
    [self setUpKeyboardTopView];
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64 - 50) style:UITableViewStyleGrouped];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

- (void)setUpKeyboardTopView{
    
    UIView *keyBoardTopView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT_K, WIDTH_K, 40)];
    _keyBoardTopView = keyBoardTopView;
    keyBoardTopView.backgroundColor = S_BACKGROUND;// S_BACKGROUND
    [self.view addSubview:keyBoardTopView];
    
    UIButton *alredyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    alredyBtn.frame = CGRectMake(WIDTH_K - 51, 6, 45, 28);
    [alredyBtn setTitle:@"完成" forState:UIControlStateNormal];
    [alredyBtn setTitleColor:S_OPRICE forState:UIControlStateNormal];
    alredyBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    alredyBtn.layer.cornerRadius = 4;
    alredyBtn.layer.borderColor = S_OPRICE.CGColor;
    alredyBtn.layer.borderWidth = 1;
    [alredyBtn addTarget:self action:@selector(hiddenKeyboard) forControlEvents:UIControlEventTouchUpInside];
    [keyBoardTopView addSubview:alredyBtn];
    
}
//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    
    _keyBoardTopView.y = HEIGHT_K - height - 40;
    
    
    
}
//当键盘隐藏时调用
- (void)keyboardWillHidden:(NSNotification *)aNotification
{
    //获取键盘的高度
    
    _keyBoardTopView.y = HEIGHT_K;
    [UIView animateWithDuration:0.3f animations:^{
        //_tableView.contentOffset = CGPointMake(0, _tableView.contentOffset.y - _keyboardHeight);
    }];
    
    
}
/**
 *  隐藏键盘
 */
- (void)hiddenKeyboard{
    [self.view endEditing:YES];
    
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
    }else if (button.tag == 1) {
        NSLog(@"2222");
    }else{
        CGPoint point = CGPointMake(button.center.x + 50, _bottomView.frame.origin.y + 50);
        XTPopView *view1 = [[XTPopView alloc] initWithOrigin:point Width:130 Height:40 * 2 Type:XTTypeOfRightDown Color:[UIColor whiteColor]];
        view1.dataArray = @[@"联系商家",@"联系客服"];
        //view1.images = @[@"h_shouye",@"h_sxiaoxi", @"h_shoucang"];
        view1.fontSize = 14;
        view1.row_height = 40;
        view1.titleTextColor = ME_COLOR_666666;
        view1.delegate = self;
        [view1 popView];
        
    }
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
      
        default:
            break;
    }
}

//加入购物车
-(void)cartBtnClick:(UIButton *)sender{
//    center = self.myTableView.center;
//    center.y -= 64;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        
//        self.myTableView.center = center;
//        self.myTableView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
        
        choseView.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    } completion: nil];
}
//立即购买
-(void)buyBtnClick:(UIButton *)sender{
    
    NSLog(@"2222");
    
    

}


- (void)initChoseView{
    //选择尺码颜色的视图
    choseView = [[ChoseView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:choseView];
    [choseView.bt_cancle addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [choseView.bt_sure addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [choseView initTypeView:sizearr :colorarr :stockdic];
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [choseView.alphaiView addGestureRecognizer:tap];
    
}

-(void)dismiss
{
//    center.y += 64;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        choseView.frame =CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height);
//        self.myTableView.center = center;
//        self.myTableView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        //goodsDetail.bt_addSize.headLabel.text = choseView.lb_detail.text;
    } completion: nil];
    
}
-(void)sure
{
    [self dismiss];
    NSLog(@"33333");
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else if (section == 2) {
        return 3;
    }else if (section == 3){
        return 1;
    }else if (section == 5){
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self nameCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
        
    }else if (indexPath.section == 1){
        return [self selectCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else if (indexPath.section == 2){
        return [self propertyCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else if (indexPath.section == 3){
        return [self preCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else if (indexPath.section == 4){
        return [self serviceCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else {
        return [self commentCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }
    
    
}


- (UITableViewCell *)nameCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return [self priceCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else if (indexPath.row == 1){
        return [self detailCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }else{
         return [self timeCellEithTableView:tableView cellForRowAtIndexPath:indexPath ];
    }
   
    
}

//价格
- (UITableViewCell *)priceCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    RushPriceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[RushPriceViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    [cell setName:@"距离结束还有:" price:@"¥3000.00" disPrice:@"¥4000.00" time:3800];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//商品名字
- (UITableViewCell *)detailCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    RushNameViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[RushNameViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    [cell setName:@"春节特价大礼包,春节特价大礼包" sale:@"月销售1200笔" express:@"快递:¥5" place:@"杭州"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//限时抢购
- (UITableViewCell *)timeCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    RushTimeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[RushTimeViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    [cell setNameDiscount:@"3折封顶" limit:@"限时疯抢" time:@"72小时" fast:@"闪电发货"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


//商品选择
- (UITableViewCell *)selectCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    GoodSelectViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[GoodSelectViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell userNameString:@"已选择 手机春节特价大礼包"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//商品属性
- (UITableViewCell *)propertyCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    GoodPropertyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[GoodPropertyViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setType:@"产品类型" nameLab:@"礼包"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//商品优惠
- (UITableViewCell *)preCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    GoodPreferViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[GoodPreferViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    
    [cell setShop:@"优惠信息" substract:@"满100送20" discount:@"全场5折"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}
//买家服务
- (UITableViewCell *)serviceCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    //static NSString *cellIndentifier = @"serviceCell";
    GoodServiceViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[GoodServiceViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier nameArr:@[@"48小时发货", @"15天包换"]];
    }else{
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    //[cell setShop:@"买家服务" nameArr:@[@"48小时发货", @"15天包换"]];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//评价
- (UITableViewCell *)commentCellEithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        
        NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
        GoodCommentViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (!cell) {
            cell = [[GoodCommentViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        cell.nameImg.image = [UIImage imageNamed:@"g_touxiang"];
        [cell setName:@"马克" content:@"非常满意,非常好非常满意,非常好非常满意,非常好非常满意,非常好" time:@"2016-12-23 11:52:50"];
        cell.line.hidden = YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        return [self selendtableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
}

-(UITableViewCell *)selendtableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId =[NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    RemarkBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"RemarkBtnCell" owner:self options:nil]objectAtIndex:0];
    }
    cell.commentLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentClick:)];
    [cell.commentLabel addGestureRecognizer:tap];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//查看全部评论

- (void)commentClick:(UITapGestureRecognizer *)tap{
    GoodCommentVC *goodVC = [[GoodCommentVC alloc] init];
    [self.navigationController pushViewController:goodVC animated:YES];
}

//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return WIDTH_K - 55;
    }else if (section == 2){
        return 50;
    }else if (section == 5){
        return 45;
    }else{
        return 1;
    }
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 4) {
        return 10;
    }else{
        return 1;
    }
}
//区头
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    __strong UIView *view = [UIView new];
    //view.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KHFullScreenWidth, WIDTH_K - 55) delegate:self placeholderImage:[UIImage imageNamed:@"litongOne"]];
        //cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
        cycleScrollView.autoScroll = NO;
        cycleScrollView.currentPageDotColor = NAV_BG_COLOR;
        cycleScrollView.pageDotColor = [UIColor whiteColor];
        //         --- 模拟加载延迟
        
        //cycleScrollView.imageURLStringsGroup = mainArray;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cycleScrollView.imageURLStringsGroup = @[@"ceshiOne", @"ceshiTwo", @"ceshiThree"];
        });
        UIImageView *buyImg = [UIImageView new];
        buyImg.image = [UIImage imageNamed:@"g_qianggou"];
        buyImg.frame = FRAMEMAKE_F(15, CGRectGetMaxY(cycleScrollView.frame) - buyImg.image.size.height / 2, buyImg.image.size.width, buyImg.image.size.height);
        [cycleScrollView addSubview:buyImg];
        
        
        [view addSubview:cycleScrollView];
    }else if (section == 2){
        view.backgroundColor = [UIColor whiteColor];
        
        UILabel *_titleLabel = [UILabel new];
        LabelSet(_titleLabel, @"产品属性", H_SHOPNAME, 16, titleDic, titleSize);
        _titleLabel.frame = FRAMEMAKE_F(WIDTH_K / 2 - titleSize.width / 2, 20, titleSize.width, titleSize.height);
        
        
        [view addSubview:_titleLabel];
        
        
    }else if (section == 5){
        view.backgroundColor = [UIColor whiteColor];
        UILabel *_commentLabel = [UILabel new];
        LabelSet(_commentLabel, @"买家评价(120)", H_SHOPNAME, 16, commentDic, commentSize);
        _commentLabel.frame = FRAMEMAKE_F(15,  (45 - commentSize.height) / 2, commentSize.width, commentSize.height);
        
        
        //星星
        DYRateView *rateView = [[DYRateView alloc] init];
        rateView.frame = FRAMEMAKE_F(WIDTH_K - 15 - 80, (45 - 20) / 2 + 4, 80, 20);
        rateView.isshow = YES;
        rateView.rate = 3.5;
        rateView.alignment = RateViewAlignmentLeft;
        
        UILabel *_starLabel = [UILabel new];
        LabelSet(_starLabel, @"商品满意度", ME_COLOR_CELLTEXTLABEL, 14, starDic, starSize);
        _starLabel.frame = FRAMEMAKE_F(WIDTH_K - CGRectGetWidth(rateView.frame) - 25 - starSize.width,  (45 - starSize.height) / 2, starSize.width, starSize.height);
        UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0,  45- 1, WIDTH_K, 1)];
        line.image = [UIImage imageNamed:@"hang"];
        [view addSubview:line];
        
        
        [view addSubview:_commentLabel];
        [view addSubview:rateView];
        [view addSubview:_starLabel];
        
        
    }
    return view;
}
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    __strong UIView *view = [[UIView alloc]init];
    view.backgroundColor = S_BACKGROUND;
    return view;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        RushPriceViewCell *cell = (RushPriceViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
        
    }else if (indexPath.section == 1){
        GoodSelectViewCell *cell = (GoodSelectViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else if (indexPath.section == 2){
        GoodPropertyViewCell *cell = (GoodPropertyViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else if (indexPath.section == 3){
        GoodPreferViewCell *cell = (GoodPreferViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else if (indexPath.section == 4){
        GoodServiceViewCell *cell = (GoodServiceViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else{
        GoodCommentViewCell *cell = (GoodCommentViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }
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
