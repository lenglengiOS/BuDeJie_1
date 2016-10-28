//
//  UIBarButtonItem+item.h
//  BuDeJie_1
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)

+ (UIBarButtonItem *)itemWitnImage:(UIImage *)aImage heighlightImage:(UIImage *)aSelectImage target:(id)aTarget action:(SEL)aAction;

+ (UIBarButtonItem *)itemWitnImage:(UIImage *)aImage selectedImage:(UIImage *)aSelectImage target:(id)aTarget action:(SEL)aAction;

+ (UIBarButtonItem *)backItemWitnImage:(UIImage *)aImage heighlightImage:(UIImage *)aSelectImage target:(id)aTarget action:(SEL)aAction title:(NSString *)aTitle;
@end
