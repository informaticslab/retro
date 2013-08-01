//
//  SexActRiskChart.m
//  retro
//
//  Created by jtq6 on 7/25/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "SexActRiskChart.h"

@implementation SexActRiskChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int view_size_x = 512;
    int view_size_y = 242;
    float startDeg = 0;
    float endDeg = 0;
    
    // drawing point starts from middle of view
    int x = view_size_x / 2;
    int y = view_size_y / 2;
    int r = y - 40;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(ctx, 2.0);
    
    endDeg = _stats.ivPieSlice;
    
    CGContextSetRGBFillColor(ctx, 32.0/255.0, 64.0/255.0, 154/255.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    startDeg= endDeg;
    endDeg = startDeg + _stats.rvPieSlice;
    CGContextSetRGBFillColor(ctx, 5/255.0, 104/255.0, 57/255.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);

    startDeg= endDeg;
    endDeg = startDeg + _stats.roPieSlice;
    CGContextSetRGBFillColor(ctx, 191/255.0, 30/255.0, 46/255.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);

    startDeg= endDeg;
    endDeg = startDeg + _stats.goPieSlice;
    CGContextSetRGBFillColor(ctx, 242.0/255.0, 101/255.0, 34/255.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);

    startDeg= endDeg;
    endDeg = startDeg + _stats.iaPieSlice;
    CGContextSetRGBFillColor(ctx, 217/255.0, 27/255.0, 92/255.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);

    startDeg= endDeg;
    endDeg = startDeg + _stats.raPieSlice;
    CGContextSetRGBFillColor(ctx, 127/255.0, 63/255.0, 152/255.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}



@end
