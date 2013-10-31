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
    UIImage* backgroundImage = [UIImage imageNamed:@"blue.png"];
    UIImageView* background = [[UIImageView alloc] initWithImage:backgroundImage];
    
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}


@end
