//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.backgroundImage = [UIImage imageNamed:@"green.png"];
    }
    
    return self;
}


- (IBAction)goBackButtonPressed
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
