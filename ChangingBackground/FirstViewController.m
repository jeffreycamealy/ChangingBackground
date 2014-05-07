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

@property (weak, nonatomic) IBOutlet UIButton *goForwardButton;
@property (weak, nonatomic) IBOutlet UILabel *viewControllerLabel;


@end

@implementation FirstViewController


-(void)viewWillAppear:(BOOL)animated
{
    [UIView animateWithDuration:.25 animations:^{
        self.viewControllerLabel.alpha = 1.0;
        self.goForwardButton.alpha = 1.0;
    } completion:^(BOOL finished) {
    }];
}

-(void)viewDidAppear:(BOOL)animated
{
    
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
                    backGround.image = [UIImage imageNamed:@"blue"];
                    backGround.alpha = 1.0;
                }
                
            }
        }];
    }];
    
    
}

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    secondViewController.view.backgroundColor = [UIColor clearColor];
    [UIView animateWithDuration:.25 animations:^{
        self.viewControllerLabel.alpha = 0.0;
        self.goForwardButton.alpha = 0.0;
    } completion:^(BOOL finished) {
    }];
    [self.navigationController pushViewController:secondViewController animated:YES];
}
@end
