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
        // Initialization code
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
    float endDeg = 45;
    
    // drawing point starts from middle of view
    int x = view_size_x / 2;
    int y = view_size_y / 2;
    int r = y - 40;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(ctx, 2.0);
    
    startDeg = 0;
    
    CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    
    startDeg= 45;
    endDeg = 360;
    CGContextSetRGBFillColor(ctx, 0.0, 1.0, 0.0, 1.0);
    CGContextMoveToPoint(ctx, x, y);
    CGContextAddArc(ctx, x, y, r, (startDeg)*M_PI/180.0, (endDeg)*M_PI/180.0, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);

}



@end
