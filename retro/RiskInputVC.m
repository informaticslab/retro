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
#import "InsertiveVagSexVC.h"
#import "ReceptiveVagSexVC.h"
#import "InsertiveAnalVC.h"
#import "ReceptiveAnalVC.h"
#import "OralSexFromPosVC.h"
#import "OralSexToPosVC.h"

@implementation RiskInputVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.lblHivNegPartner.text = @"Unspecified";
    self.lblHivPosPartner.text = @"Unspecified";
    self.lblReceptiveAnal.text = @"Unspecified";
    self.lblInsertiveAnal.text = @"Unspecified";
    self.lblOralSexFrom.text = @"Unspecified";
    self.lblOralSexTo.text = @"Unspecified";
    self.lblInsertiveVagSex.text = @"Unspecified";
    self.lblReceptiveVagSex.text = @"Unspecified";
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
        
    } else if([segue.identifier isEqualToString:@"insertiveVaginalSexSegue"]){
    
        InsertiveVagSexVC *insertiveVagSexVC = segue.destinationViewController;
        insertiveVagSexVC.stat = self.stats.insertiveVaginal;
        insertiveVagSexVC.stats = self.stats;
    
    } 
    else if([segue.identifier isEqualToString:@"receptiveVaginalSexSegue"]){
        
        ReceptiveVagSexVC *receptiveVagSexVC = segue.destinationViewController;
        receptiveVagSexVC.stat = self.stats.receptiveVaginal;
        
    } 
    else if([segue.identifier isEqualToString:@"insertiveAnalSegue"]){
        
        InsertiveAnalVC *insertiveAnalVC = segue.destinationViewController;
        insertiveAnalVC.stat = self.stats.insertiveAnal;
        
    }
    else if([segue.identifier isEqualToString:@"receptiveAnalSegue"]){
        
        ReceptiveAnalVC *receptiveAnalVC = segue.destinationViewController;
        receptiveAnalVC.stat = self.stats.receptiveAnal;
        
    }
    else if([segue.identifier isEqualToString:@"oralToPosSegue"]){
        
        OralSexToPosVC *oralSexToPosVC = segue.destinationViewController;
        oralSexToPosVC.stat = self.stats.giveOral;
        
    }
    else if([segue.identifier isEqualToString:@"oralFromPosSegue"]){
        
        OralSexFromPosVC *oralSexFromPosVC = segue.destinationViewController;
        oralSexFromPosVC.stat = self.stats.receiveOral;
        
    }
    
    [self.stats updateStats];
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

- (IBAction)doneInsertiveVagSex:(UIStoryboardSegue *)segue
{
    self.lblInsertiveVagSex.text = [self.stats.insertiveVaginal getSummaryString];
    
    NSLog(@"doneInsertiveVagSex in RiskInputVC");
}

- (IBAction)doneReceptiveVagSex:(UIStoryboardSegue *)segue
{
    self.lblReceptiveVagSex.text = [self.stats.receptiveVaginal getSummaryString];
    
    NSLog(@"doneRecptiveVagSex in RiskInputVC");
}

- (IBAction)doneInsertiveAnal:(UIStoryboardSegue *)segue
{
    self.lblInsertiveAnal.text = [self.stats.insertiveAnal getSummaryString];
    
    NSLog(@"doneInsertiveAnalSex in RiskInputVC");
}

- (IBAction)doneReceptiveAnal:(UIStoryboardSegue *)segue
{
    self.lblReceptiveAnal.text = [self.stats.receptiveAnal getSummaryString];
    
    NSLog(@"doneReceptiveAnalSex in RiskInputVC");
}

- (IBAction)doneOralFromPos:(UIStoryboardSegue *)segue
{
    self.lblOralSexFrom.text = [self.stats.receiveOral getSummaryString];
    
    NSLog(@"doneOralFromPos in RiskInputVC");
}

- (IBAction)doneOralToPos:(UIStoryboardSegue *)segue
{
    self.lblOralSexTo.text = [self.stats.giveOral getSummaryString];
    
    NSLog(@"doneOralToPos in RiskInputVC");
}



@end
