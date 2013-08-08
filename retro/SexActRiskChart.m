//
//  SexActRiskChart.m
//  retro
//
//  Created by jtq6 on 7/25/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "SexActRiskChart.h"

@interface SexActRiskChart ()

@property float startDeg;
@property float endDeg;
@property int x;
@property int y;
@property int r;
@property CGContextRef ctx;
@property CGRect rectangle;

@end

@implementation SexActRiskChart

#define VIEW_SIZE_X  512
#define VIEW_SIZE_Y  242
#define ACT_PERCENT_TEXT_X (VIEW_SIZE_X - 230)
#define ACT_PERCENT_TEXT_Y (VIEW_SIZE_Y - 160)
#define KEY_COLOR_BOX_X (ACT_PERCENT_TEXT_X + 70)
#define KEY_COLOR_BOX_Y (ACT_PERCENT_TEXT_Y + 3)
#define KEY_TEXT_X (KEY_COLOR_BOX_X + 20)
#define KEY_TEXT_Y (ACT_PERCENT_TEXT_Y)
#define PIE_CHART_CENTER_X  (VIEW_SIZE_X / 2 - 120)
#define PIE_CHART_CENTER_Y  (VIEW_SIZE_Y / 2 + 20)
#define PIE_CHART_RADIUS  ((VIEW_SIZE_Y/2) - 30)

#define IV_COLOR 32.0/255.0, 64.0/255.0, 154/255.0, 1.0
#define RV_COLOR 5/255.0, 104/255.0, 57/255.0, 1.0
#define RO_COLOR 191/255.0, 30/255.0, 46/255.0, 1.0
#define GO_COLOR 242.0/255.0, 101/255.0, 34/255.0, 1.0
#define IA_COLOR 217/255.0, 27/255.0, 92/255.0, 1.0
#define RA_COLOR 127/255.0, 63/255.0, 152/255.0, 1.0
#define BLACK_COLOR 0/255.0, 0/255.0, 0/255.0, 1.0

#define LEGEND_FONT [UIFont fontWithName:@"Verdana" size:14 ]
#define LEGEND_RECTANGLE_X 12
#define LEGEND_RECTANGLE_Y 12



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
    _endDeg = 0;
    
    // drawing point starts from middle of view
    _x = PIE_CHART_CENTER_X;
    _y = PIE_CHART_CENTER_Y;
    _r = PIE_CHART_RADIUS;
    
    NSString *text = @"How do my specific sexual acts contribute to my chances";
    [text drawAtPoint:CGPointMake(10, 5) withFont:[UIFont fontWithName:@"Verdana-Bold" size:16 ]];
    text = @"of contracting HIV?";
    [text drawAtPoint:CGPointMake(10, 25) withFont:[UIFont fontWithName:@"Verdana-Bold" size:16 ]];
//    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18 ]];
    
    
    
    _ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(_ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(_ctx, 2.0);
    
    _startDeg = 0;
    _endDeg = _stats.ivPieSlice;
    CGContextSetRGBFillColor(_ctx, IV_COLOR);
    [self drawArc];
    
    _startDeg= _endDeg;
    _endDeg = _startDeg + _stats.rvPieSlice;
    CGContextSetRGBFillColor(_ctx, RV_COLOR);
    [self drawArc];

    _startDeg= _endDeg;
    _endDeg = _startDeg + _stats.roPieSlice;
    CGContextSetRGBFillColor(_ctx, RO_COLOR);
    [self drawArc];

    _startDeg= _endDeg;
    _endDeg = _startDeg + _stats.goPieSlice;
    CGContextSetRGBFillColor(_ctx, GO_COLOR);
    [self drawArc];

    _startDeg= _endDeg;
    _endDeg = _startDeg + _stats.iaPieSlice;
    CGContextSetRGBFillColor(_ctx, IA_COLOR);
    [self drawArc];

    _startDeg= _endDeg;
    _endDeg = _startDeg + _stats.raPieSlice;
    CGContextSetRGBFillColor(_ctx, RA_COLOR);
    [self drawArc];
    
    
    // draw legend
    [self drawActPercentage:_stats.ivContribPercent atPoint:CGPointMake(ACT_PERCENT_TEXT_X, ACT_PERCENT_TEXT_Y)];
   _rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y, LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    CGContextSetRGBFillColor(_ctx, IV_COLOR);
    [self drawLegendRectangle];
    [self drawLegendText:@"Insertive Vaginal Sex" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y)];

    [self drawActPercentage:_stats.rvContribPercent atPoint:CGPointMake(ACT_PERCENT_TEXT_X, ACT_PERCENT_TEXT_Y+20)];
    _rectangle = CGRectMake(KEY_COLOR_BOX_X, KEY_COLOR_BOX_Y+20,LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    CGContextSetRGBFillColor(_ctx, RV_COLOR);
    [self drawLegendRectangle];
    [self drawLegendText:@"Receptive Vaginal Sex" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+20)];

    
    [self drawActPercentage:_stats.roContribPercent atPoint:CGPointMake(ACT_PERCENT_TEXT_X, ACT_PERCENT_TEXT_Y+40)];
    _rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+40,LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    CGContextSetRGBFillColor(_ctx, RO_COLOR);
    [self drawLegendRectangle];
    [self drawLegendText:@"Receiving Oral Sex" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+40)];
    
    [self drawActPercentage:_stats.goContribPercent atPoint:CGPointMake(ACT_PERCENT_TEXT_X, ACT_PERCENT_TEXT_Y+60)];
    _rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+60,LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    CGContextSetRGBFillColor(_ctx, GO_COLOR);
    [self drawLegendRectangle];
    [self drawLegendText:@"Giving Oral Sex" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+60)];
    
    [self drawActPercentage:_stats.iaContribPercent atPoint:CGPointMake(ACT_PERCENT_TEXT_X, ACT_PERCENT_TEXT_Y+80)];
    _rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+80,LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    CGContextSetRGBFillColor(_ctx, IA_COLOR);
    [self drawLegendRectangle];
    [self drawLegendText:@"Insertive Anal Sex" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+80)];
    
    [self drawActPercentage:_stats.raContribPercent atPoint:CGPointMake(ACT_PERCENT_TEXT_X, ACT_PERCENT_TEXT_Y+100)];
    _rectangle = CGRectMake(KEY_COLOR_BOX_X,KEY_COLOR_BOX_Y+100,LEGEND_RECTANGLE_X, LEGEND_RECTANGLE_Y);
    CGContextSetRGBFillColor(_ctx, RA_COLOR);
    [self drawLegendRectangle];
    [self drawLegendText:@"Receptive Anal Sex" atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+100)];
    
    
}

-(void)drawArc
{
    
    CGContextMoveToPoint(_ctx, _x, _y);
    CGContextAddArc(_ctx, _x, _y, _r, (_startDeg-90)*M_PI/180.0, (_endDeg-90)*M_PI/180.0, 0);
    CGContextClosePath(_ctx);
    CGContextFillPath(_ctx);

}

-(void)drawLegendText:(NSString *)text atPoint:(CGPoint)newPoint
{

    CGContextSetRGBFillColor(_ctx, BLACK_COLOR);
    [text drawAtPoint:newPoint withFont:LEGEND_FONT];
    
}

-(void)drawActPercentage:(double)percentage atPoint:(CGPoint)newPoint
{
    NSString *percentageText = [NSString stringWithFormat:@"%.1f%%",percentage];
    CGContextSetRGBFillColor(_ctx, BLACK_COLOR);
    [percentageText drawAtPoint:newPoint withFont:LEGEND_FONT];
    
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
