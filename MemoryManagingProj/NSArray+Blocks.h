//
//  NSArray+Blocks.h
//  MemoryManagingProj
//
//  Created by Наталья on 10.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Blocks)
- (void)getUniqueArr:(NSArray *)arr andCompletionBlock:(void(^)(NSArray *myArr))completionBlock;
- (void)switchObjectAtIndex:(int)atIndex toIndex:(int)toIndex andCompletionBlock:(void(^)(NSArray *arr))completionBlock andErrorBlock:(void(^)(NSError *error))errorBlock;

+ (void)testArray:(NSArray *)array withSuccesBlock:(void(^)(NSArray *arr))successBlock andFailureBlock:(void(^)(NSError *error))failureBlock;
@end
