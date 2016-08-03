//
//  JDTouchPropagatedScrollView.h
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JDTouchPropagatedScrollViewDelegate <NSObject>

- (void)barSelectedIndexChanged:(NSInteger)newIndex;

@end

@interface JDTouchPropagatedScrollView : UIScrollView

@property (nonatomic, assign) NSInteger selectedIndex;

@property (weak, nonatomic) id<JDTouchPropagatedScrollViewDelegate> clickDelegate;

- (instancetype)initWithFrame:(CGRect)frame addItems:(NSArray *)titleArray;

- (void)selectIndex:(NSInteger)index;

//- (void)setLineOffsetWithPage:(NSInteger)page andRatio:(CGFloat)ratio;
@end
