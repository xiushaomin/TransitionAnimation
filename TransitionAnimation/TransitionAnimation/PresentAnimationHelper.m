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
    //拿到fromViewVc 也就是presentViewController
    UIViewController *fromViewVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //拿到toViewController 也就是presentedController
    UIViewController *toViewVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //截屏present.view做动画的view
    UIView *animationView = [fromViewVc.view snapshotViewAfterScreenUpdates:NO];
    animationView.frame = fromViewVc.view.frame;
    fromViewVc.view.hidden = YES;
    //需要做动画 必须加到这个容器的view
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:animationView];
    [containerView addSubview:toViewVc.view];
    
    toViewVc.view.frame = (CGRect) {0 , containerView.frame.size.height, containerView.frame.size.width, 300};
    //开始动画了
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1.0/0.55 options:0 animations:^{
        
        toViewVc.view.transform = CGAffineTransformMakeTranslation(0, - 300);
        animationView.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
        if ([transitionContext transitionWasCancelled]) {
            fromViewVc.view.hidden = NO;
            [animationView removeFromSuperview];
        }
         
        
    }];
}

- (void)_doDismissAnimation:(id <UIViewControllerContextTransitioning>) transitionContext {
    //fromView = presentedViewController
    UIViewController *fromViewVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    NSArray *subviewsArray = containerView.subviews;
    UIView *animationView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //还原
        fromViewVc.view.transform = CGAffineTransformIdentity;
        animationView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
       
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            toViewVc.view.hidden = NO;
            [animationView removeFromSuperview];
        }
       
    }];
    
    
}
@end
