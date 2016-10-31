//
//  LHLSubTagCell.m
//  BuDeJie_1
//
//  Created by admin on 16/10/31.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLSubTagCell.h"
#import "LHLSubTagItem.h"
#import <UIImageView+WebCache.h>
/*
 @property (nonatomic, copy) NSString *header; // 头像
 @property (nonatomic, copy) NSString *fans_count; // 关注人数
 @property (nonatomic, copy) NSString *screen_name; // 名字
 */

@interface LHLSubTagCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView; // 头像
@property (weak, nonatomic) IBOutlet UILabel *screenName; // 名字
@property (weak, nonatomic) IBOutlet UILabel *fansCount; // 关注人数

@end

@implementation LHLSubTagCell


- (void)setItem:(LHLSubTagItem *)item{
    _item = item;
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:item.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    self.screenName.text = item.screen_name;
    
    if ([item.fans_count intValue] >= 10000) {
        CGFloat count = [item.fans_count intValue] / 10000.0;
        self.fansCount.text = [NSString stringWithFormat:@"%.1f万人订阅", count];
    }else{
        self.fansCount.text = [NSString stringWithFormat:@"%@人订阅", item.fans_count];
    }
}

- (void)setFrame:(CGRect)frame
{
    frame.size.height -=1;
    [super setFrame:frame];
}

// 从xib加载就会调用一次
- (void)awakeFromNib {
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.width * 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
