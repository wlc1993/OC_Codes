//
//  ImageController.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/10.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "ImageController.h"

@implementation ImageController
int currentIndex = 0;
NSArray* images;
UIImageView* imageView;

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createImageView];
    [self createImageView2];
}
- (void)createImageView2 {
    images = @[[UIImage imageNamed:@"9.jpg"], [UIImage imageNamed:@"tiantiansifangmao-03.png"], [UIImage imageNamed:@"tiantiansifangmao-10.png"],
               [UIImage imageNamed:@"9.jpg"], [UIImage imageNamed:@"tiantiansifangmao-03.png"], [UIImage imageNamed:@"tiantiansifangmao-10.png"]];
    UIImageView* iView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 300, 300)];
    iView.image = images[1];
    [self.view addSubview:iView];
    
    iView.animationImages = images;
    iView.animationDuration = 3;
    iView.animationRepeatCount = 111;
    [iView startAnimating];
}

- (void)createImageView {
    //    添加几个button方便控制
    NSMutableArray* buttons = [NSMutableArray array];
    CGRect rects[] = {CGRectMake(100, 100, 50, 50), CGRectMake(200, 100, 50, 50), CGRectMake(300, 100, 50, 50)};
    images = @[[UIImage imageNamed:@"9.jpg"], [UIImage imageNamed:@"tiantiansifangmao-03.png"], [UIImage imageNamed:@"tiantiansifangmao-10.png"]];
    SEL actions[] = {NSSelectorFromString(@"previous:"), NSSelectorFromString(@"scale:"), NSSelectorFromString(@"next:")};
    for (int i = 0; i < 3; i++) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = rects[i];
        [button setTitle: [NSString stringWithFormat:@"button%d",i] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button addTarget:self action:actions[i] forControlEvents:UIControlEventTouchUpInside];
        buttons[i] = button;
    }
    CGSize size = [UIScreen mainScreen].bounds.size;
    //    add imageview
    currentIndex = 0;
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, size.width, size.height - 150)];
    imageView.userInteractionEnabled = YES;
    imageView.image = images[currentIndex];
    [self.view addSubview:imageView];
    
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView addGestureRecognizer:gesture];
}

- (void)tap: (UIGestureRecognizer*)gesture {
    CGPoint point = [gesture locationInView:imageView];
    NSLog(@"%f %f", point.x, point.y);
}

- (void)previous: (id)sender {
    NSLog(@"click");
}

- (void)scale: (id)sender {
    NSLog(@"scale");
}

- (void)next: (id)sender {
    NSLog(@"scale");
    currentIndex = (currentIndex + 1) % images.count;
    imageView.image = images[currentIndex];
}

@end
