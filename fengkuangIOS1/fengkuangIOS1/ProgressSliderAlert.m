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
UISlider* slider;
UILabel* label;
UIImageView* imageView1;
UIDatePicker* datePicker;
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

- (void)viewDidLoad {
    [super viewDidLoad];
    label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 44, 200, 50)];
    label.text = @"this is title";
    [self.view addSubview:label];
    
//    [self testProgress];
//    [self testIndicator];
//    [self testSlider];
//    [self testAlert];
//    [self testDatePicker];
//    [self testToolBar];

}


- (IBAction)t1:(id)sender {
    NSLog(@"test1");
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"toolbar" message:@"toobar2" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil  ];
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:^{
//        alert弹出完成后执行
        NSLog(@"done");
    }];
}

- (IBAction)t2:(id)sender {
    NSLog(@"test2");
}

- (void)testToolBar {
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 200, SCREENWIDTH, 44)];
    UIBarButtonItem* item1 = [[UIBarButtonItem alloc] initWithTitle:@"first" style:UIBarButtonItemStylePlain target:self action:@selector(t1:)];
    UIBarButtonItem* item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    UIBarButtonItem* item3 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrow3.png"] style:UIBarButtonItemStylePlain target:self action:@selector(t2:)];
    item2.width = 200;
    toolbar.items = @[item1, item2, item3];
    [self.view addSubview:toolbar];
}

- (void)testDatePicker {
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    datePicker.minimumDate = [NSDate date];
    datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:3600 * 24 * 7];
    [datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
}

- (void)dateChange: (id)sender {
    
}

- (void)testAlert {
    [self createButtonWithTitle:@"showAlert" positionX:100 positionY:200 action:@selector(showAlert:)];

}

- (void)showAlert: (id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"%@", action);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"%@ %@", ((UITextField*)(alert.textFields[0])).text, ((UITextField*)(alert.textFields[1])).text);
    }]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"action3" style:UIAlertActionStyleDestructive handler:nil]];
//    [alert addAction:[UIAlertAction actionWithTitle:@"action4" style:UIAlertActionStyleCancel handler:nil]];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"username";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"password";
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.secureTextEntry = YES;
    }];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIImageView*)createTapImage: (NSString*)name forAction: (SEL)action positionX:(int)x positionY:(int)y {
    UIImage* image = [UIImage imageNamed:name];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    if(action){
        UITapGestureRecognizer* recongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
        [imageView addGestureRecognizer:recongnizer];
    }
    imageView.frame = CGRectMake(x, y, image.size.width, image.size.height);
    [self.view addSubview:imageView];
    return imageView;
}

- (void)testSlider {
    slider = [[UISlider alloc]initWithFrame:CGRectMake(100, 100, 200, 50)];
    slider.maximumValue = 100;
    slider.value = 55;

    slider.minimumValueImage = [UIImage imageNamed:@"arrow3.png"];
    slider.maximumValueImage = [UIImage imageNamed:@"arrow3.png"];

    [slider addTarget:self action:@selector(slideChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
//    设置可拉伸图片
    UIImage* resizeImage = [[UIImage imageNamed:@"progress.gif"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    [slider setMinimumTrackImage:resizeImage forState:UIControlStateNormal];
    slider.transform = CGAffineTransformMakeScale(1, 3);
    
//    控制图片的透明度
    imageView1 = [self createTapImage:@"arrow1.png" forAction:@selector(slideChange:) positionX:100 positionY:400];
}

- (void)slideChange: (id)sender {
    label.text = [NSString stringWithFormat:@"%f",slider.value];
    imageView1.alpha = slider.value/100;
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
