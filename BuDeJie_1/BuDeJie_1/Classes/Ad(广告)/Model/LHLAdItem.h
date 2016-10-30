//
//  LHLAdItem.h
//  BuDeJie_1
//
//  Created by admin on 16/10/30.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHLAdItem : NSObject

/** 广告图片的连接 */
@property (nonatomic, copy) NSString *w_picurl;
/** 点击进入广告页面 */
@property (nonatomic, copy) NSString *ori_curl;

@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;

@end
