//
//  LHLAdViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/30.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLAdViewController.h"
#import "LHLAdItem.h"
#import "LHLTabBarController.h"
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJExtension/MJExtension.h>
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface LHLAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, weak) UIImageView *adImageView;
@property (nonatomic, strong) LHLAdItem *item;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation LHLAdViewController

// 点击了跳过按钮
- (IBAction)clickJumpBtn:(id)sender {

    // 切换窗口的根控制器
    LHLTabBarController *tabBarVC = [[LHLTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
    // 销毁定时器
    [_timer invalidate];
}
#pragma mark - adImageView懒加载
- (UIImageView *)adImageView
{
    if (_adImageView == nil) {
        UIImageView *adImageView = [[UIImageView alloc] init];
        [self.containerView addSubview:adImageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [adImageView addGestureRecognizer:tap];
        adImageView.userInteractionEnabled = YES;
        _adImageView = adImageView;
    }
    return _adImageView;
}

- (void)tap
{
    // 跳转到广告连接
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:[NSURL URLWithString:_item.ori_curl]]) {
        [app openURL:[NSURL URLWithString:_item.ori_curl]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置启动图片
    [self setUpLanuchImage];
    
    // 请求广告数据
    [self loadAdData];
    
    // 创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(time) userInfo:nil repeats:YES];

}


- (void)time
{
    static int i = 3;
    if (i == 0) {
        [self clickJumpBtn:nil];
    }
    
    i--;
    self.jumpBtn.titleLabel.text = [NSString stringWithFormat:@"跳过 (%ld)", (long)i];
}

- (void)loadAdData
{
    // 1.创建回话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    // 3.发送请求
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        _item = [LHLAdItem mj_objectWithKeyValues:adDict];
        
        // 设置广告图片
        CGFloat h = LHLScreenW / _item.w * _item.h;
        self.adImageView.frame = CGRectMake(0, 0, LHLScreenW, h);
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:_item.w_picurl]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

- (void)setUpLanuchImage
{
    if (iPhone6P) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }else if (iPhone6){
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }
    else if (iPhone5){
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
    }
    else if (iPhone4){
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage"];
    }
}

@end

















