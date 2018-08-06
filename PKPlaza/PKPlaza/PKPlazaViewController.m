//
//  PKPlazaViewController.m
//  PKPlaza
//
//  Created by Yuan Ana on 2018/8/5.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "PKPlazaViewController.h"
#import "PKPlazaViewControllerABC.h"

@interface PKPlazaViewController ()

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) PKPlazaViewControllerABC *viewControllerA;
@property (nonatomic, strong) PKPlazaViewControllerABC *viewControllerB;
@property (nonatomic, strong) PKPlazaViewControllerABC *viewControllerC;

@end

@implementation PKPlazaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化三个PKPlazaViewControllerABC
    _viewControllerA = [[PKPlazaViewControllerABC alloc] init];
    [_viewControllerA setABC:0];
    _viewControllerB = [[PKPlazaViewControllerABC alloc] init];
    [_viewControllerB setABC:1];
    _viewControllerC = [[PKPlazaViewControllerABC alloc] init];
    [_viewControllerC setABC:2];
    //添加分段控制器
    NSArray *array = @[@"PK投票", @"我PK他", @"他PK我"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    _segmentedControl = segmentedControl;
    _segmentedControl.tag = 10000;
    _segmentedControl.frame = CGRectMake((self.view.bounds.size.width - 210) / 2, 5, 210, 30);
    [_segmentedControl addTarget:self action:@selector(TapSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    _segmentedControl.selectedSegmentIndex = 0;
    [self.navigationController.navigationBar addSubview:_segmentedControl];
    //假装set颜色
    [self setTheme];
    //默认push到_viewControllerA
    [self.navigationController pushViewController:_viewControllerA animated:NO];
}
//_segmentedControl绑定的事件
- (void)TapSegmentedControl:(UISegmentedControl *)sender {
    [self.navigationController popViewControllerAnimated:NO];
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.navigationController pushViewController:_viewControllerA animated:NO];
            break;
        case 1:
            [self.navigationController pushViewController:_viewControllerB animated:NO];
            break;
        case 2:
            [self.navigationController pushViewController:_viewControllerC animated:NO];
    }
}
//假装set颜色
- (void)setTheme {
    
}

@end
