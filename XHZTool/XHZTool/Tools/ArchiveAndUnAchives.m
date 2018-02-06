//
//  ArchiveAndUnAchives.m
//  KDWFinancial
//
//  Created by 修怀忠 on 2017/9/6.
//  Copyright © 2017年 修怀忠. All rights reserved.
//

#import "ArchiveAndUnAchives.h"

@implementation ArchiveAndUnAchives

+ (void)achiveWithPath:(NSString *)pathComponent object:(id)object{
    NSString *pathString = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [pathString stringByAppendingString:[NSString stringWithFormat:@"/%@",pathComponent]];
    [NSKeyedArchiver archiveRootObject:object toFile:fileName];
}

+ (id)unAchiveWithPathComponet:(NSString *)pathComponent{
    NSString *pathString = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [pathString stringByAppendingString:[NSString stringWithFormat:@"/%@",pathComponent]];
    id object = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    return object;
}

@end
