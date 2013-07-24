//
//  RiskInputVC.m
//  retro
//
//  Created by jtq6 on 7/22/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "RiskInputVC.h"
#import "HivNegPartnerVC.h"
#import "HivPosPartnerVC.h"

@implementation RiskInputVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.lblHivNegPartner.text = @"Unspecified";
    self.lblHivPosPartner.text = @"Unspecified";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"hivNegPartnerSegue"])
    {
        HivNegPartnerVC *negPartnerVC = segue.destinationViewController;
        negPartnerVC.negPartner = self.stats.hivNegPartner;
        
        
    } else if([segue.identifier isEqualToString:@"hivPosPartnerSegue"]){
        
        HivPosPartnerVC *posPartnerVC = segue.destinationViewController;
        posPartnerVC.posPartner = self.stats.hivPosPartner;
        
    }
    
}

- (IBAction)doneHivNegPartner:(UIStoryboardSegue *)segue
{
    self.lblHivNegPartner.text = [self.stats.hivNegPartner getSummaryString];
    
    NSLog(@"doneHivNegPartner in RiskInputVC");
}

- (IBAction)doneHivPosPartner:(UIStoryboardSegue *)segue
{
    self.lblHivPosPartner.text = [self.stats.hivPosPartner getSummaryString];
    
    NSLog(@"doneHivPosPartner in RiskInputVC");
}



@end
