//
//  TextViewWithNavigationBar.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/10.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "TextViewWithNavigationBar.h"
@interface TextViewWithNavigationBar ()

@end

@implementation TextViewWithNavigationBar

-(void) viewDidLoad {
    [super viewDidLoad];
    self.textView = [[UITextView alloc] initWithFrame:
                     CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
    [self.view addSubview: self.textView];
    self.textView.bounces = YES;
    self.textView.alwaysBounceHorizontal = YES;
    self.textView.alwaysBounceVertical = YES;
    self.textView.delegate = self;
    
    UINavigationBar* nBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)];
    [self.view addSubview:nBar];
    self.item = [[UINavigationItem alloc] initWithTitle: @"title123"];
//    input an array
    nBar.items = @[self.item];
    self.buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editDone:)];
    self.item.rightBarButtonItem = self.buttonItem;
    
    [self.textView removeFromSuperview];
    
    //create segment using code
    UISegmentedControl* segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(0, 200, 300, 50)];
    [self.view addSubview:segment];
    [segment insertSegmentWithTitle:@"hehe1" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"hehe2" atIndex:1 animated:NO];
    
    NSLog(@"%f", self.view.bounds.size.width);
    NSLog(@"%f", [UIScreen mainScreen].bounds.size.width);
    NSLog(@"%f", self.view.bounds.size.height);
    NSLog(@"%f", [UIScreen mainScreen].bounds.size.height);
    
    
    // create uiviewimage
    UIImage* image = [UIImage imageNamed:@"zen-icons-pen.png"];
    UIImageView* imageView = [[UIImageView alloc] initWithImage: image];
    [self.view addSubview:imageView];
}

- (void)editDone: (id)sender {
    NSLog(@"editDone");
    [self.textView resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"textViewDidBeginEditing");
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"textViewDidEndEditing");
}

- (IBAction)toggleMySwtich:(id)sender {

    if (self.mySwitch.on) {
        self.myLabel.text = @"Open";
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.myLabel.text = @"Close";
        self.view.backgroundColor = [UIColor blackColor];
    }
    
}

- (IBAction)segmentChanged:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.myLabel.text = @"i am Fisrst";
            break;
        case 1:
            self.myLabel.text = @"i am Second";
            break;
        default:
            self.myLabel.text = @"i am Third";
            break;
    }
}

@end
