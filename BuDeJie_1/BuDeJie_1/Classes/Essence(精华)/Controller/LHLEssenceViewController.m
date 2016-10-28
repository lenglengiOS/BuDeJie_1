//
//  LHLEssenceViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLEssenceViewController.h"

@implementation LHLEssenceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置导航条按钮
    [self setUpNavBar];
    
}

- (void)setUpNavBar
{
    // 左边的按钮
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWitnImage:[UIImage imageNamed:@"nav_item_game_icon"] heighlightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 右边的按钮
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWitnImage:[UIImage imageNamed:@"navigationButtonRandom"] heighlightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 中间的文字
    self.navigationItem.title = @"撸趣内涵";
    
}



- (void)game
{
    NSLog(@"%s", __func__);
}


@end
