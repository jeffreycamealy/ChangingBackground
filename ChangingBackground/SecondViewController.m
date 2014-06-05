//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController 
{
    IBOutlet UIButton *goBackButton;
}

-(void)viewDidLoad
{
    self.view.backgroundColor = [UIColor clearColor];
    goBackButton.layer.cornerRadius = 5.0;
}

- (IBAction)goBackButtonPressed {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
