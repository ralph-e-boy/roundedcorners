//
//  RoundedCornersViewController.m
//  RoundedCorners
//
//  Created by Ralph Seaman on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RoundedCornersViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BubbleView.h"
@interface RoundedCornersViewController ()

@end

@implementation RoundedCornersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    
    
    BubbleView *romeo = [[BubbleView alloc] initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width * .75, 160) text:@"So shalt thou show me friendship. Take thou that: \nLive, and be prosperous: and farewell, good fellow." pointsleft:TRUE];
    
    BubbleView *juliet = [[BubbleView alloc] initWithFrame:CGRectMake(80, 170, self.view.bounds.size.width * .75, 250) text:@"Ay, those attires are best: but, gentle nurse,   I pray thee, leave me to myself to-night,  For I have need of many orisons  To move the heavens to smile upon my state,   Which, well thou know'st, is cross, and full of sin." pointsleft:FALSE];
       
  [self.view addSubview:romeo];
  [self.view addSubview:juliet];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   UITouch *touch = [touches anyObject];
self.view.transform =   CGAffineTransformConcat(self.view.transform, CGAffineTransformMakeRotation([touch locationInView:self.view].y/self.view.bounds.size.height));


}

@end
