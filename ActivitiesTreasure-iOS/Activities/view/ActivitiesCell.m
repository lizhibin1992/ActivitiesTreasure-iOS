//
//  ActivitiesCell.m
//  ActivitiesTreasure-iOS
//
//  Created by Terry on 14-8-28.
//  Copyright (c) 2014年 Terry. All rights reserved.
//

#import "ActivitiesCell.h"

@implementation ActivitiesCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (instancetype)createCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"ActivitiesCell" owner:nil options:nil][0];
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
