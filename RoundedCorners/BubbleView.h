//
//  BubbleView.h
//  RoundedCorners
//
//  Created by Ralph Seaman on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BubbleView : UIView {
    
    UITextView *textHolder;
    NSString *text;
    BOOL leftarrow;
    
    
    
}

-(id) initWithFrame:(CGRect)frame text:(NSString *) atext pointsleft:(BOOL ) isLeftPointedArrow;


@end
