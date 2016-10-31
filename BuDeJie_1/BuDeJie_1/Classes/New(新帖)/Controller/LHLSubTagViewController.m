//
//  LHLSubTagViewController.m
//  BuDeJie_1
//
//  Created by admin on 16/10/30.
//  Copyright © 2016年 冷洪林. All rights reserved.
//

#import "LHLSubTagViewController.h"
#import "LHLSubTagItem.h"
#import "LHLSubTagCell.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface LHLSubTagViewController ()

@property (nonatomic, strong) NSArray *dataArray;
/** 网络情求管理者 */
@property (nonatomic, weak) AFHTTPSessionManager *manager;

@end

@implementation LHLSubTagViewController
static NSString * const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"推荐标签";
    // 加载网络请求
    [self loadData];
    
    // 注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"LHLSubTagCell" bundle:nil] forCellReuseIdentifier:ID];
    
    // 去除分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = LHLColor(220, 220, 221);
    
    // 请求指示器
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
}

- (void)loadData
{
    // 创建管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    _manager = manager;
    // 拼接参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"friend_recommend";
    parameters[@"appname"] = @"bs0315";
    parameters[@"asid"] = @"71CDD904-57E1-4CAB-8CDB-FDE25B572E02";
    parameters[@"c"] = @"user";
    parameters[@"client"] = @"iphone";
    parameters[@"device"] = @"iPhone%205";
    parameters[@"from"] = @"ios";
    parameters[@"last_coord"] = @"";
    parameters[@"last_flag"] = @"list";
    parameters[@"mac"] = @"";
    parameters[@"market"] = @"";
    parameters[@"openudid"] = @"c5a57443ae63c169be746d8b048865a364c78596";
    parameters[@"pre"] = @"50";
    parameters[@"t"] = @"1477882797";
    parameters[@"udid"] = @"";
    parameters[@"ver"] = @"";
    // 请求参数
        [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            _dataArray = [LHLSubTagItem mj_objectArrayWithKeyValuesArray:responseObject[@"top_list"]];
            [self.tableView reloadData];
            [SVProgressHUD dismiss];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@", error);
            [SVProgressHUD dismiss];
        }];
}

// view消失的时候 取消指示器 和 网络请求
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    
    [_manager.tasks makeObjectsPerformSelector:@selector(cancel)];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    LHLSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    LHLSubTagItem *item = self.dataArray[indexPath.row];
    cell.item = item;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}



@end
