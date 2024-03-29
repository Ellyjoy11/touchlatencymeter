//
//  DrawSubView.m
//  TouchLatencyMeter
//
//  Created by Elena Last on 10/1/14.
//  Copyright (c) 2014 Elena Last. All rights reserved.
//

#import "DrawSubView.h"

@implementation DrawSubView
@synthesize drawBlock;

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if(self.drawBlock)
        self.drawBlock(self,context);
}

@end
