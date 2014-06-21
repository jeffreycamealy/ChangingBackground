//
//  BackgroundChangeTransition.m
//  ChangingBackground
//
//  Created by Stenio Ferreira on 6/18/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundChangeTransition.h"
#import "AppDelegate.h"

@implementation BackgroundChangeTransition


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIView *container = transitionContext.containerView;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    CGFloat containerWidth = container.frame.size.width;
    
    // Set the needed frames to animate.
    
    CGRect toInitialFrame = [container frame];
    CGRect fromDestinationFrame = fromView.frame;
    
    if ([self navigationControllerOperation] == UINavigationControllerOperationPush)
    {
        toInitialFrame.origin.x = containerWidth;
        toView.frame = toInitialFrame;
        fromDestinationFrame.origin.x = -containerWidth;
    }
    else if ([self navigationControllerOperation] == UINavigationControllerOperationPop)
    {
        toInitialFrame.origin.x = -containerWidth;
        toView.frame = toInitialFrame;
        fromDestinationFrame.origin.x = containerWidth;
    }
    
    // Create a screenshot of the toView.
    UIView *move = [toView snapshotViewAfterScreenUpdates:YES];
    move.frame = toView.frame;
    [container addSubview:move];
    
    UIGraphicsBeginImageContext(toView.frame.size); //added to prevent invalid context warning
        [toView drawViewHierarchyInRect:toView.bounds afterScreenUpdates:YES];
    UIGraphicsEndImageContext();
    
    move.layer.speed = 4;
    fromView.layer.speed = 4;
    
    [UIView animateWithDuration:2.0
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                            move.frame = container.frame;
                            fromView.frame = fromDestinationFrame;
                        }
                     completion:^(BOOL finished) {
                         if (![[container subviews] containsObject:toView])
                         {
                             [container addSubview:toView];
                         }
                         toView.frame = container.frame;
                         [fromView removeFromSuperview];
                         [move removeFromSuperview];
                         
                         [transitionContext completeTransition: YES];
                     }];
}

@end
