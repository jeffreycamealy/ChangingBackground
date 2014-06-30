//
//  PushAnimator.m
//  ChangingBackground
//
//  Created by Brock Boland on 6/29/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "PushAnimator.h"

@implementation PushAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return 0.5;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
  UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  [[transitionContext containerView] addSubview:toViewController.view];

  CGRect targetFrameForNewController = toViewController.view.frame;
  CGFloat targetXForOldController = 0;

  if (self.reverse) {
    // Going backwards: popping a view off
    // Move the "to" controller offscreen to the left to animate from there
    toViewController.view.frame = CGRectMake(-toViewController.view.frame.size.width, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
    // Move the old one to the right
    targetXForOldController = fromViewController.view.frame.size.width;
  }
  else {
    // Going forwards: pushing a view on
    // Move the "to" controller offscreen to the right to animate from there
    toViewController.view.frame = CGRectMake(toViewController.view.frame.size.width, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height);
    // Move the old one to the left
    targetXForOldController = -fromViewController.view.frame.size.width;
  }


  [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
    // Move the old VC off either left or right
    fromViewController.view.transform = CGAffineTransformMakeTranslation(targetXForOldController, 0);
    // Move the new VC to the middle
    toViewController.view.frame = targetFrameForNewController;
  } completion:^(BOOL finished) {
    fromViewController.view.transform = CGAffineTransformIdentity;
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];

  }];
}

@end
