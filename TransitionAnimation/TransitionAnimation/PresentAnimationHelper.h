//
//  PresentAnimationHelper.h
//  TransitionAnimation
//
//  Created by MarkXiu on 16/7/11.
//  Copyright © 2016年 xsm. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, TansitionAnimationType){
    TansitionAnimationPresent,
    TansitionAnimationDismiss
};
/**
 *  UIViewControllerTransitioningDelegate，需要返回一个实现了UIViewControllerAnimatedTransitioning协议对象。
 */
@interface PresentAnimationHelper : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionAnimationType:(TansitionAnimationType)type;

- (instancetype)initWithTransitionAnimationType:(TansitionAnimationType) type;

@end
