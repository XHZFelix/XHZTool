//
//  XHZJudgeNumber.m
//  KDWFinancial
//
//  Created by 修怀忠 on 2017/8/29.
//  Copyright © 2017年 修怀忠. All rights reserved.
//

#import "XHZJudgeNumber.h"

@implementation XHZJudgeNumber

//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile
{
    mobile = [mobile stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (mobile.length != 11)
    {
        return NO;
    }else{
        /**
         * 移动号段正则表达式
         */
        NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
        /**
         * 联通号段正则表达式
         */
        NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
        /**
         * 电信号段正则表达式
         */
        NSString *CT_NUM = @"^((133)|(149)|(17[3,7])|(153)|(18[0,1,9]))\\d{8}$";
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
        BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
        BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
        BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
        
        if (isMatch1 || isMatch2 || isMatch3) {
            return YES;
        }else{
            return NO;
        }
    }
}

+ (BOOL)valiIntegerStr:(NSString *)integerStr sign:(BOOL)sign{
    //有符号
    NSString *signIntegerStr = @"^-[0-9]+$";
    //无符号
    NSString *unsignIntegerStr = @"^[0-9]+$";
    
    NSPredicate *predsign = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",signIntegerStr];
    BOOL isMatchSign = [predsign evaluateWithObject:integerStr];
    NSPredicate *predunsign = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",unsignIntegerStr];
    BOOL isMatchUnsign = [predunsign evaluateWithObject:integerStr];
    if (sign) {
        return isMatchSign;
    }else{
        return isMatchUnsign;
    }
}

+ (BOOL)valiFloatStr:(NSString *)floatStr sign:(BOOL)sign{
    //有符号
    NSString *signFloatStr = @"^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$";
    //无符号
    NSString *unsignFloatStr = @"^\\d+(\\.\\d+)?$";
    NSPredicate *predsign = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",signFloatStr];
    BOOL isMatchSign = [predsign evaluateWithObject:floatStr];
    NSPredicate *predunsign = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",unsignFloatStr];
    BOOL isMatchUnsign = [predunsign evaluateWithObject:floatStr];
    if (sign) {
        return isMatchSign;
    }else{
        return isMatchUnsign;
    }
}

+ (BOOL)valiValueStr:(NSString *)valueStr sign:(BOOL)sign{
    if ([XHZJudgeNumber valiIntegerStr:valueStr sign:NO] || [XHZJudgeNumber valiFloatStr:valueStr sign:NO]) {
        return YES;
        
    }else{
        
        return NO;
    }
}

+ (BOOL)validateIdentityCard: (NSString *)identityCard{
    if (identityCard.length <= 0 || identityCard.length <15 || identityCard.length > 18) {
        return NO;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}


@end
