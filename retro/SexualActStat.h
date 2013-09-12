//
//  SexualActStat.h
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SexualActStat : NSObject

@property NSUInteger timesPerMonth;
@property NSUInteger percentWithCondomUsage;
@property BOOL isApplicable;

-(NSString *)getSummaryString;
-(void)resetStat;


@end
