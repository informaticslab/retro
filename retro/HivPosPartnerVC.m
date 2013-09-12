//
//  HivPosPartnerVC.m
//  retro
//
//  Created by jtq6 on 7/22/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "HivPosPartnerVC.h"
#import "AppManager.h"


@implementation HivPosPartnerVC

AppManager *appMgr;
HivPositivePartner *posPartner;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"HivPosPartnerVC viewDidLoad().");
    appMgr = [AppManager singletonAppManager];
    posPartner = _stats.hivPosPartner;
    
    posPartner.hasGenderChanged = FALSE;
    if (posPartner.isDefined) {
        self.lblGender.text = [posPartner getGenderText];
        if (posPartner.isOnArt)
            self.lblOnArt.text = @"Yes";
        else
            self.lblOnArt.text = @"No";
    } else {
        self.lblGender.text = appMgr.unspecifiedText;
        self.lblOnArt.text = appMgr.unspecifiedText;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnMaleTouchUp:(id)sender {
    // if already male do nothing
    if (posPartner.isMale)
        return;

    NSLog(@"HivPosPartnerVC- positive partner is a male.");
    self.lblGender.text = @"Male";
    
    [posPartner genderIsMale];
    posPartner.hasGenderChanged = TRUE;
    //[_stats resetActivities];
    [_stats setApplicableStats];

}

- (IBAction)btnFemaleTouchUp:(id)sender {
    
    if (posPartner.isFemale)
        return;
    NSLog(@"HivPosPartnerVC- positive partner is a female.");
    self.lblGender.text = @"Female";
    
    [posPartner genderIsFemale];
    posPartner.hasGenderChanged = TRUE;
    //[_stats resetActivities];
    [_stats setApplicableStats];
   
}


- (IBAction)btnYesOnArtTouchUp:(id)sender {
    
    if (posPartner.isOnArt)
        return;
    NSLog(@"HivPosPartnerVC- positive partner is on ART.");
    self.lblOnArt.text = @"Yes";
    posPartner.isOnArt = YES;
    [_stats updateStats];
    
}

- (IBAction)btnNoOnArtTouchUp:(id)sender {
    
    if (posPartner.isOnArt == FALSE)
        return;
    NSLog(@"HivPosPartnerVC- positive partner is not on ART.");
    self.lblOnArt.text = @"No";
    posPartner.isOnArt = NO;
    [_stats updateStats];
    
}




@end
