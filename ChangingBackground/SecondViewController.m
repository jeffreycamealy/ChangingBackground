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

@interface SecondViewController()

@property (strong, nonatomic) IBOutlet BackgroundView *myView;
@property (strong, nonatomic) IBOutlet UIButton *goBackButton;

@end


@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {

      // making the corners of the button round

    self.goBackButton.layer.cornerRadius = 10.0;
    self.goBackButton.clipsToBounds = NO;

    [super viewWillAppear:YES];
    self.myView.backgroundImage = [UIImage imageNamed:@"blue@2x.png"];

    // code for animating the foreground image

    [self.myView animatingTheForegroundImagewithmage:[UIImage imageNamed:@"green@2x.png"]];
    
}




- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
