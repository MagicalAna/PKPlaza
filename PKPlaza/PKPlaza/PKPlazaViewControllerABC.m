//
//  PKPlazaViewControllerABC.m
//  PKPlaza
//
//  Created by Yuan Ana on 2018/8/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "PKPlazaViewControllerABC.h"
#import "PKPlazaViewControllerTable.h"

#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface PKPlazaViewControllerABC () <UIPageViewControllerDelegate, UIPageViewControllerDataSource>

@property (nonatomic, weak) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) NSMutableArray *arrayOfPages;
@property (nonatomic, assign) NSInteger index;

@end

@implementation PKPlazaViewControllerABC

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayOfPages = [[NSMutableArray alloc] init];
    //返回按钮
//    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(TapBack:)];
//    self.navigationItem.leftBarButtonItem = backBarButton;
    //设置segmentControl
    NSArray *array = @[[[NSString alloc] initWithFormat:@"例句 %ld条", [_array[0] count]], [[NSString alloc] initWithFormat:@"助记 %ld条", [_array[1] count]]];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    _segmentedControl = segmentedControl;
    _segmentedControl.frame = CGRectMake(0, getRectNavAndStatusHight, self.view.bounds.size.width, 50);
    _segmentedControl.selectedSegmentIndex = 0;
    [_segmentedControl addTarget:self action:@selector(TapSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segmentedControl];
    //设置pageViewController
    _pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _pageViewController.view.frame = CGRectMake(0, getRectNavAndStatusHight + 50, self.view.bounds.size
                                                    .width, self.view.bounds.size.height - getRectNavAndStatusHight -50);
    _pageViewController.delegate = self;
    _pageViewController.dataSource = self;
    
    PKPlazaViewControllerTable *initialViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    [_pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [_pageViewController didMoveToParentViewController:self];
    //设置颜色
    [self setTheme];
}

//设置颜色
- (void)setTheme {
    self.view.backgroundColor = [UIColor whiteColor];
    
}

//backBarButton返回事件
- (void)TapBack:(id)sender {
//    [[self.navigationController.navigationBar viewWithTag:10000] removeFromSuperview];
    [self.navigationController popToRootViewControllerAnimated:NO];
}

//segmentedControl绑定事件
- (void)TapSegmentedControl:(id)sender {
    UISegmentedControl *segmengtedControl = (UISegmentedControl *)sender;
    NSInteger index = [(PKPlazaViewControllerTable *)_pageViewController.viewControllers[0] index];
    switch (segmengtedControl.selectedSegmentIndex) {
        case 0:
            if (index == 1) {
                UIViewController *vc = [self viewControllerAtIndex:0];
                [_pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:^(BOOL finished) {
                    
                }];
            }
            break;
        default:
            if (index == 0) {
                UIViewController *vc = [self viewControllerAtIndex:1];
                [_pageViewController setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
                    
                }];
            }
    }
}

//index为index的viewController
- (PKPlazaViewControllerTable *)viewControllerAtIndex:(NSInteger)index {
    if (index < _arrayOfPages.count) {
        return _arrayOfPages[index];
    } else {
        PKPlazaViewControllerTable *tableViewController = [[PKPlazaViewControllerTable alloc] init];
        tableViewController.index = index;
        [tableViewController setABC:_ABC];
        [tableViewController setArray:_array[index]];
        [_arrayOfPages addObject:tableViewController];
        return tableViewController;
    }
}

//pageViewController协议

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    _index = [(PKPlazaViewControllerTable *)viewController index];
    if (_index == 0) {
        return nil;
    }
    _index--;
    return [self viewControllerAtIndex:_index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    _index = [(PKPlazaViewControllerTable *)viewController index];
    if (_index == 1) {
        return nil;
    }
    _index++;
    return [self viewControllerAtIndex:_index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}

//滑动结束改变segmentedControl
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    _segmentedControl.selectedSegmentIndex = [(PKPlazaViewControllerTable *)_pageViewController.viewControllers[0] index];
}

@end
