//
//  MKPresentedController.m
//  TransitionAnimation
//
//  Created by MarkXiu on 16/7/11.
//  Copyright © 2016年 xsm. All rights reserved.
//
#import "PresentAnimationHelper.h"
#import "MKPresentedController.h"

@interface MKPresentedController () <UIViewControllerTransitioningDelegate>

@end

@implementation MKPresentedController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = (CGRect) {0, 0, 100, 100};
    button.backgroundColor = [UIColor blueColor];
    button.center = CGPointMake(self.view.center.x, self.view.center.y / 2);
    button.userInteractionEnabled = YES;
    self.view.userInteractionEnabled = YES;
    [button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self.view bringSubviewToFront:button];
}

- (void)clicked{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [PresentAnimationHelper transitionAnimationType:TansitionAnimationPresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [PresentAnimationHelper transitionAnimationType:TansitionAnimationDismiss];
    
}

/*
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    
}
*/

@end
