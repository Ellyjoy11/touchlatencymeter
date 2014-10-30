//
//  DrawView.m
//  TouchLatencyMeter
//
//  Created by Elena Last on 10/1/14.
//  Copyright (c) 2014 Elena Last. All rights reserved.
//

#import "DrawView.h"
@implementation DrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    
    CGContextRef c = UIGraphicsGetCurrentContext();
    
    CGFloat white[4] = {1.0f, 1.0f, 1.0f, 1.0f}; // RGB color: red, green, blue, alpha - from 0.0 to 1.0
    CGContextSetStrokeColor(c, white);
    CGContextSetLineWidth(c, 1);
    CGContextBeginPath(c);
    float centerX = rect.size.width/2;
    float centerY = rect.size.height/2;
    CGContextMoveToPoint(c, centerX-X_LANE, centerY-160);
    CGContextAddLineToPoint(c, centerX-X_LANE, centerY+160);
    CGContextStrokePath(c);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, centerX, centerY-200);
    CGContextAddLineToPoint(c, centerX, centerY+200);
    CGContextStrokePath(c);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, centerX+X_LANE, centerY-160);
    CGContextAddLineToPoint(c, centerX+X_LANE, centerY+160);
    CGContextStrokePath(c);
    CGContextBeginPath(c);
    CGContextMoveToPoint(c, centerX-X_LANE-10, centerY);
    CGContextAddLineToPoint(c, centerX+X_LANE+10, centerY);
    CGContextStrokePath(c);
}


@end
