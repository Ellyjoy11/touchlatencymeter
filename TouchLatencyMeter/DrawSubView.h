//
//  DrawSubView.h
//  TouchLatencyMeter
//
//  Created by Elena Last on 10/1/14.
//  Copyright (c) 2014 Elena Last. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DrawSubView_DrawBlock)(UIView* v,CGContextRef context);

@interface DrawSubView : UIView
@property (nonatomic,copy) DrawSubView_DrawBlock drawBlock;
@end