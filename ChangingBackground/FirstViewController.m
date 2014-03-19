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
//@property SecondViewController *secondViewController;

//@property UIImageView *backgroundImageGreen;

@end

@implementation FirstViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self backgroundFade];
}

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
    [self backgroundFade];
    //_backgroundImageGreen.alpha = 0.0;
}

- (void)backgroundFade
{
    if ([_backgroundName isEqualToString:@"blue"])
    {
        _backgroundName = @"green";
    }
    else
    {
        _backgroundName = @"blue";
    }
    
    UIImageView *backgroundImageBlue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue"]];
    UIImageView *backgroundImageGreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    [self.view addSubview:backgroundImageGreen];
    backgroundImageGreen.alpha = 0.0;
    [self.view sendSubviewToBack:backgroundImageGreen];
    [self.view addSubview:backgroundImageBlue];
    [self.view sendSubviewToBack:backgroundImageBlue];


    [UIImageView animateWithDuration:5.0 animations:^{
        backgroundImageGreen.alpha = 1;
    } completion:^(BOOL finished) {
        //[self.view removeFromSuperview];
    }];
}

@end
