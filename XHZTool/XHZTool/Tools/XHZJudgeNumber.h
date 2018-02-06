//
//  XHZJudgeNumber.h
//  KDWFinancial
//
//  Created by 修怀忠 on 2017/8/29.
//  Copyright © 2017年 修怀忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XHZJudgeNumber : NSObject


/**
 判断手机号码是否正确
 
 @param mobile 传入的手就号码
 @return 返回值
 */
+ (BOOL)valiMobile:(NSString *)mobile;



/**
 判断整数
 
 @param integerStr 整数字符串
 @param sign 有无符号
 */
+ (BOOL)valiIntegerStr:(NSString *)integerStr sign:(BOOL)sign;


/**
 判断小数
 
 @param floatStr 小数字符串
 @param sign 有无符号
 
 */
+ (BOOL)valiFloatStr:(NSString *)floatStr sign:(BOOL)sign;

/**
 判断是否为数学表达式
 
 @param valueStr 传入的字符串
 @param sign 是否有符号
 */
+ (BOOL)valiValueStr:(NSString *)valueStr sign:(BOOL)sign;


/**
 判断身份证

 @param identityCard 身份证号码
 @return 返回值
 */
+ (BOOL)validateIdentityCard: (NSString *)identityCard;

@end
