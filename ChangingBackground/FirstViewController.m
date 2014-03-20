//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self updateBackgroundColor];
}


- (void)updateBackgroundColor {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    dispatch_block_t animationBlock = ^{
        delegate.backgroundImageView.image = [UIImage imageNamed:@"blue"];
    };
    
    [UIView transitionWithView:delegate.backgroundImageView
                      duration:kColorChangingDuration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animationBlock
                    completion:nil];
}

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    
    CATransition* transition = [CATransition animation];
    
    transition.duration = kPushAnimationDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:secondViewController animated:NO];
}

@end
