//
//  UINavigationItem+QQ.m
//  01-QQ
//
//  Created by apple on 13-12-13.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UINavigationItem+QQ.h"

@implementation UINavigationItem (QQ)
- (void)copyFromOther:(UINavigationItem *)other
{
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.title = other.title;
    self.titleView = other.titleView;
}

+ (void)copyFrom:(UINavigationItem *)from to:(UINavigationItem *)to
{
    [to copyFromOther:from];
}
@end
