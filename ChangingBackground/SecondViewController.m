//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

-(id)init {
  self = [super init];
  if (self) {
    self.backgroundImage = [UIImage imageNamed:@"green"];
  }
  return self;
}



- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
