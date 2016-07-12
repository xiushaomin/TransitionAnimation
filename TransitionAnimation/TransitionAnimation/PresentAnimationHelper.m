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
    UIViewController *fromViewVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *animationView = [fromViewVc.view snapshotViewAfterScreenUpdates:NO];
    animationView.frame = fromViewVc.view.frame;
    fromViewVc.view.hidden = YES;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:animationView];
    [containerView addSubview:toViewVc.view];
    
    toViewVc.view.frame = (CGRect) {0 , containerView.frame.size.height, containerView.frame.size.width, 300};
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1.0/0.55 options:0 animations:^{
        
        toViewVc.view.transform = CGAffineTransformMakeTranslation(0, - 300);
        animationView.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
        /*
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        if ([transitionContext transitionWasCancelled]) {
            fromViewVc.view.hidden = NO;
            [animationView removeFromSuperview];
        }
         */
        
    }];
}

- (void) _doDismissAnimation:(id <UIViewControllerContextTransitioning>) transitionContext {
    
}
@end
