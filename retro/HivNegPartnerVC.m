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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"HivNegPartnerVC viewDidLoad().");
    appMgr = [AppManager singletonAppManager];
    self.lblCircumcised.text = appMgr.unspecifiedText;
    self.lblGender.text = appMgr.unspecifiedText;
    self.lblOnPrep.text = appMgr.unspecifiedText;
    self.btnNoCircumcised.enabled = FALSE;
    self.btnYesCircumcised.enabled = FALSE;
    self.btnNoCircumcised.hidden = TRUE;
    self.btnYesCircumcised.hidden = TRUE;
    self.lblCircumcisedQuestion.hidden = TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)btnMaleTouchUp:(id)sender {
    
    NSLog(@"HivNegPartnerVC- negative partner is a male.");
    self.lblGender.text = @"Male";
    self.btnNoCircumcised.enabled = TRUE;
    self.btnYesCircumcised.enabled = TRUE;
    self.btnNoCircumcised.hidden = FALSE;
    self.btnYesCircumcised.hidden = FALSE;
    self.lblCircumcisedQuestion.hidden = FALSE;
    
    [self.negPartner genderIsMale];
    

}

- (IBAction)btnFemaleTouchUp:(id)sender {

    NSLog(@"HivNegPartnerVC- negative partner is a female.");
    self.lblGender.text = @"Female";
    self.btnNoCircumcised.enabled = FALSE;
    self.btnYesCircumcised.enabled = FALSE;
    self.lblCircumcised.text = appMgr.unspecifiedText;
    self.btnNoCircumcised.hidden = TRUE;
    self.btnYesCircumcised.hidden = TRUE;
    self.negPartner.isCircumcised = FALSE;
    self.lblCircumcisedQuestion.hidden = TRUE;

    [self.negPartner genderIsFemale];

}

- (IBAction)btnYesCircumcisedTouchUp:(id)sender {

    NSLog(@"HivNegPartnerVC- Male negative partner is circumcised.");
    self.lblCircumcised.text = @"Yes";
    self.negPartner.isCircumcised = YES;

    
}

- (IBAction)btnNoCircumcisedTouchUp:(id)sender {

    NSLog(@"HivNegPartnerVC- Male negative partner is not circumcised.");
    self.lblCircumcised.text = @"No";
    self.negPartner.isCircumcised = NO;

}

- (IBAction)btnYesOnPrepTouchUp:(id)sender {

    NSLog(@"HivNegPartnerVC- Negative partner is on PrEP.");
    self.lblOnPrep.text = @"Yes";
    self.negPartner.isOnPrep = YES;

}

- (IBAction)btnNoOnPrepTouchUp:(id)sender {

    NSLog(@"HivNegPartnerVC- Negative partner is not on PrEP.");
    self.lblOnPrep.text = @"No";
    self.negPartner.isOnPrep = NO;
    
}

@end
