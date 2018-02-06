//
//  XHZLabel.h
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHZLabel : UILabel

/**
 创建Label
 */
+ (UILabel * _Nonnull)creatLabelWithFrame:(CGRect)frame text:(NSString *_Nullable)text textColor:(UIColor * _Nullable)textColor textFont:(CGFloat)textFont textAlignment:(NSTextAlignment)textAlignment;

/**
 计算文本宽度
 */
+ (CGFloat)caculateTextWidthWithLabel:(UILabel *_Nonnull)label;

/**
 计算文本高度
 */
+ (CGFloat)caculateTextHeightWithLabel:(UILabel *_Nonnull)label;


/**
 改变某些字体颜色

 @param label 要改变的label
 @param textArray 文字数组
 @param colorArray 颜色数组
 @return 富文本
 */
+ (NSAttributedString *_Nonnull)changeColorWithLabel:(UILabel *_Nonnull)label textArray:(NSArray<NSString *>* _Nullable)textArray colorArray:(NSArray<UIColor *>*_Nullable)colorArray;


/**
 修改某些文字的大小

 @param label 要改变的label
 @param textArray 文字数组
 @param fontArray 字体数组
 @return 富文本
 */
+ (NSAttributedString *_Nonnull)changeFontWithLabel:(UILabel *_Nonnull)label textArray:(NSArray<NSString *>* _Nullable)textArray fontArray:(NSArray<UIFont *>*_Nullable)fontArray;

@end
