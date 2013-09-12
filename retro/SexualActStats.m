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
#import "Debug.h"

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
#define RR_CIRC_ANAL 3.41


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
        
    double riskFactor = pow(1-(pIV/(_rrCondom*_rrArt*_rrPrepHetro*_rrCircVag)), actsPerMonth*percentCondomUsage);
    
    DebugLog(@"Insertive vaginal protected risk factor = %f", riskFactor);

    return riskFactor;
    
}

- (double)calcInsertVagUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.insertiveVaginal.timesPerMonth;
    double percentCondomUsage = self.insertiveVaginal.percentWithCondomUsage/100.0;
    

    double riskFactor = pow(1-(pIV/(_rrArt*_rrPrepHetro*_rrCircVag)), actsPerMonth*(1-percentCondomUsage));
    
    DebugLog(@"Insertive vaginal unprotected risk factor = %f", riskFactor);
    
    return riskFactor;
    
}

- (double)calcReceptiveVagProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receptiveVaginal.timesPerMonth;
    double percentCondomUsage = self.receptiveVaginal.percentWithCondomUsage/100.0;

    double riskFactor = pow(1-(pRV/(_rrCondom*_rrArt*_rrPrepHetro)), actsPerMonth*percentCondomUsage);
    
    NSLog(@"Receptive vaginal protected risk factor = %f", riskFactor);

    return riskFactor;
    
}
- (double)calcReceptiveVagUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receptiveVaginal.timesPerMonth;
    double percentCondomUsage = self.receptiveVaginal.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pRV/(_rrArt*_rrPrepHetro)), actsPerMonth*(1-percentCondomUsage));
    
    NSLog(@"Receptive vaginal unprotected risk factor = %f", riskFactor);

    return riskFactor;

}

- (double)calcReceiveOralProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pIO/(_rrCondom*_rrArt*_rrPrepHetro)), actsPerMonth*percentCondomUsage);

    DebugLog(@"Receive oral protected risk factor = %f", riskFactor);

    
    return riskFactor;

}

- (double)calcReceiveOralUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receiveOral.timesPerMonth;
    double percentCondomUsage = self.receiveOral.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pIO/(_rrArt*_rrPrepHetro)), actsPerMonth*(1-percentCondomUsage));
    
    DebugLog(@"Receive oral unprotected risk factor = %f", riskFactor);

    
    return riskFactor;
    
}

- (double)calcGiveOralProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.giveOral.timesPerMonth;
    double percentCondomUsage = self.giveOral.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pRO/(_rrCondom*_rrArt*_rrPrepHetro)), actsPerMonth*percentCondomUsage);
    
    DebugLog(@"Give oral protected risk factor = %f", riskFactor);

    return riskFactor;
    
}

- (double)calcGiveOralUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.giveOral.timesPerMonth;
    double percentCondomUsage = self.giveOral.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pRO/(_rrArt*_rrPrepHetro)), actsPerMonth*(1-percentCondomUsage));
    
    DebugLog(@"Give oral unprotected risk factor = %f", riskFactor);

    return riskFactor;
    
}

