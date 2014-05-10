//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "BackgroundView.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomButton.h"

@interface SecondViewController()

@property (nonatomic, strong) IBOutlet BackgroundView *myView;
@property (strong, nonatomic) IBOutlet CustomButton *goBackButton;


@end


@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];

    self.myView.backgroundImage = [UIImage imageNamed:@"blue"];

    self.goBackButton.itIsTheFirstViewController  = NO;
    self.goBackButton.itIsTheSecondViewController = YES;

    // making the corners of the button round

    self.goBackButton.layer.cornerRadius = 10.0;
    self.goBackButton.clipsToBounds = YES;
    [self.goBackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.goBackButton.showsTouchWhenHighlighted = YES;


    // code for animating the foreground image

    [self.myView animatingTheForegroundImageWithImage:[UIImage imageNamed:@"green"]];
    
}

- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
