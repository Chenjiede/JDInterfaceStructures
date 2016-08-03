//
//  JDConstant.h
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/8/1.
//  Copyright © 2016年 BA. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 菜单按钮视图的背景色 */
#define JDMenu_backgroudColor       [UIColor blackColor]

/** 菜单按钮文字普通状态的颜色 */
#define JDMenu_buttonTitle_normal       [UIColor grayColor]

/** 菜单按钮文字选中状态的颜色 */
#define JDMenu_buttonTitle_selected       [UIColor whiteColor]

/** 菜单按钮下划线的颜色 */
#define JDMenu_lineColor       [UIColor whiteColor]

/** 菜单按钮视图的高度 */
extern const CGFloat JDMenu_height;

/** 菜单按钮视图的宽度 */
extern const CGFloat JDMenu_width; // 默认是根据按钮个数来计算宽度，如果更改了其值，就是使用该值

/** 菜单按钮的按钮间距 */
extern const CGFloat JDMenu_button_pading;

/** 菜单按钮的最小字体size */
extern const CGFloat JDMenu_button_minFont;

/** 菜单按钮的最大字体size */
extern const CGFloat JDMenu_button_maxFont;

