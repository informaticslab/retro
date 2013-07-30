//
//  SexualActStats.h
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SexualActStat.h"
#import "HivNegativePartner.h"
#import "HivPositivePartner.h"

@interface SexualActStats : NSObject

@property(strong) SexualActStat *insertiveVaginal;
@property(strong) SexualActStat *receptiveVaginal;
@property(strong) SexualActStat *receiveOral;
@property(strong) SexualActStat *giveOral;
@property(strong) SexualActStat *insertiveAnal;
@property(strong) SexualActStat *receptiveAnal;
@property NSUInteger ulcerPresentPercent;
@property HivNegativePartner *hivNegPartner;
@property HivPositivePartner *hivPosPartner;

-(void)updateStats;


@end
