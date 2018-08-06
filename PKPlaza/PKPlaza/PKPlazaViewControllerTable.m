//
//  PKPlazaViewControllerTable.m
//  PKPlaza
//
//  Created by Yuan Ana on 2018/8/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "PKPlazaViewControllerTable.h"
#import "PKPlazaViewControllerCell.h"
#import "PKPlazaViewControllerVote.h"

#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface PKPlazaViewControllerTable () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSDictionary *dictionary;

@end

@implementation PKPlazaViewControllerTable

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    CGRect rect = self.view.bounds;
    rect.size.height = [[UIScreen mainScreen] bounds].size.height -getRectNavAndStatusHight - 50;
    self.view.bounds = rect;
    //初始化tableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 110) style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    if (_ABC == 0) {
        _tableView.pagingEnabled = YES;
    }
    [self.view addSubview:_tableView];
    //设置颜色
    [self setTheme];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_ABC == 0) {
        return _tableView.frame.size.height;
    } else {
        PKPlazaViewControllerCell *viewControllerCell = [[PKPlazaViewControllerCell alloc] init];
        [viewControllerCell setDictionary:_dictionary];
        return viewControllerCell.view.frame.size.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_ABC == 0) {
        PKPlazaViewControllerVote *viewControllerVote = [[PKPlazaViewControllerVote alloc] init];
        UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithFrame:viewControllerVote.view.bounds];
        [tableViewCell addSubview:viewControllerVote.view];
        return tableViewCell;
    } else {
        PKPlazaViewControllerCell *viewControllerCell = [[PKPlazaViewControllerCell alloc] init];
        [viewControllerCell setDictionary:_dictionary];
        UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithFrame:viewControllerCell.view.bounds];
        [tableViewCell addSubview:viewControllerCell.view];
        return tableViewCell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//设置颜色
- (void)setTheme {
    
}

- (void) setData {
    _dictionary = @{@"name":@"Ana", @"name_color":[UIColor redColor], @"type":@"Magic", @"content":@"Old Ana has a big house\nE-I-E-I-O", @"reason":@"NO WHY", @"date":@"now"};
}

@end
