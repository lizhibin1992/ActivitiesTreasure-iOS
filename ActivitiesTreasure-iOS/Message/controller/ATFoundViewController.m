//
//  QQMessageViewController.m
//  01-QQ
//
//  Created by apple on 13-12-13.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ATFoundViewController.h"
#import "ATTestViewController.h"
#import "FriendCell.h"
@interface ATFoundViewController ()
{
    NSArray *_array;

}
@end

@implementation ATFoundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"消息";
    
    _array = [NSArray arrayWithObjects:@"活动圈",@"附近的人",@"待出", nil];
}
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

#pragma mark 每一行显示怎样的cell（内容）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.定义一个标识
    static NSString *ID = @"cell";
    
    // 2.去缓存池中取出可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 3.如果缓存中没有可循环利用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"parent = %@, nav = %@", self.parentViewController, self.navigationController);
    ATTestViewController *test = [[ATTestViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}

@end
