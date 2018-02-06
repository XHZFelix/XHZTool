//
//  XHZAlert.m
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import "XHZAlert.h"

@interface XHZAlert ()

@end

@implementation XHZAlert

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message buttonTitle:(NSString *)buttonTitle target:(UIViewController *)target buttonHadle:(void (^)(void))buttonHadle completion:(void (^ _Nullable)(void))completion{
    UIViewController *viewController = target;
    XHZAlert *alert = [XHZAlert alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (buttonHadle) {
            buttonHadle();
        }else{
            [alert dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [alert addAction:action];
    [viewController presentViewController:alert animated:YES completion:^{
        if (completion) {
            completion();
        }
    }];
}

+ (void)alertWithTwoButtonWithTitle:(NSString *)title message:(NSString *)message firstButtonTitle:(NSString *)firstButtonTitle secondButtonTitle:(NSString *)secondButtonTitle target:(UIViewController *)target firstBtnHandle:(void (^)(void))firstHandle secondBtnHandle:(void (^)(void))secondHandle completion:(void (^ _Nullable)(void))completion{
    UIViewController *viewController = target;
    XHZAlert *alert = [XHZAlert alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:firstButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (firstHandle) {
            firstHandle();
        }else{
            [alert dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:secondButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (secondHandle) {
            secondHandle();
        }else{
            [alert dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [alert addAction:firstAction];
    [alert addAction:secondAction];
    [viewController presentViewController:alert animated:YES completion:^{
        if (completion) {
            completion();
        }
    }];
}



@end
