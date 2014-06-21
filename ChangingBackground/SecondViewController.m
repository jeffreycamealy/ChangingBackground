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


- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IS_IPHONE5) {
        self.backgroundImageName = @"green-568h";
    } else {
        self.backgroundImageName = @"green";
    }
}

- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
