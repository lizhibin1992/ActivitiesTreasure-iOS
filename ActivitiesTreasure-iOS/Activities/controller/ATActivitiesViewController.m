//
//  QQSettingViewController.m
//  01-QQ
//
//  Created by apple on 13-12-13.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ATActivitiesViewController.h"
#import "ATMyActivitiesController.h"
#import "ATFocusActivitiesController.h"
#import "ATNearbyActivitiesController.h"
#import "ATTopScrollView.h"
#import "ATRootScrollView.h"
#define pCount 4
@interface ATActivitiesViewController ()
@end

@implementation ATActivitiesViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"活动";
    UIImageView *topShadowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 5)];
    [topShadowImageView setImage:[UIImage imageNamed:@"top_background_shadow.png"]];
    [self.view addSubview:topShadowImageView];
    
    ATTopScrollView *topScrollView = [ATTopScrollView shareInstance];
    ATRootScrollView *rootScrollView = [ATRootScrollView shareInstance];
//    rootScrollView.contentSize = CGSizeMake(rootScrollView.frame.size.width, 0);
    topScrollView.nameArray = @[@"我的活动", @"我关注的活动", @"附近的活动"];
    rootScrollView.viewNameArray = @[[ATMyActivitiesController sharedController], [ATFocusActivitiesController sharedController], [ATNearbyActivitiesController sharedController]];
    
    
//    NSLog(@"%@",rootScrollView.frame);
    
    [self.view addSubview:topScrollView];
    [self.view addSubview:rootScrollView];
    
    [topScrollView initWithNameButtons];
    [rootScrollView initWithViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
