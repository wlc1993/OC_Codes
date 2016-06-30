//
//  MyFactory.m
//  FromXcodeTest.m
//
//  Created by yzj on 16/7/1.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "MyFactory.h"

@interface MyFactoryInt : MyFactory
@end
@implementation MyFactoryInt
+ (id) initWithInt:(int)value
{
    return [[MyFactoryInt alloc] init];
}
@end


@interface MyFactoryBool : MyFactory
@end
@implementation MyFactoryBool
+ (id) initWithInt:(int)value
{
    return [[MyFactoryBool alloc] init];
}
@end

@implementation MyFactory
+ (id) initWithInt:(int)value
{
    if (value >= 0)
    {
        return [MyFactoryInt initWithInt:22];
    }
    return [MyFactoryBool initWithInt:22];
}
@end
