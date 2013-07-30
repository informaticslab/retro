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


// constant probabilities
#define pIV 0.0008
#define pRV 0.0008
#define pIO 0.0
#define pRO 0.0004
#define pIA 0.0062
#define pRA 0.0140

// risk ratio constants
#define RR_CONDOM 5.04
#define RR_ART 25.0
#define RR_PREP_HET 3.45
#define RR_PREP_MSM 1.79
#define RR_CIRC_VAG 1.85
#define RR_CICR_ANAL 3.41


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

- (double)calcInsertVagProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.insertiveVaginal.timesPerMonth;
    double percentCondomUsage = self.insertiveVaginal.percentWithCondomUsage/100.0;
        
    double riskFactor = pow(1-(pIV/(RR_CONDOM*RR_ART*RR_PREP_HET*RR_CIRC_VAG)), actsPerMonth*percentCondomUsage);
    
    NSLog(@"Insertive vaginal protected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcInsertVagUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.insertiveVaginal.timesPerMonth;
    double percentCondomUsage = self.insertiveVaginal.percentWithCondomUsage/100.0;
    

    double riskFactor = pow(1-(pIV/(RR_ART*RR_PREP_HET*RR_CIRC_VAG)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Insertive vaginal unprotected risk factor = %f", riskFactor);
    
    return riskFactor;
    
}

- (double)calcReceptiveVagProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receptiveVaginal.timesPerMonth;
    double percentCondomUsage = self.receptiveVaginal.percentWithCondomUsage/100.0;

    double riskFactor = powf(1-(pRV/(RR_CONDOM*RR_ART*RR_PREP_HET)), actsPerMonth*percentCondomUsage);
    
    NSLog(@"Receptive vaginal protected risk factor = %f", riskFactor);

    return riskFactor;
    
}
- (double)calcReceptiveVagUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receptiveVaginal.timesPerMonth;
    double percentCondomUsage = self.receptiveVaginal.percentWithCondomUsage/100.0;
    
    double riskFactor = powf(1-(pRV/(RR_ART*RR_PREP_HET)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Receptive vaginal unprotected risk factor = %f", riskFactor);

    return riskFactor;

}

- (double)calcReceiveOralProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pIO/(RR_CONDOM*RR_ART*RR_PREP_HET)), actsPerMonth*percentCondomUsage);

    NSLog(@"Receive oral protected risk factor = %f", riskFactor);

    
    return riskFactor;

}

- (double)calcReceiveOralUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pIO/(RR_ART*RR_PREP_HET)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Receive oral unprotected risk factor = %f", riskFactor);

    
    return riskFactor;
    
}

- (double)calcGiveOralProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pRO/(RR_CONDOM*RR_ART*RR_PREP_HET)), actsPerMonth*percentCondomUsage);
    
    NSLog(@"Give oral protected risk factor = %f", riskFactor);

    return riskFactor;
    
}

- (double)calcGiveOralUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pRO/(RR_ART*RR_PREP_HET)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Give oral unprotected risk factor = %f", riskFactor);

    return riskFactor;
    
}

- (double)calcInsertAnalProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pIA/(RR_CONDOM*RR_ART*RR_PREP_MSM*RR_CICR_ANAL)), actsPerMonth*percentCondomUsage);
    
    NSLog(@"Insertive anal protected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcInsertAnalUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pIA/(RR_ART*RR_PREP_MSM*RR_CICR_ANAL)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Insertive anal unprotected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcReceptiveAnalProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pRA/(RR_CONDOM*RR_ART*RR_PREP_MSM)), actsPerMonth*percentCondomUsage);
    
    NSLog(@"Receptive anal protected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcReceptiveAnalUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100;
    
    double riskFactor = pow(1-(pRA/(RR_ART*RR_PREP_MSM)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Receptive anal unprotected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}



-(void)updateStats
{
    double chancesPerMonthPercent = 1 - ([self calcInsertVagUnprotectedRiskFactor] *[self  calcInsertVagProtectedRiskFactor] *
                          [self calcReceptiveVagProtectedRiskFactor] * [self calcReceptiveVagUnprotectedRiskFactor] *
                          [self calcReceiveOralProtectedRiskFactor] * [self calcReceiveOralUnprotectedRiskFactor] *
                          [self calcGiveOralProtectedRiskFactor] * [self calcGiveOralUnprotectedRiskFactor] *
                          [self calcInsertAnalProtectedRiskFactor] * [self calcInsertAnalUnprotectedRiskFactor] *
                          [self calcReceptiveAnalProtectedRiskFactor] * [self calcReceptiveAnalUnprotectedRiskFactor]);
    double chancesPerMonthRatio = 1 / chancesPerMonthPercent;
    NSLog(@"Chances per month percent = %f%% or 1 in %f",chancesPerMonthPercent*100, chancesPerMonthRatio);

    double chancesPerYearPercent = 1-pow(1-chancesPerMonthPercent,12);
    double chancesPerYearRatio = 1 / chancesPerYearPercent;
    NSLog(@"Chances per year percent = %f%% or 1 in %f",chancesPerYearPercent*100, chancesPerYearRatio);

    double chancesPerTenYearPercent = 1-pow(1-chancesPerYearPercent,10);
    double chancesPerTenYearRatio = 1 / chancesPerTenYearPercent;
    NSLog(@"Chances per ten years percent = %f%% or 1 in %f",chancesPerTenYearPercent*100, chancesPerTenYearRatio);

    double chancesPerTwentyFiveYearPercent = 1-pow(1-chancesPerYearPercent,25);
    double chancesPerTwentyFiveYearRatio = 1 / chancesPerTwentyFiveYearPercent;
    NSLog(@"Chances per twenty-five years percent = %f%% or 1 in %f",chancesPerTwentyFiveYearPercent*100, chancesPerTwentyFiveYearRatio);
    
}



@end
