//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //[self backgroundFade];
}

- (IBAction)goBackButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)backgroundFade
{
    if ([_backgroundName isEqualToString:@"green"])
    {
        _backgroundName = @"blue";
    }
    else
    {
        _backgroundName = @"green";
    }
    
    
    UIImageView *backgroundImageBlue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue"]];
    UIImageView *backgroundImageGreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    [self.view addSubview:backgroundImageBlue];
    backgroundImageBlue.alpha = 0.0;
    [self.view sendSubviewToBack:backgroundImageBlue];
    [self.view addSubview:backgroundImageGreen];
    [self.view sendSubviewToBack:backgroundImageGreen];
    
    
    [UIImageView animateWithDuration:5.0 animations:^{
        backgroundImageBlue.alpha = 1;
    } completion:^(BOOL finished) {
        //[self.view removeFromSuperview];
    }];
}


@end
