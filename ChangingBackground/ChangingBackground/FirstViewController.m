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

@implementation FirstViewController {
    SecondViewController            *secondViewController;
    __weak IBOutlet UIView          *transitionBackgroundView;
}

- (void)viewDidLoad {
    secondViewController = [[SecondViewController alloc] init];
    secondViewController.delegate = self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue.png"]];
    transitionBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green.png"]];
    [transitionBackgroundView setAlpha:0];
}

#pragma mark ChangeBackgroundColorDelegate
- (void)changeBackgoundColor {
    [transitionBackgroundView setAlpha:1];
    [UIView animateWithDuration:1.0f animations:^{
        [transitionBackgroundView setAlpha:0];
    }];
}

- (IBAction)goForwardButtonPressed {
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
