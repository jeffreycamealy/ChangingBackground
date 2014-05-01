//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "UINavigationController+CustomTransition.h"

@implementation SecondViewController

- (IBAction)goBackButtonPressed {
    //Using the customTransiton method from UINavigationController's CustomTransition category
    [self.navigationController popViewControllerWithCustomTansition];
    [APPDELEGATE fadeFromGreenToBlueImage];
}

@end
