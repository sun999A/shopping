//
//  AddAdressVC.m
//  LifeServices
//
//  Created by Snail iOS on 16/4/18.
//  Copyright © 2016年 Snail iOS. All rights reserved.
//


#import "AddAdressVC.h"
#import "AddressView.h"
#import "AreaPickerView.h"
#import "BRAreaCell.h"
@interface AddAdressVC ()<UITableViewDelegate, UITableViewDataSource, AreaPickerDelegate,UITextFieldDelegate>

@end

@implementation AddAdressVC
{
    UITableView *_addTable;
    __strong NSArray     *labelArray;
    __strong NSArray     *textFileArray;
    NSString *areaString;
    AreaPickerView *areaPicker;
    NSInteger i;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNAVTitle:@"添加收货地址"];
    [self selfView];
    i = 0;
//    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"dizhi_dui"] style:UIBarButtonItemStylePlain target:self action:@selector(addAddress:)];
//    self.navigationItem.rightBarButtonItem.tintColor = FOOD_COLOR;
    
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(addAddress:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *gest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tableViewGest)];
    gest.numberOfTapsRequired = 1;
    [_addTable addGestureRecognizer:gest];
    // Do any additional setup after loading the view.
}


-(void)tableViewGest{
    [_addTable endEditing:YES];
}
- (void)selfView{
    _addTable = [[UITableView alloc]initWithFrame:CGRectMake(0,0,WIDTH_K, HEIGHT_K) style:UITableViewStyleGrouped];
    _addTable.delegate = self;
    _addTable.dataSource = self;
    _addTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_addTable];
    labelArray = @[@"收货人",@"手机号码"];
    textFileArray = @[@"请输入真实姓名",@"请输入联系方式"];
}

- (void)addAddress:(UIBarButtonItem *)button{
//    AddressView *name = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
//    AddressView *phone = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
//    BRAreaCell *area = (BRAreaCell *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:2 inSection:0]];
//    AddressView *address = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
//    
//    if ([NSString isNullOrEmpty:name.describe.text]) {
//        [self.view showHintView:@"请输入收货人名字！"];
//        return;
//    }
//    
//    if ([NSString isNullOrEmpty:phone.describe.text]) {
//        [self.view showHintView:@"请输入手机号码！"];
//        return;
//    }
//    if(![RegexUtil validateMobile:phone.describe.text]){
//        [self.view showHintView:@"手机号码不正确！"];
//        return;
//    }
//    if ([NSString isNullOrEmpty:area.date.text]) {
//        [self.view showHintView:@"请选择地区！"];
//        return;
//    }
//    if ([NSString isNullOrEmpty:address.describe.text]) {
//        [self.view showHintView:@"请输入详细地址！"];
//        return;
//    }
//    [self showHudInView:self.view hint:nil];
//    [HomeHttp shippingName:name.describe.text shippingPhone:phone.describe.text addressField:area.date.text userAddress:address.describe.text Callback:^(ShopModel *vmodel) {
//        [self hideHud];
//        if ([vmodel.succ integerValue] == 1) {
//            //[self.view showHintView:vmodel.msg];
//            [self.navigationController popViewControllerAnimated:YES];
//        }else{
//            [self.view showHintView:vmodel.msg];
//        }
//    } error:^(NSError *error) {
//        [self hideHud];
//    }];
    

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 2) {
        return 2;
    }else{
        return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


#pragma ------------------Cell------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self nameTableView:tableView cellForRowAtIndexPath:indexPath];
    }else if (indexPath.section == 1){
        return [self postcodeTableView:tableView cellForRowAtIndexPath:indexPath];
    }else if (indexPath.section == 2){
        return [self areaTableView:tableView cellForRowAtIndexPath:indexPath];
       
    }else{
        return [self defaultAddressTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
}

//收货人 手机号
- (UITableViewCell *)nameTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AddressView *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[AddressView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setName:[NSString stringWithFormat:@"%@",[labelArray objectAtIndex:indexPath.row]] Describe:[NSString stringWithFormat:@"%@",[textFileArray objectAtIndex:indexPath.row]]];
    cell.locateBtn.hidden = YES;
    if (indexPath.row == 1) {
        cell.describe.keyboardType =UIKeyboardTypeNumberPad;
        [cell.describe addTarget:self action:@selector(textFieldDidEditing:) forControlEvents:UIControlEventEditingChanged];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)textFieldDidEditing:(UITextField *)textField{
     AddressView *phone = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    if (textField == phone.describe) {
        if (textField.text.length > i) {
            if (textField.text.length == 4 || textField.text.length == 9 ) {//输入
                NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
                [str insertString:@" " atIndex:(textField.text.length-1)];
                textField.text = str;
            }if (textField.text.length >= 13 ) {//输入完成
                textField.text = [textField.text substringToIndex:13];
                [textField resignFirstResponder];
            }
            i = textField.text.length;
            
        }else if (textField.text.length < i){//删除
            if (textField.text.length == 4 || textField.text.length == 9) {
                textField.text = [NSString stringWithFormat:@"%@",textField.text];
                textField.text = [textField.text substringToIndex:(textField.text.length-1)];
            }
            i = textField.text.length;
        }
    }
}
//邮编

- (UITableViewCell *)postcodeTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AddressView *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[AddressView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setName:@"邮政编码" Describe:@"请输入邮政编码"];
    cell.describe.keyboardType =UIKeyboardTypeNumberPad;
   
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//详细地址
- (UITableViewCell *)areaTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AddressView *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[AddressView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setName:@[@"所在地区",@"详细地址"][indexPath.row] Describe:@[@"请选择所在地区",@"请输入详细地址"][indexPath.row]];
    if (indexPath.row == 0) {
        cell.describe.delegate = self;
        if (![NSString isNullOrEmpty:areaString]){
            cell.describe.text = areaString;
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [textField resignFirstResponder];
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    AddressView *name = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [name.describe resignFirstResponder];
    AddressView *phone = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    [phone.describe resignFirstResponder];
    AddressView *postcode = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    [postcode.describe resignFirstResponder];
    AddressView *detailAddress = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:2]];
    [detailAddress.describe resignFirstResponder];
    areaPicker = [[AreaPickerView alloc] initWithDelegate:self title:@"城市选择器"];
    [areaPicker pickerViewSelectRow:0 inComponent:0];
    [areaPicker showInView:self.view];
    
    return YES;
}
- (void)pickerViewSelectAreaOfCode:(NSNumber *)code{
    NSLog(@"------%@ %@ %@", areaPicker.locate.province, areaPicker.locate.city, areaPicker.locate.area);
    areaString = [NSString stringWithFormat:@"%@ %@ %@", areaPicker.locate.province,areaPicker.locate.city,areaPicker.locate.area];
//     AddressView *area = (AddressView *)[_addTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
//    area.describe.text = areaString;

    NSIndexPath *index=[NSIndexPath indexPathForRow:0 inSection:2];//刷新
   
    [_addTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationNone];
    
}
//默认地址
- (UITableViewCell *)defaultAddressTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cellOne%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    BRAreaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[BRAreaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setLabel:@"选择默认地址" date:@""];
    [cell.seled addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)selectBtn:(UIButton *)button{
    button.selected = !button.selected;
    
}
//设置区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 10;
    }
    return 0.0001;
}
//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1 || section == 2) {
        return 10;
    }
    return 0.0001;
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak AddAdressVC *videoSelf = self;
    AddressView *cell = (AddressView *)[videoSelf tableView:_addTable cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
