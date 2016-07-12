//
//  AppDelegate.h
//  fengkuangIOS1
//
//  Created by yzj on 16/6/27.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property  NSMutableArray* book;
@property  NSMutableArray* content;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

