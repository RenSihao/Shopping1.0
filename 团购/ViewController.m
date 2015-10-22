//
//  ViewController.m
//  团购
//
//  Created by mac-001 on 15/9/15.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "ViewController.h"
#import "GroupBuyInfo.h"
#import "GroupBuyInfoTableViewCell.h"
#import "LoadMore.h"
#import "HeaderScrollView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, LoadMoreDelegate>

@property (nonatomic, strong) UITableView        *table;
@property (nonatomic, strong) NSMutableArray     *groupBuyPlist;
@end

@implementation ViewController

#pragma mark - 延迟加载

- (UITableView *)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _table.separatorStyle = UITableViewCellStyleValue1;
        _table.dataSource = self;
        _table.delegate = self;
        [self.view addSubview:_table];
    }
    return _table;
}
- (NSMutableArray *)groupBuyPlist
{
    if(!_groupBuyPlist)
    {
        _groupBuyPlist = [GroupBuyInfo groupBuyInfoPlist];
    }
    return _groupBuyPlist;
}

#pragma mark - 遵循UITableViewDataSource协议

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupBuyPlist.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    GroupBuyInfoTableViewCell *cell = [GroupBuyInfoTableViewCell groupBuyInfoTableViewCellWithInfo:self.groupBuyPlist[indexPath.row] TableView:tableView];
    return cell;
}

#pragma mark - 遵循UITableViewDelegate协议

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
#pragma mark - 遵循LoadMoreDelegate协议
- (void) loadOverDidLoad:(LoadMore *)loadMore
{
    GroupBuyInfoTableViewCell *newCell = self.groupBuyPlist[0];
    
    [self.groupBuyPlist addObject:newCell];
    
    NSIndexPath *path = [NSIndexPath indexPathForRow:self.groupBuyPlist.count-1 inSection:0];
    [self.table insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - 程序启动加载

- (void)viewDidLoad {
    [super viewDidLoad];
    [self table];
    [self groupBuyPlist];
    LoadMore *loadMore = [LoadMore loadMoreInit];
    loadMore.delegate = self;
    self.table.tableFooterView = loadMore;
    HeaderScrollView *headerScrollView = [HeaderScrollView headerScrollViewInit];
    self.table.tableHeaderView = headerScrollView;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
