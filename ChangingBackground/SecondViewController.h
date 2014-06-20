//
//  SecondViewController.h
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

@optional
- (void)segueToFirst;

@end

@interface SecondViewController : UIViewController

@property (nonatomic, weak) id<SecondViewControllerDelegate> delegate;

- (IBAction)goBackButtonPressed;

@end
