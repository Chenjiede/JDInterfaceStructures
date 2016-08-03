//
//  JDBaseInterFaceController.m
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import "JDBaseInterFaceController.h"

#import "JDTouchPropagatedScrollView.h"
#import "JDContentScrollView.h"
#import "JDConstant.h"

@interface JDBaseInterFaceController () <JDTouchPropagatedScrollViewDelegate, UIScrollViewDelegate>

@property (nonatomic, weak) JDTouchPropagatedScrollView *navScrollV;

@property (weak, nonatomic) UIScrollView *scrollV;
@end

@implementation JDBaseInterFaceController

@synthesize currentIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    
    [self setupNavScrollView];
    
    [self setupContentScrollView];
}

- (void)setupNavScrollView {
    JDTouchPropagatedScrollView *navScrollV = [[JDTouchPropagatedScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, JDMenu_height) addItems:self.titleArray];
    navScrollV.clickDelegate = self;
    
    [self.view addSubview:navScrollV];
    self.navScrollV = navScrollV;
}

- (void)setupContentScrollView {
    CGRect rect = self.navScrollV.frame;
    CGFloat y = rect.origin.y + rect.size.height;
    NSArray *subviews = [self createSubviews];
    JDContentScrollView *scrollV = [[JDContentScrollView alloc] initWithFrame:CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - y) subviews:subviews];
    scrollV.delegate = self;
    [self.view insertSubview:scrollV aboveSubview:_navScrollV];
    self.scrollV = scrollV;
}

- (void)currentIndexChange {
    
}

- (NSArray *)createSubviews {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < self.titleArray.count; i++ ) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
        [array addObject:view];
    }
    
    return array;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (currentIndex != self.navScrollV.selectedIndex)  return;
    
    NSInteger newIndex = (NSInteger)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    [self.navScrollV selectIndex:newIndex];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 记录滚动后的索引
    currentIndex = self.navScrollV.selectedIndex;
    
    [self currentIndexChange];
}

#pragma mark - TouchPropagatedScrollViewDelegate
- (void)barSelectedIndexChanged:(NSInteger)newIndex {
    [_scrollV scrollRectToVisible:CGRectMake(_scrollV.frame.size.width * newIndex, _scrollV.frame.origin.y, _scrollV.frame.size.width, _scrollV.frame.size.height) animated:YES];
}




@end
