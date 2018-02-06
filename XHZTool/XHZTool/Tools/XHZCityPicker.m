//
//  XHZCityPicker.m
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import "XHZCityPicker.h"

@interface XHZCityPicker()<UIPickerViewDelegate,UIPickerViewDataSource>{
    NSInteger _provinceIndex;
    NSInteger _cityIndex;
    NSInteger _districtIndex;
}

@property (nonatomic, strong) NSMutableArray *provinceArray;
@property (nonatomic, strong) NSArray *allData;

@end;

@implementation XHZCityPicker

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initData];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (void)initData{
    _provinceIndex = _cityIndex = _districtIndex = 0;
    NSMutableArray *array = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"address" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    if (dict[@"address"]) {
        array = [NSMutableArray arrayWithArray:dict[@"address"]];
    }
    self.provinceArray = [NSMutableArray array];
    self.allData = [NSArray arrayWithArray:array];
    for (int i = 0; i < array.count; i ++) {
        [self.provinceArray addObject:array[i][@"name"]];
    }
    [self resetPickerSelectRow];
}

-(void)resetPickerSelectRow
{
    [self selectRow:_provinceIndex inComponent:0 animated:YES];
    [self selectRow:_cityIndex inComponent:1 animated:YES];
    [self selectRow:_districtIndex inComponent:2 animated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return self.provinceArray.count;
    }else if (component == 1){
        return  [self.allData[_provinceIndex][@"sub"] count];
    }else{
        return  [self.allData[_provinceIndex][@"sub"][_cityIndex][@"sub"] count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return self.allData[row][@"name"];
    }else if (component == 1){
        return self.allData[_provinceIndex][@"sub"][row][@"name"];
    }else{
        return self.allData[_provinceIndex][@"sub"][_cityIndex][@"sub"][row];
    }
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        _provinceIndex = row;
        _cityIndex = 0;
        _districtIndex = 0;
        [self reloadComponent:1];
        [self reloadComponent:2];
    }else if (component == 1){
        _cityIndex = row;
        _districtIndex = 0;
        [self reloadComponent:2];
    }else{
        _districtIndex = row;
    }
    [self resetPickerSelectRow];
    
    NSString *provice = [NSString stringWithFormat:@"%@",self.allData[_provinceIndex][@"name"]];
    NSString *city = nil;
    NSString *district = nil;
    NSArray *citiesArray = [NSArray arrayWithArray:self.allData[_provinceIndex][@"sub"]];
    NSArray *areasArray = [NSArray arrayWithArray:self.allData[_provinceIndex][@"sub"][_cityIndex][@"sub"]];
    if (citiesArray.count > 0) {
        city = [NSString stringWithFormat:@"%@",self.allData[_provinceIndex][@"sub"][_cityIndex][@"name"]];
        if (areasArray.count > 0) {
            district = [NSString stringWithFormat:@"%@",self.allData[_provinceIndex][@"sub"][_cityIndex][@"sub"][_districtIndex]];
        }else{
            district = @"";
        }
    }else{
        city = @"";
        district = @"";
    }
    if (_cityDelegate && [_cityDelegate respondsToSelector:@selector(getCityResualtWithProvice:city:district:)]) {
        [_cityDelegate getCityResualtWithProvice:provice city:city district:district];
    }
}

@end
