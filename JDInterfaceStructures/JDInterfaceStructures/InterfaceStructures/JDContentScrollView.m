//
//  JDContentScrollView.m
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import "JDContentScrollView.h"

@implementation JDContentScrollView

- (instancetype)initWithFrame:(CGRect)frame subviews:(NSArray *)subviews {
    if (self = [super initWithFrame:frame]) {
        // init code
        [self setPagingEnabled:YES];
        [self setBounces:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        
        int i = 0;
        for (UIView *view in subviews) {
            view.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
            
            [self addSubview:view];
            i++;
        }
        
        [self setContentSize:CGSizeMake(frame.size.width * subviews.count, frame.size.height)];
    }
    
    return self;
}

@end
