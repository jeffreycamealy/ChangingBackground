//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"





@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp2ndViewControllerElements];
}

- (IBAction)goBackButtonPressed {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popToRootViewControllerAnimated:NO];

}

- (void)setUp2ndViewControllerElements {
    _goBackButton.layer.cornerRadius = 5.0f;
    _goBackButton.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [UIView transitionWithView:delegate.background duration:2.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        delegate.background.image = [UIImage imageNamed:@"green"];
    } completion:^(BOOL finished) {
    }];
}
@end
