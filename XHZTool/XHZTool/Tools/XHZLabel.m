//
//  XHZLabel.m
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import "XHZLabel.h"

@implementation XHZLabel

+ (UILabel *)creatLabelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor textFont:(CGFloat)textFont textAlignment:(NSTextAlignment)textAlignment{
    UILabel *customLabel = [[UILabel alloc] initWithFrame:frame];
    if (text) customLabel.text = text;
    if (textAlignment) customLabel.textAlignment = textAlignment;
    if (textFont) customLabel.font = [UIFont systemFontOfSize:textFont];
    if (textColor) customLabel.textColor = textColor;
    return customLabel;
}

+ (CGFloat)caculateTextWidthWithLabel:(UILabel *)label{
    if (label.text.length == 0) {
        return 0.0;
    }else{
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, label.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
        return size.width;
    }
}

+ (CGFloat)caculateTextHeightWithLabel:(UILabel *)label{
    if (label.text.length == 0) {
        return label.bounds.size.height;
    }else{
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(label.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:label.font} context:nil].size;
        return size.height;
    }
}

+ (NSAttributedString *)changeColorWithLabel:(UILabel *)label textArray:(NSArray<NSString *> *)textArray colorArray:(NSArray<UIColor *> *)colorArray{
    if (label.text.length == 0) {
        return [[NSAttributedString alloc] initWithString:@""];
    }
    NSMutableString *mString = [NSMutableString stringWithString:label.text];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:label.text];
    for (int i = 0; i < (int)(textArray.count <= colorArray.count ? textArray.count:colorArray.count); i ++) {
        NSRange range = [label.text rangeOfString:textArray[i]];
        [attributeString addAttribute:NSForegroundColorAttributeName value:colorArray[i] range:range];
        mString = [[mString stringByReplacingOccurrencesOfString:textArray[i] withString:@""] mutableCopy];
    }
    NSRange lRange = [label.text rangeOfString:mString];
    [attributeString addAttribute:NSForegroundColorAttributeName value:label.textColor range:lRange];
    return attributeString;
}

+ (NSAttributedString *)changeFontWithLabel:(UILabel *)label textArray:(NSArray<NSString *> *)textArray fontArray:(NSArray<UIFont *> *)fontArray{
    if (label.text.length == 0) {
        return [[NSAttributedString alloc] initWithString:@""];
    }else{
        NSMutableString *mString = [NSMutableString stringWithString:label.text];
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:mString];
        for (int i = 0; i < (int)(textArray.count <= fontArray.count ? textArray.count:fontArray.count); i ++) {
            NSRange range = [label.text rangeOfString:textArray[i]];
            if (range.length != NSNotFound) {
                [attributeString addAttribute:NSFontAttributeName value:(UIFont *)fontArray[i] range:range];
            }
        }
        return attributeString;
    }
}

@end
