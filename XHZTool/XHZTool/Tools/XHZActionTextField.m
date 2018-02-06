//
//  XHZActionTextField.m
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import "XHZActionTextField.h"

@implementation XHZActionTextField

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _canPaste = YES;
        _canSelect = YES;
        _canSelectAll = YES;
    }
    return self;
}

- (void)setCanPaste:(BOOL)canPaste{
    _canPaste = canPaste;
    
}
- (void)setCanSelect:(BOOL)canSelect{
    _canSelect = canSelect;
}
-(void)setCanSelectAll:(BOOL)canSelectAll{
    _canSelectAll = canSelectAll;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (!self.canPaste && action == @selector(paste:))
        return NO;
    if (!self.canSelect && action == @selector(select:))
        return NO;
    if (!self.canSelectAll && action == @selector(selectAll:))
        return NO;
    return [super canPerformAction:action withSender:sender];
}

@end
