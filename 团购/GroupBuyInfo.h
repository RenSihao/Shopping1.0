//
//  GroupBuyInfo.h
//  团购
//
//  Created by mac-001 on 15/9/15.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuyInfo : NSObject

@property (nonatomic, copy) NSString *buyCount;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;

- (GroupBuyInfo *)initWithDictionary:(NSDictionary *)dict;
+ (GroupBuyInfo *)groupBuyInfoWithDictionary:(NSDictionary *)dict;
+ (NSMutableArray *)groupBuyInfoPlist;
@end
