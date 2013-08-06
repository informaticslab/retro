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


// stats
@property double chancesPerMonthRatio;
@property double chancesPerMonthPercent;
@property double chancesPerYearRatio;
@property double chancesPerYearPercent;
@property double chancesPerTenYearRatio;
@property double chancesPerTenYearPercent;
@property double chancesPerTwentyFiveYearRatio;
@property double chancesPerTwentyFiveYearPercent;

@property double contribToRiskByIV;
@property double contribToRiskByRV;
@property double contribToRiskByRO;
@property double contribToRiskByGO;
@property double contribToRiskByIA;
@property double contribToRiskByRA;

@property double contribToRiskByIVAsPercentage;
@property double contribToRiskByRVAsPercentage;
@property double contribToRiskByROAsPercentage;
@property double contribToRiskByGOAsPercentage;
@property double contribToRiskByIAAsPercentage;
@property double contribToRiskByRAAsPercentage;

@property double riskByIV;
@property double riskByRV;
@property double riskByRO;
@property double riskByGO;
@property double riskByIA;
@property double riskByRA;

@property double riskProductByIV;
@property double riskProductByRV;
@property double riskProductByRO;
@property double riskProductByGO;
@property double riskProductByIA;
@property double riskProductByRA;

@property double ivPieSlice;
@property double rvPieSlice;
@property double roPieSlice;
@property double goPieSlice;
@property double iaPieSlice;
@property double raPieSlice;

@property double ivContribPercent;
@property double rvContribPercent;
@property double roContribPercent;
@property double goContribPercent;
@property double raContribPercent;
@property double iaContribPercent;

@property double totalProtectedRiskFactor;
@property double totalUnprotectedRiskFactor;

@property double protectedPieSlice;
@property double unprotectedPieSlice;
@property double protectedPercent;
@property double unprotectedPercent;


-(void)updateStats;


@end
