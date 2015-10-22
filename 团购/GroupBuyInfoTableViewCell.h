//
//  GroupBuyInfoTableViewCell.h
//  团购
//
//  Created by mac-001 on 15/9/15.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

/*
GroupBuyInfoTableViewCell类，有xib辅助
*/
#import <UIKit/UIKit.h>
#import "LoadMore.h"
@class GroupBuyInfo;

@interface GroupBuyInfoTableViewCell : UITableViewCell

@property (nonatomic, strong) GroupBuyInfo *groupBuyInfo;


+ (instancetype) groupBuyInfoTableViewCellWithTableView:(UITableView *)table;
+ (instancetype) groupBuyInfoTableViewCellWithInfo:(GroupBuyInfo *)groupBuyInfo TableView:(UITableView *)table;
@end
