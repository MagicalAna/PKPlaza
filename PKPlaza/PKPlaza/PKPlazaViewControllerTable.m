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

@end

@implementation PKPlazaViewControllerTable

- (void)viewDidLoad {
    [super viewDidLoad];
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
    _tableView.allowsSelection = NO;
    //设置颜色
    [self setTheme];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_array count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_ABC == 0) {
        return _tableView.frame.size.height;
    } else {
        PKPlazaViewControllerCell *viewControllerCell = [[PKPlazaViewControllerCell alloc] init];
        [viewControllerCell setDictionary:_array[indexPath.row]];
        return viewControllerCell.view.frame.size.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_ABC == 0) {
        PKPlazaViewControllerVote *viewControllerVote = [[PKPlazaViewControllerVote alloc] init];
        [viewControllerVote setDictionary:_array[indexPath.row]];
        UIView *view = [[UIView alloc] initWithFrame:viewControllerVote.view.frame];
        [view addSubview:viewControllerVote.view];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapVote:)];
        tapGestureRecognizer.view.frame = viewControllerVote.view.frame;
        [view addGestureRecognizer:tapGestureRecognizer];
        UITableViewCell *tableViewCell = [[UITableViewCell alloc] init];
        [tableViewCell addSubview:view];
        return tableViewCell;
    } else {
        PKPlazaViewControllerCell *viewControllerCell = [[PKPlazaViewControllerCell alloc] init];
        [viewControllerCell setDictionary:_array[indexPath.row]];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapCell:)];
        [viewControllerCell.view addGestureRecognizer:tapGestureRecognizer];
        UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithFrame:viewControllerCell.view.bounds];
        [tableViewCell addSubview:viewControllerCell.view];
        return tableViewCell;
    }
}

//设置颜色
- (void)setTheme {
    
}

//点击事件
- (void)TapVote:(id)sender {
    NSLog(@"点击Vote");
}

- (void)TapCell:(id)sender {
    NSLog(@"点击Cell");
}

@end
