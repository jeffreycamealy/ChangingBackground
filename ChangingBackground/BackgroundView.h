//
//  BackgroundImage.h
//  ChangingBackground
//
//  Created by Siddharth Sukumar on 5/7/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundView : UIView

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImage *foregroundImage;


- (void) animatingTheForegroundImagewithmage : (UIImage *) image;


/*


 @property CGFloat *foregroundAlpha; // private

 - (void)setForegroundAlphaTo:(CGFloat)alpha animated:(BOOL)animated;
 
 */

@end
