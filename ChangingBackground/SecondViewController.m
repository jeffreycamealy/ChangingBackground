//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"

@implementation SecondViewController

- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)viewWillAppear:(BOOL)animated
{
     [[self imgViewBackground] setImage:[UIImage imageNamed:BLUE_BACKGROUND]];
}
- (void)viewDidAppear:(BOOL)animated
{
    [[self imgViewBackground] setImage:[UIImage imageNamed:GREEN_BACKGROUND]];
    CATransition *transiton = [[CATransition alloc] init];
    transiton.duration = 2.0;
    [self.view.layer addAnimation:transiton forKey:@"Animation"];
}


@end
