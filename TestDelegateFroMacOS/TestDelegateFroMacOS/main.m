//
//  main.m
//  TestDelegateFroMacOS
//
//  Created by yzj on 16/6/30.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"
int main(int argc, const char * argv[]) {
    AppDelegate* delegate = [[AppDelegate alloc] init];
    NSApplication* app = [NSApplication sharedApplication];
    app.delegate = delegate;
    return NSApplicationMain(argc, argv);
}
