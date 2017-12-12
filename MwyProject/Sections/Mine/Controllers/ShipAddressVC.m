//
//  ShipAddressVC.m
//  LifeServices
//
//  Created by Snail iOS on 16/4/18.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//

#import "ShipAddressVC.h"
#import "SiteView.h"
#import "AddAdressVC.h"
//#import "ModifyAddressVC.h"
@interface ShipAddressVC ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ShipAddressVC
{
    UITableView *_addressTable;
    int page;
    int limit;
    NSMutableArray  *_addressArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"地址管理"];
    _addressArray = [NSMutableArray array];

    [self selfView];
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"添加地址" style:UIBarButtonItemStylePlain target:self action:@selector(addBtnClick:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];

    //[self loadData];
    
    
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"dizhi_plus"] style:UIBarButtonItemStylePlain target:self action:@selector(addAddress:)];
//    self.navigationItem.rightBarButtonItem.tintColor = FOOD_COLOR;
    
    // Do any additional setup after loading the view.
}


//添加收货地址

- (void)addBtnClick:(UIButton *)buuton{
    AddAdressVC *addVC = [[AddAdressVC alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}


- (void)selfView{
    _addressTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64) style:UITableViewStylePlain];
    _addressTable.dataSource = self;
    _addressTable.delegate = self;
    _addressTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_addressTable];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}


- (void)tap{
    AddAdressVC *addVC = [[AddAdressVC alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
    
}

//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
#pragma ------------------Cell------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    SiteView *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SiteView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
//    AddressViewModel *vmodel = _addressArray[indexPath.row];
    [cell setSiteConsignee:@"晨晨" iPoneNumber:@"18357806117" receiveString:@"杭州市滨江区长河街道江晖路487号兴耀科技园3幢903"];
    
    cell.push.userInteractionEnabled = YES;
    cell.push.tag = indexPath.row;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEdit:)];
    [cell.push addGestureRecognizer:tap];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] init];
//    [longPressGr addTarget:self action:@selector(longPressToDo:)];
//    longPressGr.minimumPressDuration = 1.0;
//    [cell addGestureRecognizer:longPressGr];
    return cell;
}

//编辑

- (void)clickEdit:(UITapGestureRecognizer *)tap{
//    AddressViewModel *vmodel = _addressArray[tap.view.tag];
//    ModifyAddressVC *modifyVC = [[ModifyAddressVC alloc] init];
//    modifyVC.name = vmodel.shippingName;
//    modifyVC.phone = vmodel.shippingPhone;
//    modifyVC.address = vmodel.addressField;
//    modifyVC.user = vmodel.userAddress;
//    modifyVC.addressId = vmodel.addressId;
//    [self.navigationController pushViewController:modifyVC animated:YES];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPat{

    return YES;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  @"删除";
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    AddressViewModel *vmodel = _addressArray[indexPath.row];
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self showHudInView:self.view hint:nil];
//        [HomeHttp deleteAddressId:[NSString stringWithFormat:@"%ld", vmodel.addressId] Callback:^(ShopModel *vmodel) {
//            [self hideHud];
//            if ([vmodel.succ integerValue] == 1) {
//                [_addressArray removeObjectAtIndex:indexPath.row];
//                [_addressTable reloadData];
//            }
//            
//        } error:^(NSError *error) {
//            [self hideHud];
//        }];
//       
//    }
    
}

//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 添加一个删除按钮
//    AddressViewModel *vmodel = _addressArray[indexPath.row];
//    UITableViewRowAction *deleteRowAction = [UITableViewRowAction  rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除"handler:^(UITableViewRowAction*action, NSIndexPath *indexPath) {
//        
//        NSLog(@"点击了删除");
//        [self showHudInView:self.view hint:nil];
//        [ShopHttp deleteAddressId:[NSString stringWithFormat:@"%ld", vmodel.addressId] Callback:^(ShopModel *vmodel) {
//            [self hideHud];
//            if ([vmodel.succ integerValue] == 1) {
//                [_addressArray removeObjectAtIndex:indexPath.row];
//                [_addressTable reloadData];
//            }
//            
//        } error:^(NSError *error) {
//            [self hideHud];
//        }];
//
//        
//        
//        // 1. 更新数据
//        
//        //[_allDataArray removeObjectAtIndex:indexPath.row];
//        
//        // 2. 更新UI
//        
//        //[tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        
//    }];
//    __weak ShipAddressVC *selfBolck = self;
//    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"编辑" handler:^(UITableViewRowAction *action,NSIndexPath *indexPath) {
//        
//        NSLog(@"点击了编辑");
//        AddressViewModel *vmodel = _addressArray[indexPath.row];
//        ModifyAddressVC *modifyVC = [[ModifyAddressVC alloc] init];
//        modifyVC.name = vmodel.shippingName;
//        modifyVC.phone = vmodel.shippingPhone;
//        modifyVC.address = vmodel.addressField;
//        modifyVC.user = vmodel.userAddress;
//        modifyVC.addressId = vmodel.addressId;
//        [selfBolck.navigationController pushViewController:modifyVC animated:YES];
//        
//        
//        //[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
//        
//    }];
//    editRowAction.backgroundColor = M_EDIT;
//    
//    return @[deleteRowAction, editRowAction];
//}


//设置区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.001;
}

//- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//    UIView *view = [UIView new];
//    view.backgroundColor = [UIColor redColor];
//    UILabel *storeLabel = [UILabel new];
//    storeLabel.text = @"添加收货地址";
//    storeLabel.textColor = [UIColor whiteColor];
//    storeLabel.font = TITLEFONT_18;
//    storeLabel.textAlignment = NSTextAlignmentCenter;
//    NSDictionary *storeDic = StringFont_DicK(storeLabel.font);
//    CGSize storeSize = [storeLabel.text sizeWithAttributes:storeDic];
//    storeLabel.frame = FRAMEMAKE_F(WIDTH_K / 2 - storeSize.width / 2, 3, storeSize.width, storeSize.height);
//    [view addSubview:storeLabel];
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
//    [view addGestureRecognizer:tap];
//    return view;
//}



//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak ShipAddressVC *videoSelf = self;
    SiteView *cell = (SiteView *)[videoSelf tableView:_addressTable cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
//点击单元格的时候会触发（点击后返回最初状态）
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([_idCell isEqual:@"反传"]) {
//        self.data([_addressArray objectAtIndex:indexPath.row]);
//        [self.navigationController popViewControllerAnimated:YES];
//    }else{
////        AddressViewModel *vmodel = _addressArray[indexPath.row];
////        ModifyAddressVC *modifyVC = [[ModifyAddressVC alloc] init];
////        modifyVC.name = vmodel.shippingName;
////        modifyVC.phone = vmodel.shippingPhone;
////        modifyVC.address = vmodel.addressField;
////        modifyVC.user = vmodel.userAddress;
////        modifyVC.addressId = vmodel.addressId;
////        [self.navigationController pushViewController:modifyVC animated:YES];
//    }
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
