//
//  XHZActionTextField.h
//  XHZTool
//
//  Created by 修怀忠 on 2018/2/5.
//  Copyright © 2018年 修怀忠. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHZActionTextField : UITextField

/**
 是否可以粘贴
 */
@property (nonatomic, assign) BOOL canPaste;

/**
 是否可以选中
 */
@property (nonatomic, assign) BOOL canSelect;

/**
 是否可以全选
 */
@property (nonatomic, assign) BOOL canSelectAll;

@end
