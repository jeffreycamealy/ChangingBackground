//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
{
    IBOutlet UIButton *goForwardButton;
}
@end

@implementation FirstViewController

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor clearColor];
    goForwardButton.layer.cornerRadius = 5.0;
}

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    secondViewController.transitioningDelegate = self.transitioningDelegate;
    [self presentViewController:secondViewController animated:YES completion:nil];
}

@end
