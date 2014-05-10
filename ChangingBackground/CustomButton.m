//
//  CustomButton.m
//  ChangingBackground
//
//  Created by Siddharth Sukumar on 5/8/14.
//  Copyright (c) 2014 Ora Interactive. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];


}

- (void) drawRect:(CGRect)rect {

    [super drawRect:rect];
    if (self.highlighted){

        //// Color Declarations
        UIColor* color2 = [UIColor colorWithRed: 0 green: 0.629 blue: 1 alpha: 1];

        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rect];
        [color2 setFill];
        [rectanglePath fill];


        //// Text Drawing
        CGRect textRect = CGRectMake(64, 53, 102, 12);
        {
            NSString* textContent;

            if (self.itIsTheFirstViewController) {
             textContent = @"Go Forward";
                
            } else if (self.itIsTheSecondViewController){
                textContent = @"Go Back";


            }
            NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
            textStyle.alignment = NSTextAlignmentCenter;

            NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Arial-BoldMT" size: UIFont.systemFontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};

            [textContent drawInRect: CGRectOffset(textRect, 0, (CGRectGetHeight(textRect) - [textContent boundingRectWithSize: textRect.size options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height) / 2) withAttributes: textFontAttributes];

            
        }


    }
}
@end
