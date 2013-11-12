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



@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp1stViewControllerElements];

}

- (IBAction)goForwardButtonPressed {

    SecondViewController *secondViewController = SecondViewController.new;
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:secondViewController animated:NO];
}

- (void)setUp1stViewControllerElements {
    _goForwardButton.layer.cornerRadius = 10.0f;
    _goForwardButton.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    [UIView transitionWithView:delegate.background duration:2.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{

        delegate.background.image = [UIImage imageNamed:@"blue"];
    } completion:^(BOOL finished) {
    }];
}
@end
