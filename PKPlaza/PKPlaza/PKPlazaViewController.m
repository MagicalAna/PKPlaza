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
@property (nonatomic, strong) NSArray *array;

@end

@implementation PKPlazaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    //初始化三个PKPlazaViewControllerABC
    _viewControllerA = [[PKPlazaViewControllerABC alloc] init];
    [_viewControllerA setABC:0];
    [_viewControllerA setArray:_array[0]];
    _viewControllerB = [[PKPlazaViewControllerABC alloc] init];
    [_viewControllerB setABC:1];
    [_viewControllerB setArray:_array[1]];
    _viewControllerC = [[PKPlazaViewControllerABC alloc] init];
    [_viewControllerC setABC:2];
    [_viewControllerC setArray:_array[2]];
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

//获取数据
- (void)setData {
    NSDictionary *dictionaryVoteLiju11 = @{@"name":@"原作者", @"name_color":[UIColor grayColor], @"content":@"Old Ana has a big house\nE-I-E-I-O"};
    NSDictionary *dictionaryVoteLiju12 = @{@"name":@"PK作者", @"name_color":[UIColor grayColor], @"content":@"Old Ana has a big house\nE-I-E-I-O\nOld Ana has a big house\nE-I-E-I-O", @"reason":@"happy"};
    NSDictionary *dictionaryVoteLiju1 = @{@"dictionary1":dictionaryVoteLiju11, @"dictionary2":dictionaryVoteLiju12, @"name":@"Ana", @"type":@"例句"};
    
    NSDictionary *dictionaryVoteLiju21 = @{@"name":@"原作者", @"name_color":[UIColor grayColor], @"content":@"我是一只小青龙"};
    NSDictionary *dictionaryVoteLiju22 = @{@"name":@"PK作者", @"name_color":[UIColor grayColor], @"content":@"天黑要下雨雷欧", @"reason":@"happy"};
    NSDictionary *dictionaryVoteLiju2 = @{@"dictionary1":dictionaryVoteLiju21, @"dictionary2":dictionaryVoteLiju22, @"name":@"？？？？", @"type":@"例句"};
    
    NSArray *arrayVoteLiju = @[dictionaryVoteLiju1, dictionaryVoteLiju2];
    
    NSDictionary *dictionaryVoteZhuji11 = @{@"name":@"原作者", @"name_color":[UIColor grayColor], @"content":@"Old Ana has a big house\nE-I-E-I-O", @"type": @"Magic"};
    NSDictionary *dictionaryVoteZhuji12 = @{@"name":@"PK作者", @"name_color":[UIColor grayColor], @"content":@"Old Ana has a big house\nE-I-E-I-O\nOld Ana has a big house\nE-I-E-I-O", @"reason":@"happy", @"type": @"Magic"};
    NSDictionary *dictionaryVoteZhuji1 = @{@"dictionary1":dictionaryVoteZhuji11, @"dictionary2":dictionaryVoteZhuji12, @"name":@"Ana", @"type":@"助记"};
    NSArray *arrayVoteZhuji = @[dictionaryVoteZhuji1];
    
    NSArray *arrayVote = @[arrayVoteLiju, arrayVoteZhuji];
    
    NSDictionary *dictionaryPK1Liju1 = @{@"name":@"Ana", @"name_color":[UIColor greenColor], @"content":@"Old Ana has a big house\nE-I-E-I-O", @"reason":@"NO WHY", @"date":@"now"};
    NSArray *arrayPK1Liju = @[dictionaryPK1Liju1];
    
    NSDictionary *dictionaryPK1Zhuji1 = @{@"name":@"Ana", @"name_color":[UIColor greenColor], @"type":@"Magic", @"content":@"Old Ana has a big house\nE-I-E-I-O", @"reason":@"NO WHY", @"date":@"now"};
    
    NSDictionary *dictionaryPK1Zhuji2 = @{@"name": @"she", @"type": @"语法", @"content": @"she：她（主语）；\nher：她，她的（宾格）；\nhers：她的（所有物）", @"reason": @"无PK理由", @"date": @"2018年08月07日", @"name_color": [UIColor greenColor]};
    
    NSArray *arrayPK1Zhuji = @[dictionaryPK1Zhuji1, dictionaryPK1Zhuji2];
    
    NSArray *arrayPK1 = @[arrayPK1Liju, arrayPK1Zhuji];
    
    NSDictionary *dictionaryPK2Liju1 = @{@"name":@"Ana", @"name_color":[UIColor greenColor], @"content":@"Old Ana has a big house\nE-I-E-I-O", @"reason":@"NO WHY", @"date":@"now"};
    NSArray *arrayPK2Liju = @[dictionaryPK2Liju1];
    
    NSDictionary *dictionaryPK2Zhuji1 = @{@"name":@"Ana", @"name_color":[UIColor greenColor], @"type":@"Magic", @"content":@"Old Ana has a big house\nE-I-E-I-O", @"reason":@"NO WHY", @"date":@"now"};
    NSArray *arrayPK2Zhuji = @[dictionaryPK2Zhuji1];
    
    NSArray *arrayPK2 = @[arrayPK2Liju, arrayPK2Zhuji];
    
    _array = @[arrayVote, arrayPK1, arrayPK2];
}

@end
