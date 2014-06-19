//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *secondVCLabel;
@property (weak, nonatomic) IBOutlet UIButton *goBackButton;

@end

@implementation SecondViewController
@synthesize goBackButton;
@synthesize secondVCLabel;

CGRect labelRect;
CGRect buttonRect;

- (IBAction)goBackButtonPressed {
    [self simulatePop];
}

- (void)simulatePop {
    [UIView animateWithDuration:0.2f animations:^{
        goBackButton.center = CGPointMake(buttonRect.origin.x + 300, buttonRect.origin.y);
        secondVCLabel.center = CGPointMake(labelRect.origin.x + 300, labelRect.origin.y);
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Go To VC1" object:[UIImage imageNamed:@"green@2x.png"]];
        [self.navigationController popViewControllerAnimated:NO];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    buttonRect = goBackButton.frame;
    labelRect = secondVCLabel.frame;
    goBackButton.frame = CGRectMake(buttonRect.origin.x + 300, buttonRect.origin.y, buttonRect.size.width, buttonRect.size.height);
    secondVCLabel.frame = CGRectMake(labelRect.origin.x + 300, labelRect.origin.y, labelRect.size.width, labelRect.size.height);
}

- (void)changeBackground {
    UIImageView *oldImageView = [[UIImageView alloc] initWithImage:self.backgroundImage];
    UIImageView *newImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green@2x.png"]];
    [self.view insertSubview:oldImageView atIndex:0];
    [UIView animateWithDuration:2.0f animations:^{
        oldImageView.alpha = 0.0;
        newImageView.alpha = 1.0;
        [self.view insertSubview:newImageView atIndex:0];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.2f animations:^{
        goBackButton.frame = buttonRect;
        secondVCLabel.frame = labelRect;
    }];
    [self changeBackground];
}

@end
