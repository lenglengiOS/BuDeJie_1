//
//  UIView+Frame.m
//  BuDeJie_1
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setLhl_width:(CGFloat)lhl_width
{
    CGRect rect = self.frame;
    lhl_width = rect.size.width;
    self.frame = rect;
}

- (CGFloat)lhl_width
{
    return self.frame.size.width;
}

- (void)setLhl_height:(CGFloat)lhl_height
{
    CGRect rect = self.frame;
    lhl_height = rect.size.height;
    self.frame = rect;
}

- (CGFloat)lhl_height
{
    return self.frame.size.height;
}

- (void)setLhl_x:(CGFloat)lhl_x
{
    CGRect rect = self.frame;
    lhl_x = rect.origin.x;
    self.frame = rect;
}

- (CGFloat)lhl_x
{
    return self.frame.origin.x;
}

- (void)setLhl_y:(CGFloat)lhl_y
{
    CGRect rect = self.frame;
    lhl_y = rect.origin.y;
    self.frame = rect;
}

- (CGFloat)lhl_y
{
    return self.frame.origin.y;
}

@end







