//
//  AppDelegate.m
//  smartGuide
//
//  Created by GXLiangFengTai on 16/7/12.
//  Copyright © 2016年 GXLiangFengTai. All rights reserved.
//

#import "AppDelegate.h"
#import "SceneViewController.h"
#import "ScanViewController.h"
#import "SetViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    UITabBarController *tabbarController=[[UITabBarController alloc]init];
    SceneViewController * vc = [[SceneViewController alloc]init];
    ScanViewController * vc1 = [[ScanViewController alloc]init];
    SetViewController * vc2 = [[SetViewController alloc]init];
    UINavigationController *navc=[[UINavigationController alloc]initWithRootViewController:vc];
    UINavigationController *navc1=[[UINavigationController alloc]initWithRootViewController:vc1];
    UINavigationController *navc2=[[UINavigationController alloc]initWithRootViewController:vc2];
    navc.title=@"街景";
    navc1.title=@"扫一扫";
    navc2.title=@"我";
    navc.tabBarItem.image=[[UIImage imageNamed:@"scene"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navc1.tabBarItem.image=[[UIImage imageNamed:@"scan"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navc2.tabBarItem.image=[[UIImage imageNamed:@"set"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSArray *array=[NSArray arrayWithObjects:navc,navc1,navc2, nil];
    tabbarController.viewControllers=array;
    self.window.rootViewController=tabbarController;
    self.window.backgroundColor=[UIColor cyanColor];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
