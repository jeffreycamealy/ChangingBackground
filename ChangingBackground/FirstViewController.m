//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "BackgroundView.h"
#import "CustomButton.h"

@interface FirstViewController ()
@property (strong, nonatomic) IBOutlet BackgroundView *myView;
@property (strong, nonatomic) IBOutlet CustomButton *goForwardButton;


@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];

    self.myView.backgroundImage = [UIImage imageNamed:@"green"];

    self.goForwardButton.itIsTheFirstViewController  = YES;
    self.goForwardButton.itIsTheSecondViewController = NO;

    // making the corners of the button round

    self.goForwardButton.layer.cornerRadius = 10.0;
    self.goForwardButton.clipsToBounds = YES;
    self.goForwardButton.showsTouchWhenHighlighted = YES;
    [self.goForwardButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

    [self.myView animatingTheForegroundImageWithImage:[UIImage imageNamed:@"blue"]];
    
}


- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];

}

@end

