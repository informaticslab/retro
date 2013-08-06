//
//  ContractingHivChances.m
//  retro
//
//  Created by jtq6 on 8/5/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "ContractingHivRisk.h"


#define VIEW_SIZE_X  512
#define VIEW_SIZE_Y  140
#define KEY_TEXT_X 120
#define KEY_TEXT_Y 40

#define IV_COLOR 32.0/255.0, 64.0/255.0, 154/255.0, 1.0
#define BLACK_COLOR 0/255.0, 0/255.0, 0/255.0, 1.0

#define LEGEND_FONT [UIFont fontWithName:@"Verdana" size:14 ]
@interface ContractingHivRisk()
@property CGContextRef ctx;
@end

@implementation ContractingHivRisk


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
    
    _ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(_ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextSetLineWidth(_ctx, 2.0);
    CGContextSetRGBFillColor(_ctx, BLACK_COLOR);

    
    NSString *text = @"Chances of Contracting HIV from Partner";
    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"Verdana-Bold" size:16 ]];
    //    [text drawAtPoint:CGPointMake(10, 10) withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18 ]];
    
    text = [NSString stringWithFormat:@"%.1f%% per month", _stats.chancesPerMonthPercent*100];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y)];

    text = [NSString stringWithFormat:@"%.1f%% per year", _stats.chancesPerYearPercent*100];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+20)];

    text = [NSString stringWithFormat:@"%.1f%% in 10 years", _stats.chancesPerTenYearPercent*100];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+40)];
    
    text = [NSString stringWithFormat:@"%.1f%% in 25 years", _stats.chancesPerTwentyFiveYearPercent*100];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X, KEY_TEXT_Y+60)];
    
    
    text = [NSString stringWithFormat:@"OR"];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+160, KEY_TEXT_Y)];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+160, KEY_TEXT_Y+20)];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+160, KEY_TEXT_Y+40)];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+160, KEY_TEXT_Y+60)];

    
    
    
    
    text = [NSString stringWithFormat:@"1 in %.1f", _stats.chancesPerMonthRatio];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+220, KEY_TEXT_Y)];
    
    text = [NSString stringWithFormat:@"1 in %.1f", _stats.chancesPerYearRatio];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+220, KEY_TEXT_Y+20)];
    
    text = [NSString stringWithFormat:@"1 in %.1f", _stats.chancesPerTenYearRatio];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+220, KEY_TEXT_Y+40)];
    
    text = [NSString stringWithFormat:@"1 in %.1f", _stats.chancesPerTwentyFiveYearRatio];
    [self drawText:text atPoint:CGPointMake(KEY_TEXT_X+220, KEY_TEXT_Y+60)];
    
    

}

-(void)drawText:(NSString *)text atPoint:(CGPoint)newPoint
{
    
    [text drawAtPoint:newPoint withFont:LEGEND_FONT];
    
}



@end
