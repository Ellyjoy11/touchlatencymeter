//
//  ViewController.m
//  TouchLatencyMeter
//
//  Created by Elena Last on 10/1/14.
//  Copyright (c) 2014 Elena Last. All rights reserved.
//

#import "ViewController.h"
#import "DrawSubView.h"
#import "DrawView.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    DrawView *dw = [[DrawView alloc] initWithFrame: rect];
    dw.backgroundColor=[UIColor blackColor];
    [self.view addSubview:dw];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UIView *subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[DrawSubView class]])
        {
            [subView removeFromSuperview];
        }
    }
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint currentLocation = [ touch locationInView:self.view];
    NSLog(@"Touch BEGIN at (%f,%f)", currentLocation.x, currentLocation.y);
    
    DrawSubView* drawableView = [[DrawSubView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    float centerX = self.view.frame.size.width/2;
    float centerY = self.view.frame.size.height/2;
    drawableView.drawBlock = ^(UIView* v,CGContextRef context)
    
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();

        NSLog(@"Frame size (%f,%f)", self.view.frame.size.width, self.view.frame.size.height);
        
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetLineWidth(ctx, 1);
        CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 1.0, 1.0);

        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, centerX-X_LANE, centerY+90);
        CGContextAddLineToPoint(ctx, centerX-X_LANE, centerY+140);
        CGContextStrokePath(ctx);

        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, centerX+X_LANE, centerY+90);
        CGContextAddLineToPoint(ctx, centerX+X_LANE, centerY+140);
        CGContextStrokePath(ctx);
        
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, currentLocation.x, 390);//currentLocation.x, currentLocation.y);
        CGContextAddLineToPoint(ctx, currentLocation.x, 400);
        CGContextStrokePath(ctx);
        
    };
    [self.view addSubview:drawableView];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[DrawSubView class]])
        {
            [subView removeFromSuperview];
        }
    }
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint currentLocation = [ touch locationInView:self.view];
    NSLog(@"Touch MOVED at (%f,%f)", currentLocation.x, currentLocation.y);
    ///////////////
    DrawSubView* drawableView2 = [[DrawSubView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    float centerX = self.view.frame.size.width/2;
    float centerY = self.view.frame.size.height/2;
    drawableView2.drawBlock = ^(UIView* v,CGContextRef context)
    {
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        
        NSLog(@"Frame size (%f,%f)", self.view.frame.size.width, self.view.frame.size.height);
        
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetLineWidth(ctx, 17.0);
        CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 1.0, 1.0);
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, centerX, centerY);//currentLocation.x, currentLocation.y);
        CGContextAddLineToPoint(ctx, currentLocation.x, centerY);
        CGContextStrokePath(ctx);
        CGContextSetLineWidth(ctx, 1.0);

        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, centerX - X_LANE - 30, centerY);//currentLocation.x, currentLocation.y);
        CGContextAddLineToPoint(ctx, centerX- X_LANE - 20, centerY);
        CGContextStrokePath(ctx);
 
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, centerX+X_LANE+30, centerY);//currentLocation.x, currentLocation.y);
        CGContextAddLineToPoint(ctx, centerX+X_LANE + 20, centerY);
        CGContextStrokePath(ctx);
        
        CGContextBeginPath(ctx);
        CGContextMoveToPoint(ctx, currentLocation.x, 390);//currentLocation.x, currentLocation.y);
        CGContextAddLineToPoint(ctx, currentLocation.x, 400);
        CGContextStrokePath(ctx);
        
    };
    [self.view addSubview:drawableView2];
    
    
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[DrawSubView class]])
        {
            [subView removeFromSuperview];
        }
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UIView *subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[DrawSubView class]])
        {
            [subView removeFromSuperview];
        }
    }
}

@end
