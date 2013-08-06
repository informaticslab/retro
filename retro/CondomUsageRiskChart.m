//
//  CondomUsageRiskChart.m
//  retro
//
//  Created by jtq6 on 8/5/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "CondomUsageRiskChart.h"

@interface CondomUsageRiskChart ()

@property float startDeg;
@property float endDeg;
@property int x;
@property int y;
@property int r;
@property CGContextRef ctx;
@property CGRect rectangle;

@end

#define VIEW_SIZE_X  512
#define VIEW_SIZE_Y  242
#define KEY_COLOR_BOX_X (VIEW_SIZE_X - 230)
#define KEY_COLOR_BOX_Y (VIEW_SIZE_Y - 160)
#define KEY_TEXT_X (KEY_COLOR_BOX_X + 20)
#define KEY_TEXT_Y (KEY_COLOR_BOX_Y - 3)
#define PIE_CHART_CENTER_X  (VIEW_SIZE_X / 2 - 120)
#define PIE_CHART_CENTER_Y  (VIEW_SIZE_Y / 2 + 20)
#define PIE_CHART_RADIUS  ((VIEW_SIZE_Y/2) - 40)

#define PROTECTED_COLOR 32.0/255.0, 64.0/255.0, 154/255.0, 1.0
#define UNPROTECTED_COLOR 5/255.0, 104/255.0, 57/255.0, 1.0
#define BLACK_COLOR 0/255.0, 0/255.0, 0/255.0, 1.0

#define LEGEND_FONT [UIFont fontWithName:@"Verdana" size:14 ]
#define LEGEND_RECTANGLE_X 12
#define LEGEND_RECTANGLE_Y 12


@implementation CondomUsageRiskChart

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    _endDeg = 0;
    
    // drawing point starts from middle of view
    _x = PIE_CHART_CENTER_X;
    _y = PIE_CHART_CENTER_Y;
    _r = PIE_CHART_RADIUS;

    
    NSString *text = @"Contributions to Chances of Contracting HIV by Condom Use";
    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"Verdana-Bold" size:16 ]];
    //    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18 ]];
    
    
    
    _ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(_ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(_ctx, 2.0);
    
    _startDeg = 0;
    _endDeg = _stats.protectedPieSlice;
    CGContextSetRGBFillColor(_ctx, PROTECTED_COLOR);
    [self drawArc];
    
    _startDeg= _endDeg;
    _endDeg = _startDeg + _stats.unprotectedPieSlice;
    CGContextSetRGBFillColor(_ctx, UNPROTECTED_COLOR);
    [self drawArc];
    
    // draw legend
    CGContextSetRGBFillColor(_ctx, PROTECTED_COLOR);
    _rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y, LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    [self drawLegendRectangle];
    [self drawLegendText:@"Condoms Used" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y)];
    
    CGContextSetRGBFillColor(_ctx, UNPROTECTED_COLOR);
    _rectangle = CGRectMake(KEY_COLOR_BOX_X, KEY_COLOR_BOX_Y+20,LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    [self drawLegendRectangle];
    [self drawLegendText:@"Unprotected Acts" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+20)];
    
}

-(void)drawArc
{
    
    CGContextMoveToPoint(_ctx, _x, _y);
    CGContextAddArc(_ctx, _x, _y, _r, (_startDeg)*M_PI/180.0, (_endDeg)*M_PI/180.0, 0);
    CGContextClosePath(_ctx);
    CGContextFillPath(_ctx);
    
}

-(void)drawLegendText:(NSString *)text atPoint:(CGPoint)newPoint
{
    
    CGContextSetRGBFillColor(_ctx, BLACK_COLOR);
    [text drawAtPoint:newPoint withFont:LEGEND_FONT];
    
}

-(void)drawLegendRectangle
{
    
    CGContextSetLineWidth(_ctx, 1.2);
    CGContextSetStrokeColorWithColor(_ctx, [UIColor blackColor].CGColor);
    CGContextAddRect(_ctx, _rectangle);
    CGContextStrokePath(_ctx);
    CGContextFillRect(_ctx, _rectangle);
    
    
}


@end
