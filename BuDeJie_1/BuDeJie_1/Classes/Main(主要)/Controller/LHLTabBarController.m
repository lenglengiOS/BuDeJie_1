//
//  LHLTabBarController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLTabBarController.h"
#import "LHLEssenceViewController.h"
#import "LHLFriendTrendViewController.h"
#import "LHLMeViewController.h"
#import "LHLNewViewController.h"
#import "LHLPublishViewController.h"

@interface LHLTabBarController ()

@end

@implementation LHLTabBarController

#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.创建所有子控制器
    [self setUpAllChildControllers];
    
    // 2.2设置tabBar按钮的标题
    [self setUpAllTitles];
    
}

#pragma mark - 自定义方法
- (void)setUpAllChildControllers
{
    // 2.1.设置tabBar的子控制器
    // 精华
    LHLEssenceViewController *essenceVC = [[LHLEssenceViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:essenceVC];
    [self addChildViewController:nav];
    
    // 新帖
    LHLNewViewController *newVC = [[LHLNewViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:newVC];
    [self addChildViewController:nav1];
    
    // 发布
    LHLPublishViewController *publicVC = [[LHLPublishViewController alloc] init];
    [self addChildViewController:publicVC];
    
    // 关注
    LHLFriendTrendViewController *trendVC = [[LHLFriendTrendViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:trendVC];
    [self addChildViewController:nav3];
    
    // 我
    LHLMeViewController *meVC = [[LHLMeViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:meVC];
    [self addChildViewController:nav4];
    
    

}

- (void)setUpAllTitles
{
    // 精华
    UINavigationController *nav = self.childViewControllers[0];
    [self setTitleButton:nav title:@"精华" image:@"tabBar_essence_icon" selectImage:@"tabBar_essence_click_icon"];
    
    // 新帖
    UINavigationController *nav1 = self.childViewControllers[1];
    [self setTitleButton:nav1 title:@"新帖" image:@"tabBar_new_icon" selectImage:@"tabBar_new_click_icon"];
    
    // 发布
    LHLPublishViewController *publish = self.childViewControllers[2];
    publish.tabBarItem.title = @"发布";
    publish.tabBarItem.image = [UIImage imageNamed:@"tabBar_publish_icon"];
    publish.tabBarItem.selectedImage = [UIImage imageNamed:@"tabBar_publish_click_icon"];
    
    // 关注
    UINavigationController *nav3 = self.childViewControllers[3];
    [self setTitleButton:nav3 title:@"关注" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    UINavigationController *nav4 = self.childViewControllers[4];
    [self setTitleButton:nav4 title:@"我" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
}

- (void)setTitleButton:(UINavigationController *)nav title:(NSString *)aTitle image:(NSString *)aImage selectImage:(NSString *)aSelectImage
{
    nav.tabBarItem.title = aTitle;
    nav.tabBarItem.image = [UIImage imageNamed:aImage];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:aSelectImage];
}

@end










