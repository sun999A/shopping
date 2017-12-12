//
//  CshopController.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/3.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "CshopController.h"
#import "RecommendViewCell.h"
@interface CshopController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CshopController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.myTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 104) style:UITableViewStylePlain];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _myTableView;
}

#pragma mark - UITableView DataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId =[NSString stringWithFormat:@"cellTwo%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    RecommendViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[RecommendViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.photoImage.image = [UIImage imageNamed:@"ceshiTwo"];
    [cell setShopName:@"江城理发店" substract:@"满100送20,满200送50" discount:@"全场5折" distance:@"500m" starNum:@"5.0" star:3.5];
    [cell.phoneButton addTarget:self action:@selector(phoneClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.phoneButton.tag = indexPath.row;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

//打电话

- (void)phoneClick:(UIButton *)button{
    NSLog(@"---------打电话");
}


//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendViewCell *cell = (RecommendViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
    return  cell.frame.size.height;
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
