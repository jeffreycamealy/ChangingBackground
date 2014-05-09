//
//  BackgroundImage.m
//  ChangingBackground
//
//  Created by Siddharth Sukumar on 5/7/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "BackgroundView.h"
#import <QuartzCore/QuartzCore.h>


@interface BackgroundView ()
//@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageView;
//@property (nonatomic, strong) IBOutlet UIImageView *foregroundImageView;
@property CGFloat foregroundAlpha;

@end

@implementation BackgroundView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

     }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {

    self = [super initWithCoder:aDecoder];
    if (self){

        self.foregroundAlpha = 0;
    }
    return self;
    
}

/*

- (void) animatingTheForegroundImagewithImage : (UIImage *) image {

    self.foregroundImageView.image = image;

    CABasicAnimation *theAnimation;

    //within the animation we will adjust the "opacity"value of the layer

    //theAnimation=[CABasicAnimation animationWithKeyPath:@"foregroundAlpha"];
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=1.5;

    //changing the opacity (1=fully visible, 0=unvisible)
    
    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
    [self.foregroundImageView.layer addAnimation:theAnimation
                                                 forKey:@"animateOpacity"];

}
 */

- (void) animatingTheForegroundImage {



    CABasicAnimation *theAnimation;



    //within the animation we will adjust the "opacity"value of the layer

    //theAnimation=[CABasicAnimation animationWithKeyPath:@"foregroundAlpha"];
    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    theAnimation.duration=6;


    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
    [self.layer addAnimation:theAnimation
                                          forKey:@"opacity"];



}


- (void) drawRect:(CGRect)rect {

    [super drawRect:rect];
    
    [self.backgroundImage drawInRect:rect];
    [self.foregroundImage drawInRect:rect blendMode:0 alpha:self.foregroundAlpha];

}

//- (void) addSublayers {
//
//    self.layer.contents = (id) [UIImage imageNamed:@"green.png"].CGImage;
//
//    CALayer *sublayer = [CALayer layer];
//    [self.layer addSublayer:sublayer];
//
//    //    sublayer.contents = (id) [UIImage imageNamed:@"blue.png"].CGImage;
//
//    CABasicAnimation *theAnimation;
//
//    //   self.foregroundImage = image;
//
//
//    //within the animation we will adjust the "opacity"value of the layer
//
//    //theAnimation=[CABasicAnimation animationWithKeyPath:@"foregroundAlpha"];
//    theAnimation=[CABasicAnimation animationWithKeyPath:@"opacity"];
//    theAnimation.duration=6;
//
//
//    theAnimation.fromValue=[NSNumber numberWithFloat:0.0];
//    theAnimation.toValue=[NSNumber numberWithFloat:1.0];
//    [self.layer.sublayers.firstObject addAnimation:theAnimation
//                                            forKey:@"animateAlpha"];
//    
//    
//    
//}




@end
