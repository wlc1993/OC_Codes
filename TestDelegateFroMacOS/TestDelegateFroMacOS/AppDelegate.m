//
//  AppDelegate.m
//  TestDelegateFroMacOS
//
//  Created by yzj on 16/6/30.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(333, 333, 333, 333) styleMask:(NSTitledWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask) backing:NSBackingStoreBuffered defer:NO];
    self.window.title = @"hehetitle";
    
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self.window makeKeyAndOrderFront:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
