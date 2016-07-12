//
//  MKPresentViewController.m
//  TransitionAnimation
//
//  Created by MarkXiu on 16/7/11.
//  Copyright © 2016年 xsm. All rights reserved.
//
#import "MKPresentedController.h"
#import "MKPresentViewController.h"

@interface MKPresentViewController ()

@end

@implementation MKPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = (CGRect) {0, 0, 100, 100};
    button.backgroundColor = [UIColor redColor];
       button.center = self.view.center;
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)click{
    MKPresentedController *vc = [[MKPresentedController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
