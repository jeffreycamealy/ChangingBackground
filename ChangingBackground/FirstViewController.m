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

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IS_IPHONE5) {
        self.backgroundImageName = @"blue-568h";
    } else {
        self.backgroundImageName = @"blue";
    }
}

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
