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
- (void)changeArr:(int)indexInArr andChangeIndex:(int)changeIndex andCompletionBlock:(void(^)(NSArray *arr))completionBlock;

+ (void)testArray:(NSArray *)array withSuccesBlock:(void(^)(NSArray *arr))successBlock andFailureBlock:(void(^)(NSError *error))failureBlock;
@end
