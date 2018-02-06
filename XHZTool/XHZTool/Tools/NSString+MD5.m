//
//  NSString+MD5.m
//  KDWFinancial
//
//  Created by 修怀忠 on 2017/8/29.
//  Copyright © 2017年 修怀忠. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

- (NSString *)md5Str{
    const char *myPassword = [self UTF8String];
    unsigned char mdc[16];
    CC_MD5(myPassword, (CC_LONG)strlen(myPassword), mdc);
    NSMutableString *md5String = [NSMutableString string];
    for (int i = 0 ; i < 16; i ++) {
        [md5String appendFormat:@"%02x",mdc[i]];
    }
    return md5String;
}

@end
