//
//  BackgroundNavigationViewController.m
//  ChangingBackground
//
//  Created by Matthew Voracek on 3/19/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundNavigationViewController.h"

@interface BackgroundNavigationViewController ()

@property NSString *backgroundName;

@end

@implementation BackgroundNavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _backgroundName = @"blue";
    /*
    UIImageView *backgroundImageBlue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue"]];
    [self.view addSubview:backgroundImageBlue];
    [self.view sendSubviewToBack:backgroundImageBlue];
     */
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIImageView *backgroundImageGreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    [self.view addSubview:backgroundImageGreen];
    backgroundImageGreen.alpha = 0.0;
    [self.view sendSubviewToBack:backgroundImageGreen];
    
    [UIImageView animateWithDuration:5.0 animations:^{
        backgroundImageGreen.alpha = 1;
    } completion:^(BOOL finished) {
        //[self.view removeFromSuperview];
    }];
}

@end
