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
#import "LHLTabBar.h"
#import "LHLNavigationViewController.h"

@interface LHLTabBarController ()

@end

@implementation LHLTabBarController

// load方法只会调用一次
+ (void)load
{
    // 设置某个类中的 UITabBarItem 按钮的颜色
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体的尺寸:只有正常状态下设置才有效果
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}


#pragma mark - 初始化
- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.创建所有子控制器
    [self setUpAllChildControllers];
    
    // 2.2设置tabBar按钮的标题
    [self setUpAllTitles];
    
    // 3.使用自定义tabBar
    [self setUpTabBar];

}

#pragma mark - 自定义方法
- (void)setUpAllChildControllers
{
    // 2.1.设置tabBar的子控制器
    // 精华
    LHLEssenceViewController *essenceVC = [[LHLEssenceViewController alloc] init];
    LHLNavigationViewController *nav = [[LHLNavigationViewController alloc] initWithRootViewController:essenceVC];
    [self addChildViewController:nav];
    
    // 新帖
    LHLNewViewController *newVC = [[LHLNewViewController alloc] init];
    LHLNavigationViewController *nav1 = [[LHLNavigationViewController alloc] initWithRootViewController:newVC];
    [self addChildViewController:nav1];
    
    // 关注
    LHLFriendTrendViewController *trendVC = [[LHLFriendTrendViewController alloc] init];
    LHLNavigationViewController *nav3 = [[LHLNavigationViewController alloc] initWithRootViewController:trendVC];
    [self addChildViewController:nav3];
    
    // 我
    LHLMeViewController *meVC = [[LHLMeViewController alloc] init];
    LHLNavigationViewController *nav4 = [[LHLNavigationViewController alloc] initWithRootViewController:meVC];
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

    // 关注
    UINavigationController *nav3 = self.childViewControllers[2];
    [self setTitleButton:nav3 title:@"关注" image:@"tabBar_friendTrends_icon" selectImage:@"tabBar_friendTrends_click_icon"];
    
    // 我
    UINavigationController *nav4 = self.childViewControllers[3];
    [self setTitleButton:nav4 title:@"我" image:@"tabBar_me_icon" selectImage:@"tabBar_me_click_icon"];
}

- (void)setTitleButton:(UINavigationController *)nav title:(NSString *)aTitle image:(NSString *)aImage selectImage:(NSString *)aSelectImage
{
    nav.tabBarItem.title = aTitle;
    nav.tabBarItem.image = [UIImage imageRenderOriginalWithName:aImage];
    nav.tabBarItem.selectedImage = [UIImage imageRenderOriginalWithName:aSelectImage];
}

- (void)setUpTabBar
{
    LHLTabBar *tabBar = [[LHLTabBar alloc] init];
    // 利用KVC对系统的tabBar进行赋值: KVC的原理是通过访问属性进行赋值,不是通过setter方法进行赋值
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

@end










