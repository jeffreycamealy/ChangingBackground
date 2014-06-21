//
//  GenericViewController.m
//  ChangingBackground
//
//  Created by Stenio Ferreira on 6/21/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "GenericViewController.h"

@interface GenericViewController ()

@property (strong, nonatomic) UIImage *backgroundImage;

@end

@implementation GenericViewController
{
    BOOL currentView; //in case user changes screen before animation, prevents background change
}

- (void)viewWillAppear:(BOOL)animated
{
    _backgroundImage = [UIImage imageNamed:_backgroundImageName];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    currentView = YES;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    //used separate thread to allow other graphic components to settle before changing background
    NSTimeInterval delayInSeconds = 0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        CATransition *transition = [CATransition animation];
        transition.duration = 1;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFade;
        [window.layer addAnimation:transition forKey:nil];
        if (currentView) {
            window.backgroundColor = [UIColor colorWithPatternImage:_backgroundImage];
        }
        });
         
}

- (void)viewWillDisappear:(BOOL)animated
{
    currentView = NO;
}


@end
