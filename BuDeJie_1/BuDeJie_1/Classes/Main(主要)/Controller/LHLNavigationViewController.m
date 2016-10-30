//
//  LHLNavigationViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLNavigationViewController.h"

@interface LHLNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation LHLNavigationViewController

+ (void)load
{
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    // 设置导航条字体
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:attr];
    
    // 设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) { // 非根控制器
        UIBarButtonItem *item = [UIBarButtonItem backItemWitnImage:[UIImage imageNamed:@"navigationButtonReturn"] heighlightImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
        viewController.navigationItem.leftBarButtonItem = item;
    }
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
    [self.view addGestureRecognizer:pan];
    
}
/*
 <UIScreenEdgePanGestureRecognizer: 0x7f7f98c97430;
 state = Possible; delaysTouchesBegan = YES;
 view = <UILayoutContainerView 0x7f7f98f19d00>;
 target= <(action=handleNavigationTransition:,
 target=<_UINavigationInteractiveTransition 0x7f7f98c96ee0>)>
 */

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end









