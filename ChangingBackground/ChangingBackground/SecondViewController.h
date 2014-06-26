//
//  SecondViewController.h
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeBackgroundColorDelegate.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) id <ChangeBackgroundColorDelegate> delegate;

- (IBAction)goBackButtonPressed;

@end
