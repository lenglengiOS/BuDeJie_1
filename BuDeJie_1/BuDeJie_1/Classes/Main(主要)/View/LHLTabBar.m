//
//  LHLTabBar.m
//  BuDeJie_1
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLTabBar.h"

@interface LHLTabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@end

@implementation LHLTabBar

- (UIButton *)plusButton{
    if (_plusButton == nil) {
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [plusButton sizeToFit];
        [self addSubview:plusButton];
        _plusButton = plusButton;
    }
    return _plusButton;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 布局子控件
    NSInteger count = self.items.count + 1;
    CGFloat btnW = self.lhl_width / count;
    CGFloat btnH = self.lhl_height;
    
    NSInteger i = 0;
    for (UIButton *tabBarButton in self.subviews) {
        // 取出UITabBarButton
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            tabBarButton.frame = CGRectMake(btnW * i, 0, btnW, btnH);
            i++;
        }
        
    }
    // plusButton
    self.plusButton.center = CGPointMake(self.lhl_width * 0.5, self.frame.size.height * 0.5);
}

@end
