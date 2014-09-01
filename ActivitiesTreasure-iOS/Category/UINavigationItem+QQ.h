//
//  UINavigationItem+QQ.h
//  01-QQ
//
//  Created by apple on 13-12-13.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (QQ)
- (void)copyFromOther:(UINavigationItem *)other;
+ (void)copyFrom:(UINavigationItem *)from to:(UINavigationItem *)to;
@end
