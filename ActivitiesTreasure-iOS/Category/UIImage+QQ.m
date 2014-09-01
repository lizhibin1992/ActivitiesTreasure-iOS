//
//  UIImage+QQ.m
//  01-QQ
//
//  Created by apple on 13-12-13.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UIImage+QQ.h"

@implementation UIImage (QQ)
+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5  topCapHeight:image.size.height * 0.5];
}
@end
