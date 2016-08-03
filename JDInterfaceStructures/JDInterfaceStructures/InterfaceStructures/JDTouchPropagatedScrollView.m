//
//  JDTouchPropagatedScrollView.m
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import "JDTouchPropagatedScrollView.h"

#import "JDConstant.h"

#define BAButtonStart   100

@interface JDTouchPropagatedScrollView ()

@property (weak, nonatomic) UIButton *previousButton;

@property (weak, nonatomic) UIView *lineView;

@property (nonatomic, assign) NSInteger buttonCount;
@end

@implementation JDTouchPropagatedScrollView

@synthesize selectedIndex, buttonCount;

- (BOOL)touchesShouldCancelInContentView:(UIView *)view
{
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame addItems:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame]) {
        // init code
        self.backgroundColor = JDMenu_backgroudColor;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.bounces = NO;
        
        CGFloat btnW;
        buttonCount = titleArray.count;
        if (JDMenu_width == 0) {
            btnW = (self.frame.size.width - JDMenu_button_pading * (buttonCount + 1)) / buttonCount;
        } else {
            btnW = JDMenu_width;
        }
        
        CGFloat x = JDMenu_button_pading;
        for (int i = 0; i < titleArray.count; i++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = [UIColor clearColor];
            x = (JDMenu_button_pading + btnW) * i + JDMenu_button_pading;
            [btn setFrame:CGRectMake(x, 0, btnW, JDMenu_height)];
            [btn setTitle:[titleArray objectAtIndex:i] forState:UIControlStateNormal];
            [btn setTitleColor:JDMenu_buttonTitle_normal forState:UIControlStateNormal];
            btn.tag = i + BAButtonStart;
            if(i==0)
            {
                [btn setTitleColor:JDMenu_buttonTitle_selected forState:UIControlStateNormal];
                btn.titleLabel.font = [UIFont systemFontOfSize:JDMenu_button_maxFont];
                self.previousButton = btn;
                
            }else
            {
                btn.titleLabel.font = [UIFont systemFontOfSize:JDMenu_button_minFont];
            }
            [btn addTarget:self action:@selector(actionbtn:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        
        if (JDMenu_width) {
            self.contentSize = CGSizeMake(x + JDMenu_width, JDMenu_height);
        }
        
        // 添加按钮的下划线
        CGRect rect = [self viewWithTag:selectedIndex + BAButtonStart].frame;
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(rect.origin.x, rect.size.height - 2, rect.size.width, 2)];
        lineView.backgroundColor = JDMenu_lineColor;
        [self addSubview:lineView];
        self.lineView = lineView;
    }
    
    return self;
}

#pragma mark - 私有方法
- (void)actionbtn:(UIButton *)btn
{
    if (selectedIndex != (btn.tag - BAButtonStart)) {
        [self selectIndex:btn.tag - BAButtonStart];
    }
    
}

#pragma mark - 公共方法
- (void)setLineOffsetWithPage:(NSInteger)page andRatio:(CGFloat)ratio {
    CGRect lineRC  = [self viewWithTag:page+BAButtonStart].frame;
    
    CGRect lineRC2  = [self viewWithTag:page+1+BAButtonStart].frame;
    
    float width = lineRC2.size.width;
    if (lineRC2.size.width < lineRC.size.width)
    {
        width =  lineRC.size.width - (lineRC.size.width-lineRC2.size.width)*ratio;
        
    }
    else if(lineRC2.size.width > lineRC.size.width)
    {
        width =  lineRC.size.width + (lineRC2.size.width-lineRC.size.width)*ratio;
    }
    float x = lineRC.origin.x + (lineRC2.origin.x - lineRC.origin.x)*ratio;
    
    self.lineView.frame = CGRectMake(x, lineRC.size.height - 2, width, 2);
}

- (void)selectIndex:(NSInteger)index {
    if (selectedIndex == index) return;
    
    selectedIndex = index;
    
    UIButton *button = (UIButton *)[self viewWithTag:selectedIndex + BAButtonStart];
    
    // 还原上一个按钮的状态
    self.previousButton.titleLabel.font = [UIFont systemFontOfSize:JDMenu_button_minFont];
    [self.previousButton setTitleColor:JDMenu_buttonTitle_normal forState:UIControlStateNormal];
    
    // 设置当前按钮的状态
    button.titleLabel.font = [UIFont systemFontOfSize:JDMenu_button_maxFont];
    [button setTitleColor:JDMenu_buttonTitle_selected forState:UIControlStateNormal];
    
    self.previousButton = button;
    
    // 改变按钮下划线
    CGRect rect = button.frame;
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.frame = CGRectMake(rect.origin.x, rect.size.height - 2, rect.size.width, 2);
    }];
    
    /* 判断是否滚动barView */
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    if (rect.origin.x - self.contentOffset.x > (screenW * 2 / 3)) { // 在右边
        NSInteger index = selectedIndex;
        if (selectedIndex + 2 < buttonCount) {
            index = selectedIndex + 2;
        } else if (selectedIndex + 1 < buttonCount) {
            index = selectedIndex + 1;
        }
        rect = [self viewWithTag:index + BAButtonStart].frame;
        
        [self scrollRectToVisible:rect animated:YES];
    } else if (rect.origin.x - self.contentOffset.x < (screenW / 3)) { // 在左边
        NSInteger index = selectedIndex;
        if (selectedIndex - 3 >= 0) {
            index = selectedIndex - 3;
        } else if (selectedIndex - 2 >= 0) {
            index = selectedIndex - 2;
        } else if (selectedIndex - 1 >= 0) {
            index = selectedIndex - 1;
        }
        
        rect = [self viewWithTag:index + BAButtonStart].frame;
        
        [self scrollRectToVisible:rect animated:YES];
    }
        
    if ([self.clickDelegate respondsToSelector:@selector(barSelectedIndexChanged:)]) {
        [self.clickDelegate barSelectedIndexChanged:selectedIndex];
    }
    
}

@end
