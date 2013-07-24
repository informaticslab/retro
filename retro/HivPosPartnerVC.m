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


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"HivPosPartnerVC viewDidLoad().");
    appMgr = [AppManager singletonAppManager];

    self.lblGender.text = appMgr.unspecifiedText;
    self.lblOnArt.text = appMgr.unspecifiedText;

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnMaleTouchUp:(id)sender {
    
    NSLog(@"HivPosPartnerVC- positive partner is a male.");
    self.lblGender.text = @"Male";
    
    [self.posPartner genderIsMale];
    
}

- (IBAction)btnFemaleTouchUp:(id)sender {
    
    NSLog(@"HivPosPartnerVC- positive partner is a female.");
    self.lblGender.text = @"Female";
    
    [self.posPartner genderIsFemale];
    
}


- (IBAction)btnYesOnArtTouchUp:(id)sender {
    
    NSLog(@"HivPosPartnerVC- positive partner is on ART.");
    self.lblOnArt.text = @"Yes";
    self.posPartner.isOnArt = YES;
    
}

- (IBAction)btnNoOnArtTouchUp:(id)sender {
    
    NSLog(@"HivPosPartnerVC- positive partner is not on ART.");
    self.lblOnArt.text = @"No";
    self.posPartner.isOnArt = NO;
    
}




@end
