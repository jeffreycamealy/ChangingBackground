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

@implementation FirstViewController

-(id)init {
  self = [super init];
  if (self) {
    self.backgroundImage = [UIImage imageNamed:@"blue"];
  }
  return self;
}


- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
