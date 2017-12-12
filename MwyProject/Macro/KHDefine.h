//
//  KHDefine.h
//  Collector
//
//  Created by 赵少松 on 14-8-23.
//  Copyright (c) 2014年 kunhong. All rights reserved.
//
//#define DEV // 开发环境
//#define TEST // 测试部测试环境
#define RELEASE // 上架生产环境


#ifdef DEV
#define URL_API_DOMAIN @"http://172.16.0.98:8080/zhefei-app-web" //
#endif


// 测试部测试环境
#ifdef TEST
#define URL_API_DOMAIN @"http://15y2926z54.imwork.net/zhefei-app-web"
#endif

// 上架生产环境

#ifdef RELEASE
#define URL_API_DOMAIN @"http://www.srltsy.com/litong"
#endif

//左、右 边视图X坐标  NAV
#define LABLEIMAGE_K 10

//View X坐标
#define ViewFromX_Y 10
//FROM
#define FRAMEMAKE_F(_X_,_Y_,_WIDTH_,_HEIGHT_) CGRectMake(_X_,_Y_, _WIDTH_, _HEIGHT_);

//获取当前设备的宽、高
#define WIDTH_K [[UIScreen mainScreen] bounds].size.width
#define HEIGHT_K [[UIScreen mainScreen] bounds].size.height


#define SCREEN_WIDTH_SCALE SCREEN_WIDTH / 375.0
#define SCREEN_HEIGHT_SCALE SCREEN_HEIGHT / 667.0

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)


//字典font
#define StringFont_DicK(_Font_) [[NSDictionary alloc]initWithObjectsAndKeys:(_Font_),NSFontAttributeName, nil];

//label 设置
#define LabelSet(_NAME_,_TEXT_,_TEXTCOLOR_,_FONT_,_DIC_,_SIZE_)\
(_NAME_).text = (_TEXT_);\
(_NAME_).textColor = (_TEXTCOLOR_);\
(_NAME_).font = [UIFont systemFontOfSize:(_FONT_)];\
NSDictionary *(_DIC_) = StringFont_DicK((_NAME_).font);\
CGSize (_SIZE_) = [(_NAME_).text sizeWithAttributes:(_DIC_)];

//CellLabel初始化
#define CellLabelAlloc_K(_Name_) (_Name_) = [[UILabel alloc]init];\
[self addSubview:(_Name_)];
//CellImg
#define CellImage_K(_Img_) (_Img_) = [[UIImageView alloc]init];\
[self addSubview:(_Img_)];

//RGB
#define NAVCOLOR_C(_RED_,_GREEN_,_BLUE_) [UIColor colorWithRed:(_RED_)/255.0 green:(_GREEN_)/255.0 blue:(_BLUE_)/255.0 alpha:1]
#define COLORPCT_K(_RED_,_GREEN_,_BLUE_,_ALPHA_) [UIColor colorWithRed:(_RED_)/255.0 green:(_GREEN_)/255.0 blue:(_BLUE_)/255.0 alpha:(_ALPHA_)]

#pragma mark - 屏幕尺寸
#define KHFullScreenWidth       [UIScreen mainScreen].bounds.size.width
#define KHFullScreenHeight      [UIScreen mainScreen].bounds.size.height

//导航条高度
#define KHNavBarHeight          44
//状态栏高度
#define KHStatusBarHeight       [[UIApplication sharedApplication] statusBarFrame].size.height
//底部导航高度
#define KHTabbarHeight          50


#pragma mark - 颜色转换
//十进制颜色转换	
#define RGBCOLOR(r,g,b)         [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
//十六进制颜色转换（0xFFFFFF）
#define HEXRGBCOLOR(hex)        [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]


#pragma mark - 适配
#define  SYSTEM_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]


//公共颜色
#define NAV_BG_COLOR HEXRGBCOLOR(0Xce3d3a)    //主题颜色

