//
//  XHZPickerView.h
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XHZPickerView;
@protocol XHZPickerViewDelegate<NSObject>
@optional
- (void)getPickerResualt:(NSString *)resualt;
@end

@interface XHZPickerView : UIPickerView
@property (nonatomic, strong) NSArray<NSString *>*dataArray;
@property (nonatomic, weak) id<XHZPickerViewDelegate> pickerDelegate;

- (instancetype)initWithData:(NSArray<NSString *>*)dataArray;

@end
