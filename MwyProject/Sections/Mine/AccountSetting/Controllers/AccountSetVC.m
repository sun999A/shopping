//
//  AccountSetVC.m
//  MwyProject
//
//  Created by feiyu iOS on 17/1/7.
//  Copyright © 2017年 Mwy Group. All rights reserved.
//

#import "AccountSetVC.h"
#import "AheadViewCell.h"
#import "AnameViewCell.h"
#import "AshipViewCell.h"
#import "QuitViewCell.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
@interface AccountSetVC ()<UITableViewDataSource, UITableViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIImage *headImg;

}
@end

@implementation AccountSetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.hidesBottomBarWhenPushed = YES;
    [self setNAVTitle:@"账号设置"];
    [self.view addSubview:self.myTableView];

    // Do any additional setup after loading the view.
}




- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KHFullScreenWidth, KHFullScreenHeight - 64) style:UITableViewStyleGrouped];
        _myTableView.dataSource = self;
        _myTableView.delegate = self;
        _myTableView.backgroundColor = S_BACKGROUND;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _myTableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
//设置每个区的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 3) {
        return 1;
    }else{
        return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self headTableView:tableView cellForRowAtIndexPath:indexPath];
    }else if(indexPath.section == 1){
        return [self nameTableView:tableView cellForRowAtIndexPath:indexPath];
    }else if(indexPath.section == 2){
        return [self shipTableView:tableView cellForRowAtIndexPath:indexPath];
    }else{
        return [self quitTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
}

//头像
- (UITableViewCell *)headTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AheadViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[AheadViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.headView setImage:[UIImage imageNamed:@"ziliao_touxiang70"]];
//    cell.headView.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headClick:)];
//    [cell.headView addGestureRecognizer:tap];
    
    [cell userNameImages:@"头像"];
    
    return cell;
}

- (void)headClick:(UITapGestureRecognizer *)tap{
    NSLog(@"1111");
    
}


//姓名
- (UITableViewCell *)nameTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AnameViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[AnameViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    if (indexPath.row == 0) {
        [cell userName:@"姓名" phone:@"孙大大"];
    }else{
        [cell userName:@"联系方式" phone:@"15617685591"];
    }
    
    return cell;
}

//收货地址
- (UITableViewCell *)shipTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cell%ld,%ld",(long)[indexPath section],(long)[indexPath row]];
    AshipViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell =[[AshipViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        [cell userName:@"收货地址"];
    }else{
         [cell userName:@"我的收藏"];
    }
   
    
    return cell;
}

//退出登录

-(UITableViewCell *)quitTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = [NSString stringWithFormat:@"cellOne%ld%ld",(long)[indexPath section],(long)[indexPath row]];
    QuitViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[QuitViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setImage:[UIImage imageNamed:@""] btnName:@"退出登录"];
    cell.setpBtn.backgroundColor = NAV_BG_COLOR;
   
    [cell.setpBtn addTarget:self action:@selector(quitClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


//退出登录

- (void)quitClick:(UIButton *)button{
    NSLog(@"1111");
}
//设置区头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        return 60;
    }else{
        return 10;
        
    }
   
}

//设置区尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
    
}
//cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        AheadViewCell *cell = (AheadViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else if (indexPath.section == 1 || indexPath.section == 2){
        AshipViewCell *cell = (AshipViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }else{
        QuitViewCell *cell = (QuitViewCell *)[self tableView:_myTableView cellForRowAtIndexPath:indexPath];
        return  cell.frame.size.height;
    }
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改头像" message:nil preferredStyle:(UIAlertControllerStyleActionSheet)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"选择本机图片" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
            
            
            //ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
            PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
            if (status == kCLAuthorizationStatusRestricted || status ==kCLAuthorizationStatusDenied)
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"请打开设置-隐私-照片\n允许“拟管家”访问照片" preferredStyle:  UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    if ([[UIApplication sharedApplication] canOpenURL:url]) {
                        if (SYSTEM_VERSION >= 10) {
                            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
                        }else{
                            [[UIApplication sharedApplication]openURL:url];
                            
                        }
                        
                    }
                    
                    
                }]];
                [self presentViewController:alert animated:true completion:nil];
                //无权限
            }else{
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
                {
                    //创建一个相机的对象
                    UIImagePickerController *imagePC=[[UIImagePickerController alloc]init];
                    imagePC.delegate=self;
                    //指明用相机干什么？
                    imagePC.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                    imagePC.allowsEditing=YES;
                    //这个数组里面存放的有多少种类型，那么打开的相册里面就能看多什么类型的文件，例如：kUTTypeImage图片，kUTTypeMovie视频，kUTTypeMP3。mp3类型
                    //             NSArray *array=[NSArray arrayWithObjects:(NSString *)kUTTypeImage,(NSString *)kUTTypeMovie ,nil];
                    NSArray *array=[NSArray arrayWithObjects:(NSString *)kUTTypeImage ,nil];
                    
                    //打开的多媒体类型
                    imagePC.mediaTypes=array;
                    
                    imagePC.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                    [self presentViewController:imagePC animated:YES completion:^{
                        imagePC.navigationBar.barTintColor=NAV_BG_COLOR;
                        NSLog(@"进入相册页面");
                    }];
                }
                
            }
            
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
            
            AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
            if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
            {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"请打开设置-隐私-相机\n允许“拟管家”访问相机" preferredStyle:  UIAlertControllerStyleAlert];
                [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [alert addAction:[UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    if ([[UIApplication sharedApplication] canOpenURL:url]) {
                        if (SYSTEM_VERSION >= 10) {
                            [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:nil];
                        }else{
                            [[UIApplication sharedApplication]openURL:url];
                            
                        }
                    }
                    
                    
                }]];
                [self presentViewController:alert animated:true completion:nil];
                
                //无权限
            }else{
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                {
                    //初始化照相机对象
                    UIImagePickerController *imagePC=[[UIImagePickerController alloc] init];
                    
                    
                    //设置代理
                    imagePC.delegate=self;
                    //允许编辑
                    imagePC.allowsEditing=YES;
                    //指定使用照相机功能
                    imagePC.sourceType=UIImagePickerControllerSourceTypeCamera;
                    //设置为前置摄像头，必须在上面一句代码的后面
                    imagePC.cameraDevice=UIImagePickerControllerCameraDeviceRear;
                    [self presentViewController:imagePC animated:YES completion:^{
                        
                        imagePC.navigationBar.barTintColor=NAV_BG_COLOR;
                        NSLog(@"进入拍照页面");
                    }];
                }
                
            }
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        }];
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [alertController addAction:cancel];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //获得拍摄的原始照片
    UIImage *image=[info valueForKey:UIImagePickerControllerOriginalImage];
    //如果是刚拍摄的照片就添加到相册中去
    if (picker.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        //将照片保存到相册
        UIImageWriteToSavedPhotosAlbum(image, nil, nil,nil);
    }
    
    //如果照片经过编辑之后，可以通过该方法获得
    UIImage *saveImage=[info valueForKey:UIImagePickerControllerEditedImage];
    headImg = saveImage;
    NSData *imageData= UIImageJPEGRepresentation(saveImage, 0.1);
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"headImage.jpg"];
    //NSLog(@"------图片%@",imageData);
    [imageData writeToFile:fullPath atomically:NO];
    [picker dismissViewControllerAnimated:YES completion:^{
        //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }];
    
    
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"点击了取消按钮！");
    [picker dismissViewControllerAnimated:YES completion:nil];
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
