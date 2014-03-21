//
//  BackgroundNavigationViewController.m
//  ChangingBackground
//
//  Created by Matthew Voracek on 3/19/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundNavigationViewController.h"

@interface BackgroundNavigationViewController ()

//@property NSString *backgroundNameShowing;
//@property NSString *backgroundNameHiding;

@property UIImageView *backgroundImageBlue;
@property UIImageView *backgroundImageGreen;
@property BOOL isBlueShowing;

@end

@implementation BackgroundNavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.delegate = self;
    
    _backgroundImageBlue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue"]];
    [self.view addSubview:_backgroundImageBlue];
    
    _backgroundImageGreen = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    [self.view addSubview:_backgroundImageGreen];
    _backgroundImageGreen.alpha = 0.0;
    [self.view sendSubviewToBack:_backgroundImageGreen];
    [self.view sendSubviewToBack:_backgroundImageBlue];
    _isBlueShowing = NO;
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (_isBlueShowing == YES)
    {
        [UIImageView animateWithDuration:5.0 animations:^{
            _backgroundImageGreen.alpha = 1;
        } completion:^(BOOL finished)
         {
             _backgroundImageBlue.alpha = 0.0;
             [self.view sendSubviewToBack:_backgroundImageGreen];
             _isBlueShowing = NO;
         }];
    }
    else
    {
        [UIImageView animateWithDuration:5.0 animations:^{
            _backgroundImageBlue.alpha = 1;
        } completion:^(BOOL finished)
         {
             _backgroundImageGreen.alpha = 0.0;
             [self.view sendSubviewToBack:_backgroundImageBlue];
             _isBlueShowing = YES;
         }];
    }
}

@end
