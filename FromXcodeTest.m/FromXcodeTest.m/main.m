//
//  main.m
//  FromXcodeTest.m
//
//  Created by yzj on 16/6/30.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//
#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>
#import "NSNumber+add.h"
#import "MyFactory.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//        printf("hehe");
//        NSNumber* salary = [NSNumber numberWithDouble: 1234.567];
//        printf("%f", [salary doubleValue]);
//        NSNumber* after = [salary addDouble: 123.123];
//        NSLog(@"\n%@ %f", after, [after doubleValue]);
        
        NSLog(@"%@", [MyFactory initWithInt:-11]);
        NSLog(@"%@", [MyFactory initWithInt:11]);
        
    }
    return 0;
}
