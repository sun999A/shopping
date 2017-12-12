//
//  MyShopCarTableHeaderView.h
//  ShopCarDemo
//
//  Created by PanChuang on 16/9/20.
//  Copyright © 2016年 PanChuang. All rights reserved.
//
//
//                            _oo0oo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                           O\  =  /O
//                        ____/`---'\____
//                      .'  \\|     |//  `.
//                     /  \\|||  :  |||//  \
//                    /  _||||| -:- |||||-  \
//                    |   | \\\  -  /// |   |
//                    | \_|  ''\---/''  |   |
//                    \  .-\__  `-`  ___/-. /
//                   ___`. .'  /--.--\  `. . __
//                ."" '<  `.___\_<|>_/___.'  >'"".
//              | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//              \  \ `-.   \_ __\ /__ _/   .-` /  /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？
//
//
//

#import <UIKit/UIKit.h>
@class ShopCarDetailModel;

@protocol ShopCarTableViewHeaderViewDelegate <NSObject>
/** 全选或者删除按钮点击事件 */
- (void)selectOrEditGoods:(UIButton *)sender;
/** 进入商店 */
- (void)enterShopStore;

@end

@interface MyShopCarTableHeaderView : UITableViewHeaderFooterView

@property (nonatomic, strong) ShopCarDetailModel *carModel;

@property (nonatomic, weak)  id<ShopCarTableViewHeaderViewDelegate>delegate;
/** 设置选择按钮的tag */
@property (nonatomic, assign) NSInteger selectBtnTag;
/** 设置编辑按钮的tag */
@property (nonatomic, assign) NSInteger editBtnTag;
/** 设置全选按钮的状态 */
@property (nonatomic, assign) BOOL headerViewAllSelectBtnState;
/** 设置编辑按钮的状态 */
@property (nonatomic, assign) BOOL headerViewEditBtnState;
/** 设置编辑按钮的状态 */
@property (nonatomic, assign) BOOL hiddenEidtBtn;


@end
