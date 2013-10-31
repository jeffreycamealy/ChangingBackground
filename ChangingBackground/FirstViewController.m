//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    
    UIImageView* blueBackground = [[window subviews] objectAtIndex:0];
    UIImageView* greenBackground = [[window subviews] objectAtIndex:1];
    
    if (blueBackground.alpha != 1.0) {
        [UIView animateWithDuration:1.5 delay:0.3 options:UIViewAnimationOptionTransitionNone animations:^{
            blueBackground.alpha = 0.8;
            greenBackground.alpha = 0.2;
        } completion:NULL];
    }
}

@end
