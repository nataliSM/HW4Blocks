//
//  NSArray+Blocks.m
//  MemoryManagingProj
//
//  Created by Наталья on 10.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "NSArray+Blocks.h"

@implementation NSArray (Blocks)

- (void)getUniqueArr:(NSArray *)arr andCompletionBlock:(void(^)(NSArray *myArr))completionBlock{
    
    NSArray *newFirstArr = [[NSSet setWithArray:self] allObjects];
    NSArray *newSecondArr = [[NSSet setWithArray:arr] allObjects];
    NSMutableArray *uniqueArray = [NSMutableArray new];
    
    for (int i = 0; i < newFirstArr.count; i++){
        BOOL finded = NO;
        
        for (int j = 0; j < newSecondArr.count; j++){
            
            if ([newFirstArr[i] isEqual:newSecondArr[j]]){
                finded = YES;
                break;
            }
        }
        if (!finded){
            [uniqueArray addObject: newFirstArr[i]];
        }
    }
    for (int j = 0; j < newSecondArr.count; j++){
        BOOL finded = NO;
        
        for (int i = 0; i < newFirstArr.count; i++){
            
            if ([newSecondArr[j] isEqual:newFirstArr[i]]){
                finded = YES;
                break;
            }
        }
        if (!finded){
            [uniqueArray addObject: newSecondArr[j]];
        }
    }
    completionBlock(uniqueArray);
}

- (void)switchObjectAtIndex:(int)atIndex toIndex:(int)toIndex andCompletionBlock:(void(^)(NSArray *arr))completionBlock andErrorBlock:(void(^)(NSError *error))errorBlock
{
    if (atIndex < self.count & toIndex < self.count)
    {
    id object = self[atIndex];
    NSMutableArray *mutableCopy = [self mutableCopy];
    [mutableCopy removeObject:object];
    [mutableCopy insertObject:object atIndex:toIndex];
    
    completionBlock([mutableCopy copy]);
    }else
    {
        NSError *error = [NSError errorWithDomain:@"Index is bigger than you need" code:1 userInfo:nil];
        errorBlock(error);
        
        
    }
    
}

+ (void)testArray:(NSArray *)array withSuccesBlock:(void(^)(NSArray *arr))successBlock andFailureBlock:(void(^)(NSError *error))failureBlock
{
    if (!array){
        NSError *error = [NSError errorWithDomain:@"Array is nil" code:1 userInfo:nil];
        failureBlock(error);
        return;
    }
    
    for (id obj in array)
    {
        if (![obj isEqual:[NSNull null]]){
            continue;
        }
        NSError *error = [NSError errorWithDomain:@"Value is null" code:1 userInfo:nil];
        failureBlock(error);
        return;
    }
    successBlock(array);
    
    
    
    
}

@end

