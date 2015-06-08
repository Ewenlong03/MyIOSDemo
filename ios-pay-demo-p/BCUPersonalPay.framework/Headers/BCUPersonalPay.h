//
//  BCUPersonalPay.h
//  BCUPersonalPay
//
//  Created by Ewenlong03 on 15/5/22.
//  Copyright (c) 2015年 Ewenlong03. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BeeCloud/BeeCloud.h>

//! Project version number for BCUPersonalPay.
FOUNDATION_EXPORT double BCUPersonalPayVersionNumber;

//! Project version string for BCUPersonalPay.
FOUNDATION_EXPORT const unsigned char BCUPersonalPayVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <BCUPersonalPay/PublicHeader.h>


@interface BCUPersonalPay : NSObject

#pragma mark - UnionPay functions
/** @name unionPay functions*/

/**
 *  银联在线支付
 *
 *  @param trace_id       支付用户ID，必须保证在商户系统中唯一.可通过trace_id查询订单详情
 *  @param body           商品的标题/交易标题/订单标题/订单关键字等。该参数最长为32个字节(16个汉字)
 *  @param out_trade_no   商户系统内部的支付订单号,包含数字与字母,确保在商户系统中唯一,长度不大于17位,建议使用[BCUPersonalPay genOutTradeNo]生成订单号
 *  @param total_fee      支付金额,以分为单位
 *  @param viewController 调起银联支付的页面
 *  @param optional       扩展参数，可以传入任意数量的key/value对来补充对业务逻辑的需求
 *  @param block          接收支付结果回调
 */
+ (void)reqUPersonalPay:(NSString *)trace_id
                   body:(NSString *)body
             outTradeNo:(NSString *)out_trade_no
               totalFee:(NSString *)total_fee
         viewController:(UIViewController *)viewController
               optional:(NSDictionary *)optional
               payblock:(BCPayBlock)block ;

/**
 *  生成订单号
 *
 *  @return 17位不重复的订单号
 */
+ (NSString *)genOutTradeNo;

@end