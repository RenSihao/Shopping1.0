//
//  LoadMore.h
//  团购
//
//  Created by mac-001 on 15/9/16.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

/*
 LoadMore类，有xib辅助
*/

#import <UIKit/UIKit.h>
@class LoadMore;

@protocol LoadMoreDelegate <NSObject>

- (void)loadOverDidLoad:(LoadMore *)loadMore;
@end

@interface LoadMore : UIView

@property (nonatomic, strong) id<LoadMoreDelegate> delegate;

+ (instancetype)loadMoreInit;
@end
