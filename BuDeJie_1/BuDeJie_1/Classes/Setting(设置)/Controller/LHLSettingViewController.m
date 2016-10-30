//
//  LHLSettingTableViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLSettingViewController.h"

@interface LHLSettingViewController ()

@end

@implementation LHLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = LHLRadomColor
    
    [self setUpNaBar];

}

- (void)setUpNaBar
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"更多" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)more
{
    UIViewController *VC = [[UIViewController alloc] init];
    VC.view.backgroundColor = LHLRadomColor
    [self.navigationController pushViewController:VC animated:YES];
}


@end










