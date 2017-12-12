//
//  HttpUtil.m
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//

/**
 *  是否开启https SSL 验证
 *
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL NO
/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */
#define certificate @"adn"
#import <sys/utsname.h>
#import "HttpUtil.h"

#import "CMDBuilder.h"

#import "NetworkUtil.h"
#import "AppDelegate.h"

@implementation HttpUtil


+ (AFSecurityPolicy*)customSecurityPolicy
{
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    NSLog(@"------证书%@", certData);
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
     NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
    securityPolicy.pinnedCertificates = set;
    
    return securityPolicy;
}


// post 数据 block带error信息
+(void)PostCMDJson:(NSString *)cmd args:(NSMutableDictionary *)args callback:(void(^)(id))callback error:(void (^)(NSError*)) myerror
{
    NSMutableDictionary* url_postdata = [CMDBuilder GetCMDUrlByPost:cmd args:args];
    NSString *url = [url_postdata objectForKey:@"url"];
    NSDictionary *postdata = [url_postdata objectForKey:@"postdata"];
    //STHTTPRequest* rst = [STHTTPRequest requestWithURLString:url];
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    // 设置超时时间
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval = 30;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    // 加上这行代码，https ssl 验证。
    if(openHttpsSSL)
    {
        [manage setSecurityPolicy:[self customSecurityPolicy]];
    }
    
    [manage POST:url parameters:postdata progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         callback(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        myerror(error);
        if([NetworkUtil isConnected]){
            NSString *msg = @"未能连接到服务器 \r\n稍后再试试!";
            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            [app.window showHintView:msg];
        }else{
            NSString *msg = @"请检查你的网络!";
            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            [app.window showHintView:msg];
        }

    }];
}

//无参数
    
+(void)PostCMDJson:(NSString *)cmd  callback:(void(^)(id))callback error:(void (^)(NSError*)) myerror{
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    manage.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    
    // 设置超时时间
    [manage.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manage.requestSerializer.timeoutInterval = 30;
    [manage.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@",URL_API_DOMAIN,cmd];
    [manage POST:stringUrl parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        callback(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        myerror(error);
        if([NetworkUtil isConnected]){
            NSString *msg = @"未能连接到服务器 \r\n稍后再试试!";
            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            [app.window showHintView:msg];
        }else{
            NSString *msg = @"请检查你的网络!";
            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            [app.window showHintView:msg];
        }
        
    }];


}


// post（上传带有文件、图片的数据） 单图
+(void)PostCMDJsonWithAImage:(NSString *)cmd args:(NSMutableDictionary *)args filePath:(NSString *)filePath fileParameterName:(NSString *)fileParameterName callback:(void (^)(id)) callback error:(void (^)(NSError*)) myerror
{
    NSMutableDictionary* url_postdata = [CMDBuilder GetCMDUrlByPost:cmd args:args];
    NSDictionary *postdata = [url_postdata objectForKey:@"postdata"];
    NSString *url = [url_postdata objectForKey:@"url"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:postdata constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 上传文件
        NSString *path=filePath;
        NSData *fileData = [NSData dataWithContentsOfFile:path]; // 文件数据
        NSString *fileName = [path lastPathComponent]; // 文件名
        NSString *mineType = @"image/jpeg"; // mineType 或者 contentType
        
        [formData appendPartWithFileData:fileData name:fileParameterName fileName:fileName mimeType:mineType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary* result = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        callback(result);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        myerror(error);
        if([NetworkUtil isConnected]){
            NSString *msg = @"未能连接到服务器 \r\n稍后再试试!";
            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            [app.window showHintView:msg];
        }else{
            NSString *msg = @"请检查你的网络!";
            AppDelegate *app=(AppDelegate *)[UIApplication sharedApplication].delegate;
            [app.window showHintView:msg];
        }

    }];




}
@end
