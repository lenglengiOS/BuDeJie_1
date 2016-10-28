//
//  LHLMeViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLMeViewController.h"
#import "LHLSettingViewController.h"

@implementation LHLMeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = LHLRadomColor
    [self setUpNavBar];
}

- (void)setUpNavBar
{
    // 右边的按钮
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWitnImage:[UIImage imageNamed:@"mine-setting-icon"] heighlightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(setting:)];
    UIBarButtonItem *moonItem = [UIBarButtonItem itemWitnImage:[UIImage imageNamed:@"mine-moon-icon"] selectedImage:[UIImage imageNamed:@"mine-moon-icon-click"] target:self action:@selector(moon:)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem, moonItem];
    // 中间的文字
    self.navigationItem.title = @"我的";
}

- (void)setting:(UIButton *)button
{
    LHLSettingViewController *settingVC = [[LHLSettingViewController alloc] init];
    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}


- (void)moon:(UIButton *)button
{
    button.selected = !button.isSelected;
}

@end
