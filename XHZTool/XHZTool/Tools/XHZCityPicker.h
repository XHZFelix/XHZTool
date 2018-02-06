//
//  XHZCityPicker.h
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHZCityPicker;

@protocol XHZCityPickerDelegate<NSObject>

@optional
- (void)getCityResualtWithProvice:(NSString *)province city:(NSString *)city district:(NSString *)district;
@end

@interface XHZCityPicker : UIPickerView
@property (nonatomic, weak) id <XHZCityPickerDelegate>cityDelegate;

@end