#define CIRCLE_COLOR HEXRGBCOLOR(0Xcccccc)
#define SBACK_COLOR HEXRGBCOLOR(0Xffffff)
#define SLABEL_ONE HEXRGBCOLOR(0X333333)
#define ME_COLOR_666666 HEXRGBCOLOR(0X666666)
#define ME_COLOR_CELLTEXTLABEL HEXRGBCOLOR(0X999999)


//#define LOGIN_TITLE_COLOR HEXRGBCOLOR(0X69b532) //注册登录 个人信息填写字体颜色



//首页
#define H_SHOPNAME HEXRGBCOLOR(0X4c4c4c)
#define H_SUBSTRACT HEXRGBCOLOR(0X808080)
#define H_DOT HEXRGBCOLOR(0XD94222)
#define H_DOTONE HEXRGBCOLOR(0XDadada)
#define H_SCORE HEXRGBCOLOR(0Xea8100)
#define H_NEWPRO HEXRGBCOLOR(0X27CC7C)
#define H_EXPLO HEXRGBCOLOR(0XDD6C1D)
#define H_SEARCHS HEXRGBCOLOR(0Xb93734)
#define H_SEARCHTIT HEXRGBCOLOR(0Xcf8d87)
#define H_GOODSEARCH HEXRGBCOLOR(0XB2B2B2)
#define H_GOODSEA HEXRGBCOLOR(0Xce3d3a)
#define H_MAP HEXRGBCOLOR(0Xce3d3a)
#define H_TOP HEXRGBCOLOR(0X8a241e)
#define H_CART HEXRGBCOLOR(0Xffaa00)
#define H_TIME HEXRGBCOLOR(0Xfff000)
#define H_FAST HEXRGBCOLOR(0XFFF1EE)



//#define H_NAME HEXRGBCOLOR(0X4d4d4d)
//#define H_LOGIN HEXRGBCOLOR(0XFF2C4C)
//#define H_OTHER HEXRGBCOLOR(0Xb0b0b0)
//#define H_COUPON HEXRGBCOLOR(0Xff9e24)
//#define H_METER HEXRGBCOLOR(0Xe47753)
//#define H_REDUCE HEXRGBCOLOR(0Xff8a00)




//购物车
#define S_COUNT HEXRGBCOLOR(0XCE3D39)
#define S_OPRICE HEXRGBCOLOR(0Xff5500)
#define S_BACKGROUND HEXRGBCOLOR(0XF0F0F0)



//#define G_TITLE HEXRGBCOLOR(0XFF2C4C)

//#define G_ANSWER HEXRGBCOLOR(0X8a8a8a)
//#define G_JOIN HEXRGBCOLOR(0XFF2D4D)
//#define G_CONTACT HEXRGBCOLOR(0XFF8C05)
//#define F_CONTENTS HEXRGBCOLOR(0X646464)
//#define F_TITLE HEXRGBCOLOR(0X4d4d4d)
//#define F_NET HEXRGBCOLOR(0Xe6e6e6)


//我的


#define M_BORDER HEXRGBCOLOR(0Xf5f5f5)
#define M_BACKGRO HEXRGBCOLOR(0XF7F7F7)
#define M_NUMBER HEXRGBCOLOR(0XDA4242)
#define M_PRICE HEXRGBCOLOR(0Xeb6100)
#define M_TIME HEXRGBCOLOR(0Xb2b2b2)


//#define M_AGREEMENT HEXRGBCOLOR(0Xe51717)


//字号
#define TITLEFONT_18 [UIFont systemFontOfSize:18] 
#define TITLEFONT_16 [UIFont systemFontOfSize:16]
#define TITLEFONT_14 [UIFont systemFontOfSize:14]
#define TITLEFONT_12 [UIFont systemFontOfSize:12]
#define TITLEFONT_10 [UIFont systemFontOfSize:10]



// 通知：帐号登录
#define KH_NOTIFICATION_LOGIN @"NBlogin"
// 通知：帐号注销
#define KH_NOTIFICATION_LOGOUT @"NBlogout"









