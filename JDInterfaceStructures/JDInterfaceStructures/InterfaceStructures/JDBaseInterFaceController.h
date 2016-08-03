//
//  JDBaseInterFaceController.h
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDBaseInterFaceController : UIViewController

@property (nonatomic, assign, readonly) NSInteger currentIndex;

@property (strong, nonatomic) NSArray *titleArray;

- (NSArray *)createSubviews;

- (void)currentIndexChange;

@end
