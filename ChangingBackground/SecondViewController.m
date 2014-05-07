//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "BackgroundView.h"

@interface SecondViewController()

@property (strong, nonatomic) IBOutlet BackgroundView *myView;

@end


@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];
    self.myView.backgroundImage = [UIImage imageNamed:@"green@2x.png"];

    
    
}




- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
