//
//  GroupBuyInfo.m
//  团购
//
//  Created by mac-001 on 15/9/15.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "GroupBuyInfo.h"

@implementation GroupBuyInfo
- (GroupBuyInfo *)initWithDictionary:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (GroupBuyInfo *)groupBuyInfoWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}
+ (NSMutableArray *)groupBuyInfoPlist
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]];
    NSMutableArray *modeArray = [NSMutableArray array];
    for(NSDictionary *dict in array)
    {
        GroupBuyInfo *groupBuyInfo = [GroupBuyInfo groupBuyInfoWithDictionary:dict];
        [modeArray addObject:groupBuyInfo];
    }
    return modeArray;
}
@end
