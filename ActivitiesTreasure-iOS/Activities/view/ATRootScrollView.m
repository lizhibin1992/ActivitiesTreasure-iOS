//
//  SVRootScrollView.m
//  SlideView
//
//  Created by Chen Yaoqiang on 13-12-27.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import "ATRootScrollView.h"
#import "ATFocusActivitiesController.h"
#import "ATNearbyActivitiesController.h"
#import "ATMyActivitiesController.h"
#import "ATGloble.h"
#import "ATTopScrollView.h"

#define POSITIONID (int)(scrollView.contentOffset.x/320)

@implementation ATRootScrollView

@synthesize viewNameArray;

+ (ATRootScrollView *)shareInstance {
    static ATRootScrollView *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance=[[self alloc] initWithFrame:CGRectMake(0, menuHeight + IOS7_STATUS_BAR_HEGHT + menuHeight, 320, [ATGloble shareInstance].globleHeight- menuHeight - menuHeight - dockHH)];
        _instance.contentSize = CGSizeMake(320, 0);
    });
    
    return _instance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        self.backgroundColor = [UIColor grayColor];
        self.pagingEnabled = YES;
        self.userInteractionEnabled = YES;
        self.bounces = NO;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        userContentOffsetX = 0;
    }
    return self;
}

- (void)initWithViews
{
    for (int i = 0; i < [viewNameArray count]; i++) {
        UITableViewController *vieww = viewNameArray[i];
        vieww.view.frame = CGRectMake(0+320*i, [ATGloble shareInstance].globleHeight, 320, [ATGloble shareInstance].globleHeight - menuHeight - dockHH);
        
        [self addSubview:vieww.view];
        
        
    }
    self.contentSize = CGSizeMake(320*[viewNameArray count], [ATGloble shareInstance].globleHeight- menuHeight - menuHeight - dockHH);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    userContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (userContentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //调整顶部滑条按钮状态
    [self adjustTopScrollViewButton:scrollView];
    
    [self loadData];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self loadData];
}

-(void)loadData
{
    CGFloat pagewidth = self.frame.size.width;
    int page = floor((self.contentOffset.x - pagewidth/viewNameArray.count)/pagewidth)+1;
    UILabel *label = (UILabel *)[self viewWithTag:page+200];
    label.text = [NSString stringWithFormat:@"%@",[viewNameArray objectAtIndex:page]];
}

//滚动后修改顶部滚动条
- (void)adjustTopScrollViewButton:(UIScrollView *)scrollView
{
    [[ATTopScrollView shareInstance] setButtonUnSelect];
    [ATTopScrollView shareInstance].scrollViewSelectedChannelID = POSITIONID+100;
    [[ATTopScrollView shareInstance] setButtonSelect];
    [[ATTopScrollView shareInstance] setScrollViewContentOffset];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