- (double)calcInsertAnalProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.insertiveAnal.timesPerMonth;
    double percentCondomUsage = self.insertiveAnal.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pIA/(_rrCondom*_rrArt*_rrPrepMsm*_rrCircAnal)), actsPerMonth*percentCondomUsage);
    
    DebugLog(@"Insertive anal protected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcInsertAnalUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.insertiveAnal.timesPerMonth;
    double percentCondomUsage = self.insertiveAnal.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pIA/(_rrArt*_rrPrepMsm*_rrCircAnal)), actsPerMonth*(1-percentCondomUsage));
    
    DebugLog(@"Insertive anal unprotected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcReceptiveAnalProtectedRiskFactor
{
    NSUInteger actsPerMonth = self.receptiveAnal.timesPerMonth;
    double percentCondomUsage = self.receptiveAnal.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pRA/(_rrCondom*_rrArt*_rrPrepMsm)), actsPerMonth*percentCondomUsage);
    
    DebugLog(@"Receptive anal protected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

- (double)calcReceptiveAnalUnprotectedRiskFactor
{
    NSUInteger actsPerMonth = self.receptiveAnal.timesPerMonth;
    double percentCondomUsage = self.receptiveAnal.percentWithCondomUsage/100.0;
    
    double riskFactor = pow(1-(pRA/(_rrArt*_rrPrepMsm)), actsPerMonth*(1-percentCondomUsage));
    
    DebugLog(@"Receptive anal unprotected risk factor = %f", riskFactor);

    return riskFactor;
    
    
}

-(void)updateRiskRatios
{
    
    _rrCondom = RR_CONDOM;
    if (_hivPosPartner.isOnArt)
        _rrArt = RR_ART;
    else
        _rrArt = 1;
    if (_hivNegPartner.isOnPrep)
        _rrPrepHetro = RR_PREP_HET;
    else
        _rrPrepHetro = 1;
    
    if (_hivNegPartner.isOnPrep)
        _rrPrepMsm = RR_PREP_MSM;
    else
        _rrPrepMsm = 1;
    
    if (_hivNegPartner.isCircumcised && _hivNegPartner.isMale)
        _rrCircVag = RR_CIRC_VAG;
    else
        _rrCircVag = 1;
    
    if (_hivNegPartner.isCircumcised && _hivNegPartner.isMale)
        _rrCircAnal = RR_CIRC_ANAL;
    else
        _rrCircAnal = 1;

}

-(void)updateStats
{
    
    [self updateRiskRatios];
    _chancesPerMonthPercent = 1 - ([self calcInsertVagUnprotectedRiskFactor] *[self  calcInsertVagProtectedRiskFactor] *
                          [self calcReceptiveVagProtectedRiskFactor] * [self calcReceptiveVagUnprotectedRiskFactor] *
                          [self calcReceiveOralProtectedRiskFactor] * [self calcReceiveOralUnprotectedRiskFactor] *
                          [self calcGiveOralProtectedRiskFactor] * [self calcGiveOralUnprotectedRiskFactor] *
                          [self calcInsertAnalProtectedRiskFactor] * [self calcInsertAnalUnprotectedRiskFactor] *
                          [self calcReceptiveAnalProtectedRiskFactor] * [self calcReceptiveAnalUnprotectedRiskFactor]);
 
    _chancesPerMonthRatio = 1 / _chancesPerMonthPercent;
    DebugLog(@"Chances per month percent = %f%% or 1 in %f",_chancesPerMonthPercent*100, _chancesPerMonthRatio);

    _chancesPerYearPercent = 1-pow(1-_chancesPerMonthPercent,12);
    _chancesPerYearRatio = 1 / _chancesPerYearPercent;
    DebugLog(@"Chances per year percent = %f%% or 1 in %f",_chancesPerYearPercent*100, _chancesPerYearRatio);

    _chancesPerTenYearPercent = 1-pow(1-_chancesPerYearPercent,10);
    _chancesPerTenYearRatio = 1 / _chancesPerTenYearPercent;
    DebugLog(@"Chances per ten years percent = %f%% or 1 in %f",_chancesPerTenYearPercent*100, _chancesPerTenYearRatio);

    _chancesPerTwentyFiveYearPercent = 1-pow(1-_chancesPerYearPercent,25);
    _chancesPerTwentyFiveYearRatio = 1 / _chancesPerTwentyFiveYearPercent;
    
    
    _riskProductByIV = [self calcInsertVagUnprotectedRiskFactor] *[self  calcInsertVagProtectedRiskFactor];
    _riskProductByRV = [self calcReceptiveVagProtectedRiskFactor] * [self calcReceptiveVagUnprotectedRiskFactor];
    _riskProductByRO = [self calcReceiveOralProtectedRiskFactor] * [self calcReceiveOralUnprotectedRiskFactor];
    _riskProductByGO = [self calcGiveOralProtectedRiskFactor] * [self calcGiveOralUnprotectedRiskFactor];
    _riskProductByIA = [self calcInsertAnalProtectedRiskFactor] * [self calcInsertAnalUnprotectedRiskFactor];
    _riskProductByRA = [self calcReceptiveAnalProtectedRiskFactor] * [self calcReceptiveAnalUnprotectedRiskFactor];
    
    _totalProtectedRiskFactor = [self calcInsertVagProtectedRiskFactor] * [self calcReceptiveVagProtectedRiskFactor] *[self calcReceiveOralProtectedRiskFactor] * [self calcGiveOralProtectedRiskFactor] *
        [self calcInsertAnalProtectedRiskFactor] * [self calcReceptiveAnalProtectedRiskFactor];
    
    _totalUnprotectedRiskFactor = _totalProtectedRiskFactor * [self calcInsertVagUnprotectedRiskFactor]
    * [self calcReceptiveVagUnprotectedRiskFactor] * [self calcReceiveOralUnprotectedRiskFactor]
    * [self calcGiveOralUnprotectedRiskFactor] * [self calcInsertAnalUnprotectedRiskFactor]
    * [self calcReceptiveAnalUnprotectedRiskFactor];

    _riskByIV = 1 - _riskProductByIV;
    _riskByRV = 1 - _riskProductByRV;
    _riskByRO = 1 - _riskProductByRO;
    _riskByGO = 1 - _riskProductByGO;
    _riskByIA = 1 - _riskProductByIA;
    _riskByRA = 1 - _riskProductByRA;

    
    double totalContribToRisk = _riskByIV + _riskByRV + _riskByRO + _riskByGO + _riskByIA + _riskByRA;
    _ivContribPercent = (_riskByIV / totalContribToRisk) * 100;
    _rvContribPercent = (_riskByRV / totalContribToRisk) * 100;
    _roContribPercent = (_riskByRO / totalContribToRisk) * 100;
    _goContribPercent = (_riskByGO / totalContribToRisk) * 100;
    _raContribPercent = (_riskByRA / totalContribToRisk) * 100;
    _iaContribPercent = (_riskByIA / totalContribToRisk) * 100;
    
    _ivPieSlice = (_riskByIV / totalContribToRisk) * 360;
    _rvPieSlice = (_riskByRV / totalContribToRisk) * 360;
    _roPieSlice = (_riskByRO / totalContribToRisk) * 360;
    _goPieSlice = (_riskByGO / totalContribToRisk) * 360;
    _raPieSlice = (_riskByRA / totalContribToRisk) * 360;
    _iaPieSlice = (_riskByIA / totalContribToRisk) * 360;
    
    
    DebugLog(@"ivPieSlice = %f,",_ivPieSlice);
    DebugLog(@"rvPieSlice = %f,",_rvPieSlice);
    DebugLog(@"roPieSlice = %f,",_roPieSlice);
    DebugLog(@"goPieSlice = %f,",_goPieSlice);
    DebugLog(@"raPieSlice = %f,",_raPieSlice);
    DebugLog(@"iaPieSlice = %f,",_iaPieSlice);
    
    double riskUnprotected = 1 - _totalUnprotectedRiskFactor;
    double riskProtected = 1- _totalProtectedRiskFactor;
    
    double totalCondomUsageContributions = riskProtected + riskUnprotected;
    
    _protectedPieSlice = (riskProtected/ totalCondomUsageContributions) * 360;
    _unprotectedPieSlice = (riskUnprotected/ totalCondomUsageContributions) * 360;
    _protectedPercent = (riskProtected/ totalCondomUsageContributions) * 100;
    _unprotectedPercent = (riskUnprotected/ totalCondomUsageContributions) * 100;
    
    DebugLog(@"protectedPieSlice = %f,",_protectedPieSlice);
    DebugLog(@"unprotectedPieSlice = %f,",_unprotectedPieSlice);

    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"StatsUpdated"
     object:self];

}

