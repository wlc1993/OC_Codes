//
//  SimpleTableDetailViewController.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/12.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "SimpleTableDetailViewController.h"

@implementation SimpleTableDetailViewController

AppDelegate* appDelegate;
UITextField* bookname;
UITextField* content;

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = [UIApplication sharedApplication].delegate;
    [((UIControl *)self.view) addTarget:self action:@selector(editDone:) forControlEvents:UIControlEventTouchDown];
    [self addToolBar];
    [self addTextFiled];
}

- (void)addTextFiled {
    bookname = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    bookname.placeholder = @"bookname";
    [bookname addTarget:self action:@selector(editDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    bookname.text = appDelegate.book[self.editIndex];
    [self.view addSubview:bookname];
    
    content = [[UITextField alloc] initWithFrame:CGRectMake(100, 180, 200, 50)];
    content.placeholder = @"content";
    [content addTarget:self action:@selector(editDone:) forControlEvents:UIControlEventEditingDidEndOnExit];
    content.text = appDelegate.content[self.editIndex];
    [self.view addSubview:content];
}

- (void)editDone: (id)sender {
    NSLog(@"edit done");
    appDelegate.book[self.editIndex] = bookname.text;
    appDelegate.content[self.editIndex] = content.text;
    [bookname resignFirstResponder];
    [content resignFirstResponder];
}

- (void)addToolBar {
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, 44)];
    UIBarButtonItem* back = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(back:)];
    toolbar.items = @[back];
    [self.view addSubview:toolbar];
}

- (void)back: (id)sender {
    NSLog(@"back");
    [self editDone:self];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
