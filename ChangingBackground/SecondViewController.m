//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

<<<<<<< HEAD

-(void)viewDidAppear:(BOOL)animated{
    
    [UIView animateWithDuration:0.5 animations:^{
        for (UIImageView* backGround in [[[UIApplication sharedApplication] keyWindow] subviews]
             ) {
            if ([backGround isMemberOfClass:([UIImageView class])]) {
                backGround.alpha = 0.0;
            }
            
        }
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            for (UIImageView* backGround in [[[UIApplication sharedApplication] keyWindow] subviews]
                 ) {
                if ([backGround isMemberOfClass:([UIImageView class])]) {
                    backGround.image = [UIImage imageNamed:@"green"];
                    backGround.alpha = 1.0;
                }
                
            }
        }];
    }];
}

=======
>>>>>>> 9f533f8176d1813d633bdf824033d972d70ea3d2
- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
