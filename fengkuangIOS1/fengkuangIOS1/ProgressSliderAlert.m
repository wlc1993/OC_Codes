//
//  ProgressSliderAlert.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/11.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "ProgressSliderAlert.h"

@implementation ProgressSliderAlert

UIProgressView* gProgress;
NSTimer* timer;
UIActivityIndicatorView* indicator;
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self testProgress];
    [self testIndicator];

    
}
- (UIButton*)createButtonWithTitle: (NSString*)title positionX: (int)x  positionY: (int)y action: (SEL)sel {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(x, y, 100, 50);
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [self.view addSubview:button];
    return button;
}

- (void)testIndicator {
//    圆形等待条
    indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2, 0, 0)];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [indicator startAnimating];
    indicator.hidesWhenStopped = YES;
    [self.view addSubview:indicator];
    
//    创建两个button来控制
    [self createButtonWithTitle:@"start" positionX:50 positionY:100 action:@selector(start:)];
    [self createButtonWithTitle:@"end" positionX:200 positionY:100 action:@selector(stop:)];
}

- (void)start: (id)sender {
    [indicator startAnimating];
}

- (void)stop: (id)sender {
    [indicator stopAnimating];
}

- (void)testProgress {
    //    设置一个progress看看效果
    UIProgressView* progress = [[UIProgressView alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [progress setProgress: 0.88];
    [progress setFrame:CGRectMake(0, 100, 200, 50)];
//    添加背景图
    UIImage* bg = [UIImage imageNamed:@"progress.gif"];
    UIEdgeInsets inset = UIEdgeInsetsMake(bg.size.height/2, bg.size.width/2, bg.size.height/2, bg.size.width/2);
    UIImage* insetImage =[bg resizableImageWithCapInsets:inset];
    //    拉伸改变高度
    progress.transform = CGAffineTransformMakeScale(1, 10);
    progress.progressImage = insetImage;
//    progress.trackImage = insetImage;
    [self.view addSubview: progress];
    gProgress = progress;
    
    
    //    设置一个button操作progress的百分比
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 100, 100, 50);
    [button setTitle:@"add 0.1" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //    设置一个button  随机摆放progress的位置
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(50, 200, 50, 50);
    [button2 setTitle:@"random" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(random:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
//    添加一个图片
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    imageView.image = [UIImage imageNamed:@"progress.gif"];
    [self.view addSubview:imageView];
    
//    这是一个定时器自动增加progress的值
    timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(add:) userInfo:nil repeats:YES];
}

- (void)add: (id)sender {
    gProgress.progress = gProgress.progress + 0.1;
    if(gProgress.progress >= 1){
        gProgress.progress = 0;
//        timer.invalidate();
    }
}

- (void)random: (id)sender {
    gProgress.frame = CGRectMake(random() % 300, random() % 600, random() % 50 + 150, random() % 50 + 150);
    int scale = random() % 10 + 10;
    NSLog(@"%d", scale);
    gProgress.transform = CGAffineTransformMakeScale(1, scale);
    
}

@end
