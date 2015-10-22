//
//  LoadMore.m
//  团购
//
//  Created by mac-001 on 15/9/16.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "LoadMore.h"
#import "ViewController.h"

@interface LoadMore ()

@property (weak, nonatomic) IBOutlet UIButton *loadMoreBtn;
@property (weak, nonatomic) IBOutlet UIView   *loadMoreView;
@end

@implementation LoadMore

#pragma mark - LoadMore类 接口部分
+ (instancetype)loadMoreInit
{
    return [[[NSBundle mainBundle] loadNibNamed:@"LoadMore" owner:nil options:nil] lastObject];
}

#pragma mark - 实现部分
//鼠标点击加载更多触发事件
- (IBAction)loadMoreClick:(UIButton *)sender
{
    self.loadMoreBtn.hidden  = YES;
    self.loadMoreView.hidden = NO;
    
    [self performSelector:@selector(loadOver) withObject:nil afterDelay:2];
    
}

#pragma mark - 遵循LoadMoreDelegate协议
- (void)loadOver
{
    self.loadMoreBtn.hidden  = NO;
    self.loadMoreView.hidden = YES;
    if([self.delegate respondsToSelector:@selector(loadOverDidLoad:)])
        [self.delegate loadOverDidLoad:self];
}
@end
