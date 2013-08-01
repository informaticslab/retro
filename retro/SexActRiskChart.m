//
//  SexActRiskChart.m
//  retro
//
//  Created by jtq6 on 7/25/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "SexActRiskChart.h"

@implementation SexActRiskChart

#define VIEW_SIZE_X  512
#define VIEW_SIZE_Y  242
#define KEY_COLOR_BOX_X (VIEW_SIZE_X - 230)
#define KEY_COLOR_BOX_Y (VIEW_SIZE_Y - 160)
#define KEY_TEXT_X (KEY_COLOR_BOX_X + 20)
#define KEY_TEXT_Y (KEY_COLOR_BOX_Y - 3)
#define PIE_CHART_CENTER_X  (VIEW_SIZE_X / 2 - 120)
#define PIE_CHART_CENTER_Y  (VIEW_SIZE_Y / 2 + 20)
#define PIE_CHART_RADIUS  ((VIEW_SIZE_Y/2) - 40)

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
    float startDeg = 0;
    float endDeg = 0;
    
    // drawing point starts from middle of view
    int x = PIE_CHART_CENTER_X;
    int y = PIE_CHART_CENTER_Y;
    int r = PIE_CHART_RADIUS;
    
    NSString *text = @"Contributions to Chances of Contracting HIV by Sexual Act";
    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"Verdana-Bold" size:16 ]];
//    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18 ]];
    
    
    
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
    
    
    // draw legend
    CGContextSetLineWidth(ctx, 1.2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGRect rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y,10,10);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetRGBFillColor(ctx, 32.0/255.0, 64.0/255.0, 154/255.0, 1.0);
    CGContextFillRect(ctx, rectangle);

    text = @"Insertive Vaginal Sex";
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1.0);
    [text drawAtPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y) withFont:[UIFont fontWithName:@"Verdana" size:12 ]];

    CGContextSetLineWidth(ctx, 1.2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    rectangle = CGRectMake(KEY_COLOR_BOX_X, KEY_COLOR_BOX_Y+20,10,10);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetRGBFillColor(ctx, 5/255.0, 104/255.0, 57/255.0, 1.0);
    CGContextFillRect(ctx, rectangle);

    text = @"Receptive Vaginal Sex";
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1.0);
    [text drawAtPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+20) withFont:[UIFont fontWithName:@"Verdana" size:12 ]];

    
    CGContextSetLineWidth(ctx, 1.2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+40,10,10);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetRGBFillColor(ctx, 191/255.0, 30/255.0, 46/255.0, 1.0);
    CGContextFillRect(ctx, rectangle);
    
    text = @"Receiving Oral Sex";
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1.0);
    [text drawAtPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+40) withFont:[UIFont fontWithName:@"Verdana" size:12 ]];
    
    CGContextSetLineWidth(ctx, 1.2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+60,10,10);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetRGBFillColor(ctx, 242.0/255.0, 101/255.0, 34/255.0, 1.0);
    CGContextFillRect(ctx, rectangle);
    
    text = @"Giving Oral Sex";
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1.0);
    [text drawAtPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+60) withFont:[UIFont fontWithName:@"Verdana" size:12 ]];
    
    CGContextSetLineWidth(ctx, 1.2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+80,10,10);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetRGBFillColor(ctx, 217/255.0, 27/255.0, 92/255.0, 1.0);
    CGContextFillRect(ctx, rectangle);
    
    text = @"Insertive Anal Sex";
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1.0);
    [text drawAtPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+80) withFont:[UIFont fontWithName:@"Verdana" size:12 ]];
    
    CGContextSetLineWidth(ctx, 1.2);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+100,10,10);
    CGContextAddRect(ctx, rectangle);
    CGContextStrokePath(ctx);
    CGContextSetRGBFillColor(ctx, 127/255.0, 63/255.0, 152/255.0, 1.0);
    CGContextFillRect(ctx, rectangle);
    
    text = @"Receptive Anal Sex";
    CGContextSetRGBFillColor(ctx, 0, 0, 0, 1.0);
    [text drawAtPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+100) withFont:[UIFont fontWithName:@"Verdana" size:12 ]];
    
}




@end
