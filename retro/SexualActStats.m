//
//  SexualActStats.m
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "SexualActStats.h"
#import "SexualActStat.h"
#import "Partner.h"

@implementation SexualActStats



-(id)init
{
    self = [super init];
    
    self.insertiveVaginal = [[SexualActStat alloc] init];
    self.receptiveVaginal = [[SexualActStat alloc] init];
    self.receiveOral = [[SexualActStat alloc] init];
    self.giveOral = [[SexualActStat alloc] init];
    self.insertiveAnal = [[SexualActStat alloc] init];
    self.receptiveAnal = [[SexualActStat alloc] init];
    self.hivNegPartner = [[HivNegativePartner alloc]init];
    self.hivPosPartner = [[HivPositivePartner alloc]init];
    
    self.ulcerPresentPercent = 0;
    
    return self;
    
}

-(void)updateStats
{
    
    
    
}



@end
