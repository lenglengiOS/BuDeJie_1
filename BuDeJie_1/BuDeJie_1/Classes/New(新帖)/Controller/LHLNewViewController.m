//
//  LHLNewViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLNewViewController.h"

@implementation LHLNewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = LHLRadomColor
    [self setUpNavBar];
}

- (void)setUpNavBar
{
    // 左边的按钮
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWitnImage:[UIImage imageNamed:@"MainTagSubIcon"] heighlightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    // 中间的文字
    self.navigationItem.title = @"撸趣内涵";
}

@end
