//
//  MyNavigationController.h
//  ChangingBackground
//
//  Created by Calvin Hildreth on 5/7/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationController : UINavigationController
@property (strong, nonatomic) UIImageView *imageView;

-(void)backgroundCheck;
-(void)changeBackgroundWithImageNamed:(NSString *)imageName;
@end
