//
//  XHZAlert.h
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHZAlert : UIAlertController


/**
 一个按钮的弹出框

 @param title 标题
 @param message 消息内容
 @param buttonTitle 按钮文字
 @param target 弹出对象（UIViewController 或加载Controller上的View）
 @param buttonHadle 按钮点击事件
 @param completion 弹出完成之后
 */
+ (void)alertWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message buttonTitle:(NSString *_Nullable)buttonTitle target:(UIViewController * _Nonnull)target buttonHadle:(void(^ _Nullable)(void))buttonHadle completion:(void (^ __nullable)(void))completion;


/**
 两个按钮弹出框

 @param title 标题
 @param message 消息内容
 @param firstButtonTitle 第一个按钮文字
 @param secondButtonTitle 第二个按钮文字
 @param target 弹出对象（UIViewController）
 @param firstHandle 第一个按钮处理事件
 @param secondHandle 第二个按钮处理事件
 @param completion 弹出完成之后
 */
+ (void)alertWithTwoButtonWithTitle:(NSString *_Nullable)title message:(NSString *_Nullable)message firstButtonTitle:(NSString *_Nullable)firstButtonTitle secondButtonTitle:(NSString *_Nullable)secondButtonTitle target:(UIViewController * _Nonnull)target firstBtnHandle:(void(^ _Nullable)(void))firstHandle secondBtnHandle:(void(^ _Nullable)(void))secondHandle completion:(void (^ __nullable)(void))completion;

@end
