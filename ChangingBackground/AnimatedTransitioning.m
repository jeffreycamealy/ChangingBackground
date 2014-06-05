//
//  AnimatedTransitioning.m
//  ChangingBackground
//
//  Created by Christopher Gu on 6/5/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "AppDelegate.h"

static NSTimeInterval const AnimatedTransitionDuration = 0.5f;

@implementation AnimatedTransitioning


- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    [container addSubview:toViewController.view];
    
    if (self.reverse) {
        [UIView animateWithDuration:AnimatedTransitionDuration animations:^{
            toViewController.view.frame = CGRectMake(-320, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
            toViewController.view.frame = CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
            fromViewController.view.frame = CGRectMake(320, 0, fromViewController.view.frame.size.width, fromViewController.view.frame.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
            
            [UIView transitionWithView:appDelegate.window duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                appDelegate.window.backgroundColor = [UIColor colorWithPatternImage:appDelegate.blueBackground];
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
    else {
        [UIView animateWithDuration:AnimatedTransitionDuration animations:^{
            toViewController.view.frame = CGRectMake(320, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
            toViewController.view.frame = CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
            fromViewController.view.frame = CGRectMake(-320, 0, fromViewController.view.frame.size.width, fromViewController.view.frame.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:finished];
            
            [UIView transitionWithView:appDelegate.window duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                appDelegate.window.backgroundColor = [UIColor colorWithPatternImage:appDelegate.greenBackground];
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return AnimatedTransitionDuration;
}

@end