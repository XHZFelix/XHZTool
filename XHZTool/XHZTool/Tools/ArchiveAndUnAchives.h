//
//  ArchiveAndUnAchives.h
//  KDWFinancial
//
//  Created by 修怀忠 on 2017/9/6.
//  Copyright © 2017年 修怀忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveAndUnAchives : NSObject

/**
 归档

 @param pathComponent pathComponent
 @param object object
 */
+ (void)achiveWithPath:(NSString *)pathComponent object:(id)object;

/**
 解档

 @param pathComponent pathComponent
 */
+ (id)unAchiveWithPathComponet:(NSString *)pathComponent;

@end
