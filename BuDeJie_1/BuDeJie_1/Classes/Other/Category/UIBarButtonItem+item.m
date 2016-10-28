//
//  UIBarButtonItem+item.m
//  BuDeJie_1
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)
+ (UIBarButtonItem *)itemWitnImage:(UIImage *)aImage heighlightImage:(UIImage *)aSelectImage target:(id)aTarget action:(SEL)aAction
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:aImage forState:UIControlStateNormal];
    [btn setImage:aSelectImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    // 添加的代码
    UIView *itemView = [[UIView alloc] initWithFrame:btn.bounds];
    [itemView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:itemView];
}

+ (UIBarButtonItem *)itemWitnImage:(UIImage *)aImage selectedImage:(UIImage *)aSelectImage target:(id)aTarget action:(SEL)aAction
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:aImage forState:UIControlStateNormal];
    [btn setImage:aSelectImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    UIView *containerView = [[UIView alloc] initWithFrame:btn.bounds];
    [containerView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:containerView];
}

+ (UIBarButtonItem *)backItemWitnImage:(UIImage *)aImage heighlightImage:(UIImage *)aSelectImage target:(id)aTarget action:(SEL)aAction title:(NSString *)aTitle
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:aImage forState:UIControlStateNormal];
    [btn setImage:aSelectImage forState:UIControlStateHighlighted];
    [btn setTitle:aTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [btn sizeToFit];
    [btn addTarget:aTarget action:aAction forControlEvents:UIControlEventTouchUpInside];
    UIView *containerView = [[UIView alloc] initWithFrame:btn.bounds];
    [containerView addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:containerView];
}



@end
