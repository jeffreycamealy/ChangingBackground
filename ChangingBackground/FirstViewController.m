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
    
//    UIImage* backgroundImage = [UIImage imageNamed:@"blue.png"];
//    UIImageView* background = [[UIImageView alloc] initWithImage:backgroundImage];
//    
//    [self.view addSubview:background];
//    [self.view sendSubviewToBack:background];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    UIColor *newBackground = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"blue.png"]];
    
    if (window.backgroundColor != newBackground) {
        [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
            window.backgroundColor = newBackground;
        } completion:NULL];
    }
}

@end
