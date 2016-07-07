//
//  LoginController.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/7.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "LoginController.h"

@interface LoginController()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginController
- (void)viewDidLoad{
    [super viewDidLoad];
//    点击done的响应事件注册
    [self.username addTarget:self action: @selector(finishEdit:) forControlEvents: UIControlEventEditingDidEndOnExit];
}

- (void) finishEdit:(id) sender {
    NSLog(@"finishEdit");
    [super resignFirstResponder];
}

- (IBAction)submit:(id)sender {
    NSLog(@"%@ %@", self.username.text, self.password.text);
}

//把背景view变成uicontrol 然后注册touchdown事件 把所有文本都resignFirstResponder
- (IBAction)uiControlTouchDown:(id)sender {
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
}
@end
