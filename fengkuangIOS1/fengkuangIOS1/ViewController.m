//
//  ViewController.m
//  fengkuangIOS1
//
//  Created by yzj on 16/6/27.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@end

@implementation ViewController

- (void)viewDidLoad {
//    先加载，再willappear 再didappear
    [super viewDidLoad];
    NSLog(@"hehe");
    NSDate *date = [NSDate date];
    NSLog(@"%@", date);
    UILabel* imageTips = (UILabel*)[self.view viewWithTag:89757];
    imageTips.text = @"hehe12234444";
    [self.codeButton addTarget:self action:@selector(changeLabel2:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    NSLog(@"didReceiveMemoryWarning");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"view did appear");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    NSLog(@"view will appear");
}

- (IBAction)left2button:(id)sender {
//    [self.label1 setContentScaleFactor:0.9];
    [self.label1 setFrame:CGRectMake(111, 333, 333, 333)];

//    self.label1.font = [UIFont boldSystemFontOfSize:23.0f];
}

- (void)changeLabel2:(id)sender{
    self.label2.text = @"yeah this is bu code";
}

@end
