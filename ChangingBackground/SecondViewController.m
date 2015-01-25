//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"


@implementation SecondViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated {
	AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]
											delegate];
	
	// Transition to the green background
	[UIView transitionWithView:delegate.bgImageView
					  duration:1.0f
					   options:UIViewAnimationOptionTransitionCrossDissolve
					animations:^{
						delegate.bgImageView.image =
						[UIImage imageNamed:@"green.png"];
					}
					completion:NULL];
}

- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
