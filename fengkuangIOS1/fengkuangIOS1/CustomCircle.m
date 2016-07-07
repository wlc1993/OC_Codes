//
//  CustomCircle.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/7.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "CustomCircle.h"

@implementation CustomCircle
{
    int x;
    int y;
}
//自定义类 一个随着触摸移动的实心圆
- (void)drawRect:(CGRect)rect
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ref, [[UIColor redColor]CGColor]);
    CGContextFillEllipseInRect(ref, CGRectMake(x - 10, y - 10 , 20, 20));
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    x = point.x;
    y = point.y;
    NSLog(@"move to %d %d", x, y);
    [self setNeedsDisplay];
}
@end
