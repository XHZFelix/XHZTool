//
//  XHZPickerView.m
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import "XHZPickerView.h"

@interface XHZPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) NSArray *array;
@end

@implementation XHZPickerView

- (instancetype)initWithData:(NSArray *)dataArray{
    self = [super init];
    if (self) {
        self.array = [NSArray arrayWithArray:dataArray];
        self.delegate = self;
        self.dataSource = self;
        self.showsSelectionIndicator = YES;
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    self.array = [NSArray arrayWithArray:dataArray];
    [self reloadAllComponents];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;                                                                                                                                                                                                                                                                                                                            
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.array.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = (UILabel *)view;
    if (!label) {
        label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.adjustsFontSizeToFitWidth = YES;
    }
    label.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return label;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [NSString stringWithFormat:@"%@",self.array[row]];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *resualtString = [NSString stringWithFormat:@"%@",self.array[row]];
    if (_pickerDelegate && [_pickerDelegate respondsToSelector:@selector(getPickerResualt:)]) {
        [_pickerDelegate getPickerResualt:resualtString];
    }
}


@end
