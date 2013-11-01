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

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewDidAppear:(BOOL)animated {
	AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication]
											delegate];
	
	// If the background is green, transition to the blue image
	if ([delegate.bgImageView.image isEqual:[UIImage imageNamed:@"green.png"]]) {
		
		[UIView transitionWithView:delegate.bgImageView
						  duration:1.0f
						   options:UIViewAnimationOptionTransitionCrossDissolve
						animations:^{
							delegate.bgImageView.image =
							[UIImage imageNamed:@"blue.png"];
						}
						completion:NULL];
	}
}

- (IBAction)goForwardButtonPressed {
	SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
