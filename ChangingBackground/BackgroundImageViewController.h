//
//  BackgroundImageViewController.h
//  ChangingBackground
//
//  Created by Brock Boland on 6/29/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundImageViewController : UIViewController

/**
 * Get the image to display behind the view controller
 *
 * @return Image to use in the background
 */
-(UIImage*)backgroundImage;

@end
