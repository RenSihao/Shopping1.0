//
//  GroupBuyInfoTableViewCell.m
//  团购
//
//  Created by mac-001 on 15/9/15.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "GroupBuyInfoTableViewCell.h"
#import "GroupBuyInfo.h"

@interface GroupBuyInfoTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel     *titleView;
@property (weak, nonatomic) IBOutlet UILabel     *priceView;
@property (weak, nonatomic) IBOutlet UILabel     *buyCountView;
@end



@implementation GroupBuyInfoTableViewCell

#pragma mark - GroupBuyInfoTableViewCell类 接口部分
+ (instancetype) groupBuyInfoTableViewCellWithTableView:(UITableView *)table
{
    static NSString *ID             = @"GroupBuyInfo";
    GroupBuyInfoTableViewCell *cell = [table dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GroupBuyInfoTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
+ (instancetype) groupBuyInfoTableViewCellWithInfo:(GroupBuyInfo *)groupBuyInfo TableView:(UITableView *)table
{
    GroupBuyInfoTableViewCell *cell = [self groupBuyInfoTableViewCellWithTableView:table];
    cell.groupBuyInfo = groupBuyInfo;
    return cell;
}

#pragma mark - 重写set GroupBuyInfo 数据源方法
-(void)setGroupBuyInfo:(GroupBuyInfo *)groupBuyInfo
{
    _iconView.image    = [UIImage imageNamed:groupBuyInfo.icon];
    _iconView.frame    = CGRectMake(10, 10, 140, 80);
    _titleView.text    = groupBuyInfo.title;
    _priceView.text    = [NSString stringWithFormat:@"💰%@",groupBuyInfo.price];
    _buyCountView.text = [NSString stringWithFormat:@"%@人已购买", groupBuyInfo.buyCount ];
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
