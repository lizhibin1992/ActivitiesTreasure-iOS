//
//  ATMainViewController.m
//  ActivitiesTreasure-iOS
//
//  Created by Terry on 14-8-27.
//  Copyright (c) 2014年 Terry. All rights reserved.
//

#import "ATMainViewController.h"

#import "ATActivitiesViewController.h"
#import "ATFoundViewController.h"
#import "ATContactListViewController.h"
#import "ATPersonalInformationViewController.h"
#import "UIImage+QQ.h"
#import "UINavigationItem+QQ.h"
#import "ATDock.h"
#import "ATGloble.h"

@interface ATMainViewController () <ATDockDelegate>
{
    ATDock *_dock;
    ATActivitiesViewController *_actities;
    //    NSArray *_allViewControllers; // 所有需要显示的控制器
}
@end

@implementation ATMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 0.创建所有的小控制器
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [ATGloble shareInstance].globleWidth = screenRect.size.width; //屏幕宽度
    [ATGloble shareInstance].globleHeight = screenRect.size.height - 20;  //屏幕高度（无顶栏）
    [ATGloble shareInstance].globleAllHeight = screenRect.size.height;  //屏幕高度（有顶栏）
    
    _actities = [[ATActivitiesViewController alloc] init];

//    [_actities.view setFrame:CGRectMake(0, 20, 100, 100)];
    
    ATFoundViewController *msg = [[ATFoundViewController alloc] init];
    ATPersonalInformationViewController *personalInformation = [[ATPersonalInformationViewController alloc] init];
    ATContactListViewController *contacts = [[ATContactListViewController alloc] init];
    
    // 当两个控制器互为父子关系的时候，它们的view一般也是互为父子关系
    //    self.childViewControllers
    // 通过addChildViewController方法，可以将控制器添加到childViewControllers数组中
    [self addChildViewController:_actities];
    [self addChildViewController:msg];
    [self addChildViewController:contacts];
    [self addChildViewController:personalInformation];
    
    // 1.添加底部的标签栏（Dock）
    ATDock *dock = [[ATDock alloc] init];
    CGFloat dockH = dockHH;
    CGFloat dockY = self.view.frame.size.height - dockHH;
    CGFloat dockW = self.view.frame.size.width;
    CGFloat dockX = 0;
    dock.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    dock.frame = CGRectMake(dockX, dockY, dockW, dockH);
    dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_bg.png"]];
    dock.delegate = self;
    [self.view addSubview:dock];
    _dock = dock;
    
    // 2.添加Dock上的4个按钮
    // 2.1.消息
    [_dock addDockItem:@"活动" icon:@"tab_recent_nor.png" selectedIcon:@"tab_recent_press.png"];
    // 2.2.联系人
    [_dock addDockItem:@"发现" icon:@"tab_buddy_nor.png" selectedIcon:@"tab_buddy_press.png"];
    // 2.3.动态
    [_dock addDockItem:@"我" icon:@"tab_qworld_nor.png" selectedIcon:@"tab_qworld_press.png"];
    // 2.4.设置
    [_dock addDockItem:@"通讯录" icon:@"tab_me_nor.png" selectedIcon:@"tab_me_press.png"];
    
    // 3.设置导航栏主题
    // 只要操作了appearance返回的对象，就相当于操作了整个项目中的UINavigationBar
    UINavigationBar *bar = [UINavigationBar appearance];
    //    UIImage *image = [UIImage imageNamed:@"titlebar_bg.png"];
    //
    //    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5  topCapHeight:image.size.height * 0.5];
    
    [bar setBackgroundImage:[UIImage resizedImage:@"titlebar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    [bar setTitleTextAttributes:@{
                                  UITextAttributeFont : [UIFont systemFontOfSize:12],
                                  UITextAttributeTextColor : [UIColor redColor]
                                  //UITextAttributeTextShadowColor : [UIColor blueColor],
                                  //UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(10, 10)]
                                  }];
}

#pragma mark - QQDock的代理方法
- (void)dock:(ATDock *)dock didSelectedFromIndex:(int)from toIndex:(int)to
{
    // 1.移除旧控制器的view
    UIViewController *oldVC = self.childViewControllers[from];
    [oldVC.view removeFromSuperview];
    
    // 2.添加新控制器的view
    UIViewController *newVC = self.childViewControllers[to];
    CGFloat viewW = self.view.frame.size.width;
    CGFloat viewH = self.view.frame.size.height - _dock.frame.size.height;
    newVC.view.frame = CGRectMake(0, 0, viewW, viewH);
    [self.view addSubview:newVC.view];
    
    // 3.将新控制器的navigationItem属性值 赋值 给 QQMainViewController
    [self.navigationItem copyFromOther:newVC.navigationItem];
    [UINavigationItem copyFrom:newVC.navigationItem to:self.navigationItem];
    
    //    self.navigationItem.rightBarButtonItem = newVC.navigationItem.rightBarButtonItem;
    //    self.navigationItem.rightBarButtonItems = newVC.navigationItem.rightBarButtonItems;
    //    self.navigationItem.leftBarButtonItem = newVC.navigationItem.leftBarButtonItem;
    //    self.navigationItem.leftBarButtonItems = newVC.navigationItem.leftBarButtonItems;
    //    self.navigationItem.title = newVC.navigationItem.title;
    //    self.navigationItem.titleView = newVC.navigationItem.titleView;
}
@end

