//
//  headerScrollView.m
//  团购
//
//  Created by mac-001 on 15/9/16.
//  Copyright (c) 2015年 mac-001. All rights reserved.
//

#import "HeaderScrollView.h"
#define ADS_COUNT 5
#define SCROLL_WIDTH 375
#define SCROLL_HEIGHT 667/4

@interface HeaderScrollView () <UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView  *scrollView;
@property (nonatomic, strong) NSTimer       *timer;
@end

@implementation HeaderScrollView

#pragma mark - HeaderScrollView 接口部分
//覆盖HeaderScrollView 对象方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self pageControl];
        [self scrollView];
        [self startTimer];
    }
    return self;
}
//提供HeaderScrollView 类方法
+ (instancetype)headerScrollViewInit
{
    return [[HeaderScrollView alloc] initWithFrame:
            CGRectMake(0, 0, SCROLL_WIDTH, SCROLL_HEIGHT)];
}

#pragma mark - HeaderScrollView 所有子控件延迟加载
- (UIPageControl *)pageControl
{
    if(!_pageControl)
    {
        _pageControl = [[UIPageControl alloc] initWithFrame:
                        CGRectMake(0, 0, SCROLL_WIDTH/2, SCROLL_HEIGHT/10)];
        _pageControl.center = CGPointMake(SCROLL_WIDTH/2, SCROLL_HEIGHT/10*9);
        _pageControl.numberOfPages = ADS_COUNT;
        _pageControl.currentPage   = 0;
        [_pageControl bringSubviewToFront:self.scrollView];
        [self addSubview:_pageControl];
    }
    return _pageControl;
}
- (UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCROLL_WIDTH, SCROLL_HEIGHT)];
        for(int i=0; i<ADS_COUNT; i++)
        {
            UIImage *ad = [UIImage imageWithContentsOfFile:
                           [[NSBundle mainBundle] pathForResource:
                    [NSString stringWithFormat:@"img_%02d", i+1] ofType:@"png"]];
            UIImageView *iv = [[UIImageView alloc] initWithImage:ad];
            iv.frame        = CGRectMake(i*SCROLL_WIDTH, 0, SCROLL_WIDTH,SCROLL_HEIGHT);
            [self.scrollView addSubview:iv];
        }
        _scrollView.contentSize = CGSizeMake(SCROLL_WIDTH*ADS_COUNT, SCROLL_HEIGHT);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled                  = YES;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

#pragma mark - 遵循UIScrollViewDelegate协议
//鼠标开始抓取
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}
//鼠标结束抓取
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

#pragma mark - 定时器函数部分
//启动定时器
- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(scrollAds) userInfo:nil repeats:YES];
}
//定时器滚动图片
- (void)scrollAds
{
    long page                    = self.pageControl.currentPage;
    self.pageControl.currentPage = (page + 1) % ADS_COUNT;
    [self.scrollView setContentOffset:CGPointMake(self.pageControl.currentPage*SCROLL_WIDTH, 0) animated:YES];
}
@end
