//
//  SexualActStat.m
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "SexualActStat.h"
#import "AppManager.h"

@implementation SexualActStat

AppManager *appMgr;

-(id)init
{
    self = [super init];
    appMgr = [AppManager singletonAppManager];
    self.timesPerMonth = 0;
    self.percentWithCondomUsage = 0;
    return self;
}

-(NSString *)getSummaryString
{
    NSString *summary = [NSString stringWithFormat:@"%d acts per month, %d%% condom usage",
                         self.timesPerMonth, self.percentWithCondomUsage];
    return summary;
    
}

-(void)resetStat
{
    _timesPerMonth = 0;
    _percentWithCondomUsage = 0;
    
}

@end
