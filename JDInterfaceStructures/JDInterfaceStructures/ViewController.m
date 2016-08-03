//
//  ViewController.m
//  JDInterfaceStructures
//
//  Created by JKDP01 on 16/7/30.
//  Copyright © 2016年 BA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.titleArray = @[@"试1", @"2", @"测试3", @"测试4", @"测试测", @"测试6", @"测试7", @"测试8", @"测试9", @"测试10"];
//    self.titleArray = @[@"测试1", @"测试2", @"测试3"];
}

/** 
 *  实现该方法，可以设置每个标题对应的视图，数组索引对应标题数组索引
 */
//- (NSArray *)createSubviews {
//    
//}

@end
