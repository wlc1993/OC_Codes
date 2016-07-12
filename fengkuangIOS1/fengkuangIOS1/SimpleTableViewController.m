//
//  SimpleTableViewController.m
//  fengkuangIOS1
//
//  Created by yzj on 16/7/12.
//  Copyright (c) 2016年 SBYZJ. All rights reserved.
//

#import "SimpleTableViewController.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height


@interface SimpleTableViewController()
@property (weak, nonatomic) IBOutlet UITableView *first;

@end

@implementation SimpleTableViewController

AppDelegate* appDelegate1;
UITableView* tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.first.hidden = YES;
    
    [self prepareData];
    [self testTableView];
}

- (void)prepareData {
//    数组需要初始化  非常重要
    appDelegate1 = [UIApplication sharedApplication].delegate;

}

- (void)testTableView {
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, SCREENWIDTH, SCREENHEIGHT - 50) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
}

//创建每个cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    int type = 1;
    if(type == 1){
        
    }
    static NSString* cellId = @"cellId";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    UITableViewCellStyle styles[] = {
        UITableViewCellStyleDefault, UITableViewCellStyleSubtitle,
        UITableViewCellStyleValue1, UITableViewCellStyleValue2};
    int randomNum = rand() % 4;
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:styles[randomNum] reuseIdentifier:cellId];
    }
    cell.layer.cornerRadius = 12;
    cell.layer.masksToBounds = YES;
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %d", appDelegate1.book[indexPath.row], randomNum];
    cell.detailTextLabel.text = appDelegate1.content[indexPath.row];
    return cell;
}

//返回section对应的记录行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"return book.count = %ld", appDelegate1.book.count);
    return appDelegate1.book.count;
}

//处理点击事件， 需要设置delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"click %ld", indexPath.row);
//    切换界面  暂时没用到segue
    SimpleTableDetailViewController* detail = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    detail.editIndex = indexPath.row;
    [self showViewController:detail sender:self];
}
@end
