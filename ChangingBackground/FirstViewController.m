//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
//    UIImage* backgroundImage = [UIImage imageNamed:@"blue.png"];
//    UIImageView* background = [[UIImageView alloc] initWithImage:backgroundImage];
//    
//    [self.view addSubview:background];
//    [self.view sendSubviewToBack:background];
}

@end
