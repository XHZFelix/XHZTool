//
//  UIColor+ChangeHEXtoRGB.h
//  KDWFinancial
//
//  Created by 修怀忠 on 2017/9/1.
//  Copyright © 2017年 修怀忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ChangeHEXtoRGB)

/*
 十六进制颜色转RGB
 **/
+ (UIColor *)colorWithHexString:(NSString *)hexColor;

@end
