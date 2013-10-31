//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
//    UIImage* backgroundImage = [UIImage imageNamed:@"green.png"];
//    UIImageView* background = [[UIImageView alloc] initWithImage:backgroundImage];
//
//    [self.view addSubview:background];
//    [self.view sendSubviewToBack:background]
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    UIImageView* blueBackground = [[window subviews] objectAtIndex:0];
    UIImageView* greenBackground = [[window subviews] objectAtIndex:1];
    
    [UIView animateWithDuration:1.5 delay:0.3 options:UIViewAnimationOptionTransitionNone animations:^{
        blueBackground.alpha = 0.2;
        greenBackground.alpha = 0.8;
    } completion:NULL];
    
    
//    UIColor *newBackground = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"green.png"]];
//    
//    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionTransitionNone animations:^{
//        window.backgroundColor = newBackground;
//    } completion:NULL];
}

@end
