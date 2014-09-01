//
//  SVGloble.h
//  SlideView
//
//  Created by Chen Yaoqiang on 13-12-27.
//  Copyright (c) 2013年 Chen Yaoqiang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ATGloble : NSObject

@property (nonatomic,assign) float globleWidth;
@property (nonatomic,assign) float globleHeight;
@property (nonatomic,assign) float globleAllHeight;

+ (ATGloble *)shareInstance;
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;

@end
