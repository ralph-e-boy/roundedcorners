//
//  BubbleView.m
//  RoundedCorners
//
//  Created by Ralph Seaman on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BubbleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = FALSE;
    }
    return self;
}


-(id) initWithFrame:(CGRect)frame text:(NSString *) atext pointsleft:(BOOL ) isLeftPointedArrow {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = FALSE;
        text = atext;
        leftarrow = isLeftPointedArrow;
        self.layer.masksToBounds = FALSE;
    }
    return self;
    
}


 - (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [[UIColor whiteColor] setStroke];
    [[UIColor darkGrayColor ] setFill];
 
    // tweak this shit if you want
    CGFloat borderRadius = 40.0;
    CGFloat strokeWidth = 4.0;
    CGFloat margin=0.08;
    CGFloat arrowLength = 30; // beware, too long and it may go outside the view of the box!
    CGFloat arrowWidth = 15;
    
    // this is the box inset from the view that actually contains the bubble rectangle
    CGRect boxRect = CGRectInset(self.bounds, self.frame.size.width*margin,(self.frame.size.height)*margin);
  
 
    // this could be parameterized
    [[UIColor whiteColor] setStroke];

    
    // create bubble path
    UIBezierPath* bubblePath = [UIBezierPath bezierPath];

    
    bubblePath.lineWidth = strokeWidth;

    
    // starting at the top left, drawing point by point, move to first point
    [bubblePath moveToPoint:CGPointMake(boxRect.origin.x, boxRect.origin.y+borderRadius)];

    // upper left curve
    [bubblePath addQuadCurveToPoint:CGPointMake(bubblePath.currentPoint.x+borderRadius, boxRect.origin.y) controlPoint:CGPointMake(boxRect.origin.x, boxRect.origin.y)];
    
    // moving right to top right curve point
    [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x +boxRect.size.width-(borderRadius*2) ,bubblePath.currentPoint.y)];
    
    // first arc
    [bubblePath addQuadCurveToPoint:CGPointMake(bubblePath.currentPoint.x+borderRadius, bubblePath.currentPoint.y+borderRadius) controlPoint:CGPointMake(bubblePath.currentPoint.x+borderRadius , bubblePath.currentPoint.y)];
    
    // now down the right side
    [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x, bubblePath.currentPoint.y+boxRect.size.height-arrowLength-(borderRadius*2 ))];
    

    // bottom right curve
    [bubblePath addQuadCurveToPoint:CGPointMake(bubblePath.currentPoint.x-borderRadius, bubblePath.currentPoint.y+borderRadius) controlPoint:CGPointMake(bubblePath.currentPoint.x, bubblePath.currentPoint.y+borderRadius)];
     
    
     /// chose pointer style
         
    if(leftarrow){ 
        
        // move over left to where arrow drops
        [bubblePath addLineToPoint:CGPointMake(boxRect.origin.x + (boxRect.size.width*margin) + borderRadius + arrowWidth , bubblePath.currentPoint.y)];
        
        // drop down ....
        [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x-arrowWidth, bubblePath.currentPoint.y+arrowLength)];
        
        // then back up...
         [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x, bubblePath.currentPoint.y-arrowLength)];
 
        
    } else {
    
        // move over left to where arrow drops
        [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x- boxRect.size.width*margin, bubblePath.currentPoint.y)];
    
        // drop down ....
        [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x, bubblePath.currentPoint.y+arrowLength)];
  
        // then back up...
        [bubblePath addLineToPoint:CGPointMake(bubblePath.currentPoint.x-arrowWidth, bubblePath.currentPoint.y-arrowLength)];
    
    }
    
    
    
    // then left
    [bubblePath addLineToPoint:CGPointMake(boxRect.origin.x+borderRadius,bubblePath.currentPoint.y)];
 
   
    // bottom left curve
    [bubblePath addQuadCurveToPoint:CGPointMake(boxRect.origin.x, bubblePath.currentPoint.y-borderRadius) controlPoint:CGPointMake(bubblePath.currentPoint.x-borderRadius, bubblePath.currentPoint.y)];
    
    // close path to go up to top left
    [bubblePath closePath];
    
    // paint
    [bubblePath fill];
    [bubblePath stroke];

    // for fun let's add a shadow
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowRadius = 10.0;
    self.layer.shadowOpacity = 0.7;
    self.layer.shadowOffset = (CGSize) { 5, 5 };
    self.layer.shadowPath = bubblePath.CGPath;
     
    
    // you can add a textview or whatever now
    
    UITextView *tv = [[UITextView alloc ] initWithFrame:CGRectInset(boxRect, borderRadius/4, borderRadius/4)];
    tv.editable = NO;
    tv.text = text;
    tv.backgroundColor = [UIColor clearColor];
    tv.textColor = [UIColor whiteColor];
    tv.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
    [self addSubview:tv];
    
 
    
    
    
}
 

@end