// Set applicable flag for stats that apply for gender makeup of couple
-(void)setApplicableStats
{
    
        if ([_hivNegPartner isFemale] && [_hivPosPartner isMale]) {
            _insertiveVaginal.isApplicable = FALSE;
            _receptiveVaginal.isApplicable = TRUE;
            _insertiveAnal.isApplicable = FALSE;
            _receptiveAnal.isApplicable = TRUE;
            _receiveOral.isApplicable = TRUE;
            _giveOral.isApplicable = TRUE;
            
            
        } else if ([_hivNegPartner isMale] && [_hivPosPartner isFemale]) {
            _insertiveVaginal.isApplicable = TRUE;
            _receptiveVaginal.isApplicable = FALSE;
            _insertiveAnal.isApplicable = TRUE;
            _receptiveAnal.isApplicable = FALSE;
            _receiveOral.isApplicable = TRUE;
            _giveOral.isApplicable = TRUE;
            
            
        } else if ([_hivNegPartner isMale] && [_hivPosPartner isMale]) {
            _insertiveVaginal.isApplicable = FALSE;
            _receptiveVaginal.isApplicable = FALSE;
            _insertiveAnal.isApplicable = TRUE;
            _receptiveAnal.isApplicable = TRUE;
            _receiveOral.isApplicable = TRUE;
            _giveOral.isApplicable = TRUE;
            
            
        } else if ([_hivNegPartner isFemale] && [_hivPosPartner isFemale]) {
            _insertiveVaginal.isApplicable = FALSE;
            _receptiveVaginal.isApplicable = FALSE;
            _insertiveAnal.isApplicable = FALSE;
            _receptiveAnal.isApplicable = FALSE;
            _receiveOral.isApplicable = FALSE;
            _giveOral.isApplicable = FALSE;
            
        }

}

-(void)noApplicableStats
{

    _insertiveVaginal.isApplicable = FALSE;
    _receptiveVaginal.isApplicable = FALSE;
    _insertiveAnal.isApplicable = FALSE;
    _receptiveAnal.isApplicable = FALSE;
    _receiveOral.isApplicable = FALSE;
    _giveOral.isApplicable = FALSE;

}


-(void)resetActivities
{
    [_insertiveVaginal resetStat];
    [_receptiveVaginal resetStat];
    [_receiveOral resetStat];
    [_giveOral resetStat];
    [_insertiveAnal resetStat];
    [_receptiveAnal resetStat];
    
    [self updateStats];
    
}

-(void)resetAll
{
    [self resetActivities];
    [_hivNegPartner resetPartner];
    [_hivPosPartner resetPartner];
    [self updateStats];
    
}




@end
