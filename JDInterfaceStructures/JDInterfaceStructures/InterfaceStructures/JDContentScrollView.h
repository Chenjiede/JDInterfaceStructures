//
//  JDContentScrollView.h
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BAScrollViewSubViewStart    100

@interface JDContentScrollView : UIScrollView

- (instancetype)initWithFrame:(CGRect)frame subviews:(NSArray *)subviews;

@end
