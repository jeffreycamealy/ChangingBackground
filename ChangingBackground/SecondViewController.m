//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation SecondViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self updateBackgroundColor];
}


- (void)updateBackgroundColor {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    dispatch_block_t animationBlock = ^{
        delegate.backgroundImageView.image = [UIImage imageNamed:@"green"];
    };
    
    [UIView transitionWithView:delegate.backgroundImageView
                      duration:kColorChangingDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animationBlock
                    completion:nil];
}

- (IBAction)goBackButtonPressed {
    CATransition* transition = [CATransition animation];
    
    transition.duration = kPushAnimationDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popToRootViewControllerAnimated:NO];
}

@end
