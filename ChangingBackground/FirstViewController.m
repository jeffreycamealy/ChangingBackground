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

@end

@implementation FirstViewController

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
