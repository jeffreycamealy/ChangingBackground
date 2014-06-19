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

@end

@implementation FirstViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 2;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFade;
    [window.layer addAnimation:transition forKey:nil];
    window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue"]];
    
}


- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
