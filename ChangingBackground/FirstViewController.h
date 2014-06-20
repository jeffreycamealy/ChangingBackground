//
//  FirstViewController.h
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FirstViewControllerDelegate <NSObject>

@optional
- (void)segueToSecond;

@end

@interface FirstViewController : UIViewController

@property (nonatomic, weak) id<FirstViewControllerDelegate> delegate;

- (IBAction)goForwardButtonPressed;

@end
