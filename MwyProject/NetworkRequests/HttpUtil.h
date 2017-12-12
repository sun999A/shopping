//
//  HttpUtil.h
//  app_demo
//
//  Created by 谢月甲 on 14-8-18.
//  Copyright (c) 2014年 noear. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpUtil : NSObject

// post 数据 block带error信息
+(void)PostCMDJson:(NSString *)cmd args:(NSMutableDictionary *)args callback:(void(^)(id))callback error:(void (^)(NSError*)) myerror;

// post（上传带有文件、图片的数据） 单图
+(void)PostCMDJsonWithAImage:(NSString *)cmd args:(NSMutableDictionary *)args filePath:(NSString *)filePath fileParameterName:(NSString *)fileParameterName callback:(void (^)(id)) callback error:(void (^)(NSError*)) myerror;


//无参数
+(void)PostCMDJson:(NSString *)cmd  callback:(void(^)(id))callback error:(void (^)(NSError*)) myerror;
@end
