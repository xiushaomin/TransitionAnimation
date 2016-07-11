//
//  PresentAnimationHelper.m
//  TransitionAnimation
//
//  Created by MarkXiu on 16/7/11.
//  Copyright © 2016年 xsm. All rights reserved.
//

#import "PresentAnimationHelper.h"

@interface PresentAnimationHelper ()

@property (nonatomic ,assign) TansitionAnimationType type;

@end

@implementation PresentAnimationHelper

+ (instancetype)transitionAnimationType:(TansitionAnimationType)type {
    
    return [[self alloc] initWithTransitionAnimationType:type];
    
}

- (instancetype)initWithTransitionAnimationType:(TansitionAnimationType) type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    switch (_type) {
        case TansitionAnimationPresent:
           
            [self _doPresentAnimation:transitionContext];
            break;
        case TansitionAnimationDismiss:
            
            [self _doDismissAnimation:transitionContext];
            break;
        default:
            break;
    }
}

- (void) _doPresentAnimation:(id <UIViewControllerContextTransitioning>) transitionContext{
    
}

- (void) _doDismissAnimation:(id <UIViewControllerContextTransitioning>) transitionContext {
    
}
@end
