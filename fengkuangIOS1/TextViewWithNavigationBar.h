//
//  TextViewWithNavigationBar.h
//  fengkuangIOS1
//
//  Created by yzj on 16/7/10.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewWithNavigationBar : UIViewController<UITextViewDelegate>
{
    int a;
}
//思考一下为什么IBOutlet是weak  界面写的代码是strong
@property (strong, nonatomic) UIBarButtonItem* buttonItem;
@property (strong, nonatomic) UITextView* textView;
@property (strong, nonatomic) UINavigationItem* item;
@property (weak, nonatomic) IBOutlet UIButton *middleButton;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegment;

@end
