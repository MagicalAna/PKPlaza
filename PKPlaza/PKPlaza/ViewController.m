//
//  ViewController.m
//  PKPlaza
//
//  Created by Yuan Ana on 2018/8/3.
//  Copyright © 2018 Yuan Ana. All rights reserved.
//

#import "ViewController.h"
#import "PKPlazaViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"GO" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)Click:(id)sender {
    [self.navigationController pushViewController:PKPlazaViewController.new animated:NO];
}


@end
