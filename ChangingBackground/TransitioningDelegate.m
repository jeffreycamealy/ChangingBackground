//
//  TransitioningDelegate.m
//  ChangingBackground
//
//  Created by Christopher Gu on 6/5/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "TransitioningDelegate.h"
#import "AnimatedTransitioning.h"


@implementation TransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    AnimatedTransitioning *transitioning = [AnimatedTransitioning new];
    return transitioning;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    AnimatedTransitioning *transitioning = [AnimatedTransitioning new];
    transitioning.reverse = YES;
    return transitioning;
}

@end
