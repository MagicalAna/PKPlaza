//
//  PKPlazaViewControllerVote.m
//  PKPlaza
//
//  Created by Yuan Ana on 2018/8/6.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "PKPlazaViewControllerVote.h"
#import "PKPlazaViewControllerCell.h"

@interface PKPlazaViewControllerVote ()

@property (nonatomic, strong) NSDictionary *dictionary1;
@property (nonatomic, strong) NSDictionary *dictionary2;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) PKPlazaViewControllerCell *viewControllerCell1;
@property (nonatomic, strong) PKPlazaViewControllerCell *viewControllerCell2;

@end

@implementation PKPlazaViewControllerVote

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    //标题
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, self.view.bounds.size.width / 2, 17)];
    labelTitle.text = [[NSString alloc] initWithFormat:@"%@的%@", _name, _type];
    [self.view addSubview:labelTitle];
    //倒计时
    
    //viewControllerCell1
    _viewControllerCell1 = [[PKPlazaViewControllerCell alloc] init];
    [_viewControllerCell1 setDictionary:_dictionary1];
    CGSize size1 = _viewControllerCell1.view.bounds.size;
    _viewControllerCell1.view.frame = (CGRect){{0, 17}, size1};
    [self.view addSubview:_viewControllerCell1.view];
    //viewControllerCell2
    _viewControllerCell2 = [[PKPlazaViewControllerCell alloc] init];
    [_viewControllerCell2 setDictionary:_dictionary2];
    CGSize size2 = _viewControllerCell2.view.bounds.size;
    _viewControllerCell2.view.frame = (CGRect){{0, 17 + size1.height}, size2};
    [self.view addSubview:_viewControllerCell2.view];
    //self.view
    CGSize size = self.view.bounds.size;
    size.height = _viewControllerCell2.view.frame.origin.y + _viewControllerCell2.view.frame.size.height;
}

- (void)setData {
    _dictionary1 = @{@"name":@"原作者", @"name_color":[UIColor grayColor], @"content":@"Old Ana has a big house\nE-I-E-I-O"};
    _dictionary2 = @{@"name":@"PK作者", @"name_color":[UIColor grayColor], @"content":@"Old Ana has a big house\nE-I-E-I-O\nOld Ana has a big house\nE-I-E-I-O", @"reason":@"PK理由：happy"};
    _name = @"Ana";
    _type = @"助记";
}

@end
