//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

- (IBAction)goBackButtonPressed {
    if ([self.delegate respondsToSelector:@selector(segueToFirst)]) {
        [self.delegate segueToFirst];
    }
}

@end
