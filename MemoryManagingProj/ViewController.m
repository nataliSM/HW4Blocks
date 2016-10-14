//
//  ViewController.m
//  MemoryManagingProj
//
//  Created by Ildar Zalyalov on 01.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Blocks.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *mainArr;
@property (nonatomic, strong) NSArray *secondArr;
@property (atomic, strong)    NSString *string;
@property (readonly) NSString *fullName;
@property (nonatomic, assign) NSInteger *value;


@end



@implementation ViewController

- (void)setIntValue:(NSInteger *)newValue
{
    _value = (newValue < 0) ? 0 : newValue;
    
}

- (NSInteger *)getIntValue
{
    return _value;
}


- (NSArray *)getMainArray
{
    return _mainArr;
}

- (void)setMainArray:(NSArray *)newArray{
    _mainArr = newArray;
}

- (NSString *)getSomeString {
    
    return _string;
}

- (void)setSomeString:(NSString *)newString {
    @synchronized (self) {
        _string = newString;
    }
    
}

- (NSArray *)mainArr
{
    if(!_mainArr)
    {
        _mainArr = @[@"0" ,@"4", @"5", @"7", @"8", @"9"];
    }
    return _mainArr;
}

- (NSArray *)secondArr
{
    if(!_secondArr)
    {
        _secondArr = @[@"1" , @"3", @"2", @"7", @"8", @"9"];
    }
    return _secondArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainArr getUniqueArr:self.secondArr andCompletionBlock:^(NSArray *myArr) {
        NSLog(@"%@", myArr);
    }];
    
    [self.mainArr switchObjectAtIndex:0 toIndex:2 andCompletionBlock:^(NSArray *arr) {
         NSLog(@"%@",arr);
    } andErrorBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    //self.mainArr = nil;
    
    [NSArray testArray:_mainArr withSuccesBlock:^(NSArray *arr) {
        NSString *logString = @"";
        
        for (NSInteger i = 0; i < arr.count; i++){
            logString = [NSString stringWithFormat:@"%@,%ld:%@", logString, (long)i, arr[i]];
        }
        NSLog(@"%@", logString);
    } andFailureBlock:^(NSError *error) {
         NSLog(@"%@",error);
    }];
    

    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
