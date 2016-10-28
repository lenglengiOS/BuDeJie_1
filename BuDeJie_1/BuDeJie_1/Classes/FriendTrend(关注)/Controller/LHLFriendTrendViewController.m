//
//  LHLFriendTrendViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLFriendTrendViewController.h"

@implementation LHLFriendTrendViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = LHLRadomColor
    [self setUpNavBar];
}

- (void)setUpNavBar
{
    // 左边的按钮
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWitnImage:[UIImage imageNamed:@"friendsRecommentIcon"] heighlightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:nil action:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    // 中间的文字
    self.navigationItem.title = @"我的关注";
}
@end
