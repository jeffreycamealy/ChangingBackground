//
//  FirstViewController.m
//  ChangingBackground
//
//  Created by Jeffrey Camealy on 4/15/13.
//  Copyright (c) 2013 Ora Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Constants.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    firstTime = YES;
   //  self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:BLUE_BACKGROUND]];
}


//***************************************************************
// used a fixed image here because its only 2 views but if there are more
//views with different backgorunds then i would have needed to pass some kind of
//parameter to identify the initial background to do the fade from
//***************************************************************
-(void)viewWillAppear:(BOOL)animated
{
    if (!firstTime) {
       // self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:GREEN_BACKGROUND]];
        [[self imgViewBackground] setImage:[UIImage imageNamed:GREEN_BACKGROUND]];
    }
    
}
- (void)viewDidAppear:(BOOL)animated
{
    if (firstTime) {
        firstTime = !firstTime;
    }
    else
    {
        //***************************************************************
        //Had to switch from background color to uiimageview because the
        //provided images wouldnt fit the screen on IOS7 or landscape
        //***************************************************************
        
      /*  self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:BLUE_BACKGROUND]];
        CATransition *transiton = [[CATransition alloc] init];
        transiton.duration = 2.0;
        [self.view.layer addAnimation:transiton forKey:@"Animation"];*/
        
        [[self imgViewBackground] setImage:[UIImage imageNamed:BLUE_BACKGROUND]];
        CATransition *transiton = [[CATransition alloc] init];
        transiton.duration = 2.0;
        [self.imgViewBackground.layer addAnimation:transiton forKey:@"Animation"];
    }
}

- (IBAction)goForwardButtonPressed {
    SecondViewController *secondViewController = SecondViewController.new;
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
