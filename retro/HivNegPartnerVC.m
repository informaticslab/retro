//
//  HivNegPartnerVC.m
//  retro
//
//  Created by jtq6 on 7/19/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "HivNegPartnerVC.h"
#import "AppManager.h"

@implementation HivNegPartnerVC

AppManager *appMgr;
HivNegativePartner *negPartner;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"HivNegPartnerVC viewDidLoad().");
    appMgr = [AppManager singletonAppManager];
    
    negPartner = _stats.hivNegPartner;
    negPartner.hasGenderChanged = FALSE;
    if (negPartner.isDefined) {
        self.lblGender.text = [negPartner getGenderText];
        if (negPartner.isOnPrep)
            self.lblOnPrep.text = @"Yes";
        else
            self.lblOnPrep.text = @"No";
        if (negPartner.isMale) {
            [self showCircumcisionOptions];
            if (negPartner.isCircumcised)
                self.lblCircumcised.text = @"Yes";
            else
                self.lblCircumcised.text = @"No";
        } else {
            [self hideCircumcisionOptions];
        }
    } else {
        self.lblGender.text = appMgr.unspecifiedText;
        self.lblOnPrep.text = appMgr.unspecifiedText;
        self.lblCircumcised.text = appMgr.unspecifiedText;
        [self hideCircumcisionOptions];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)hideCircumcisionOptions
{
    self.lblCircumcised.text = appMgr.unspecifiedText;
    self.btnNoCircumcised.enabled = FALSE;
    self.btnYesCircumcised.enabled = FALSE;
    self.btnNoCircumcised.hidden = TRUE;
    self.btnYesCircumcised.hidden = TRUE;
    self.lblCircumcisedQuestion.hidden = TRUE;
    self.lblCircumcised.text = appMgr.unspecifiedText;
    
}

-(void)showCircumcisionOptions
{
    self.btnNoCircumcised.enabled = TRUE;
    self.btnYesCircumcised.enabled = TRUE;
    self.btnNoCircumcised.hidden = FALSE;
    self.btnYesCircumcised.hidden = FALSE;
    self.lblCircumcisedQuestion.hidden = FALSE;
    
}
- (IBAction)btnMaleTouchUp:(id)sender {
    
    // if already male do nothing
    if (negPartner.isMale)
        return;
    NSLog(@"HivNegPartnerVC- negative partner is a male.");
    self.lblGender.text = @"Male";
    [self showCircumcisionOptions];
    
    [negPartner genderIsMale];
    negPartner.hasGenderChanged = TRUE;
//    [_stats resetActivities];
    [_stats setApplicableStats];
        
}

- (IBAction)btnFemaleTouchUp:(id)sender {
    
    if (negPartner.isFemale)
        return;
    NSLog(@"HivNegPartnerVC- negative partner is a female.");
    self.lblGender.text = @"Female";
    [self hideCircumcisionOptions];
   
    negPartner.isCircumcised = FALSE;
    [negPartner genderIsFemale];
    negPartner.hasGenderChanged = TRUE;
//    [_stats resetActivities];
    [_stats setApplicableStats];
   
}

- (IBAction)btnYesCircumcisedTouchUp:(id)sender {

    if (negPartner.isCircumcised)
        return;
    NSLog(@"HivNegPartnerVC- Male negative partner is circumcised.");
    self.lblCircumcised.text = @"Yes";
    negPartner.isCircumcised = YES;
    [_stats updateStats];
   
    
}

- (IBAction)btnNoCircumcisedTouchUp:(id)sender {
    
    if (negPartner.isCircumcised == FALSE)
        return;
    NSLog(@"HivNegPartnerVC- Male negative partner is not circumcised.");
    self.lblCircumcised.text = @"No";
    negPartner.isCircumcised = NO;
    
}

- (IBAction)btnYesOnPrepTouchUp:(id)sender {
   
    if (negPartner.isOnPrep)
        return;

    NSLog(@"HivNegPartnerVC- Negative partner is on PrEP.");
    self.lblOnPrep.text = @"Yes";
    negPartner.isOnPrep = YES;
    
}

- (IBAction)btnNoOnPrepTouchUp:(id)sender {
    
    if (negPartner.isOnPrep == FALSE)
        return;
    
    NSLog(@"HivNegPartnerVC- Negative partner is not on PrEP.");
    self.lblOnPrep.text = @"No";
    negPartner.isOnPrep = NO;
    
}

@end
