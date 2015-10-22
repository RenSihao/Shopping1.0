//
//  headerScrollView.h
//  团购
//
//  Created by mac-001 on 15/9/16.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//
/*
 HeaderScrollView类，没有xib辅助
*/
#import <UIKit/UIKit.h>
@class HeaderScrollView;

@protocol HeaderScrollViewDelegate <NSObject>

@end

@interface HeaderScrollView : UIView

+ (instancetype)headerScrollViewInit;
@end
