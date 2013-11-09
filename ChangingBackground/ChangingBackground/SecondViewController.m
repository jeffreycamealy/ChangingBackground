//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController {
    
    __weak IBOutlet UIView *transitionBackgroundView;
}

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"green.png"]];
    transitionBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue.png"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [transitionBackgroundView setAlpha:1];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:1.0f animations:^{
        [transitionBackgroundView setAlpha:0];
    }];
}

- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
    [_delegate changeBackgoundColor];
}

@end
