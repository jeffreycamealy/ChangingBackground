//
//  SecondViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "SecondViewController.h"
#import "BackgroundView.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomButton.h"

@interface SecondViewController()

@property (nonatomic, strong) IBOutlet BackgroundView *myView;
@property (strong, nonatomic) IBOutlet CustomButton *goBackButton;


@end


@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:YES];

    self.myView.backgroundImage = [UIImage imageNamed:@"blue.png"];

      // making the corners of the button round

    self.goBackButton.itIsTheFirstViewController  = NO;
    self.goBackButton.itIsTheSecondViewController = YES;

    self.goBackButton.layer.cornerRadius = 10.0;
    self.goBackButton.clipsToBounds = YES;
    [self.goBackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
     self.goBackButton.showsTouchWhenHighlighted = YES;


    // code for animating the foreground image
    [self.myView animatingTheForegroundImagewithImage:[UIImage imageNamed:@"green.png"]];
    
}

// method is used to change the background color of the button when highlighted

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}






- (IBAction)goBackButtonPressed {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
