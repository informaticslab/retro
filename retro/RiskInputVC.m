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

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
        
    return self;
}

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
    
    self.cellInsertiveVag.hidden = TRUE;
    self.cellReceptiveVag.hidden = TRUE;
    self.cellInsertiveAnal.hidden = TRUE;
    self.cellReceptiveAnal.hidden = TRUE;
    self.cellReceiveOral.hidden = TRUE;
    self.cellGiveOral.hidden = TRUE;
    
    self.showActsSection = FALSE;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotification:)
     name:@"StatsUpdated"
     object:nil];

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
        receptiveVagSexVC.stats = self.stats;

    }
    else if([segue.identifier isEqualToString:@"insertiveAnalSegue"]){
        
        InsertiveAnalVC *insertiveAnalVC = segue.destinationViewController;
        insertiveAnalVC.stat = self.stats.insertiveAnal;
        insertiveAnalVC.stats = self.stats;
        
    }
    else if([segue.identifier isEqualToString:@"receptiveAnalSegue"]){
        
        ReceptiveAnalVC *receptiveAnalVC = segue.destinationViewController;
        receptiveAnalVC.stat = self.stats.receptiveAnal;
        receptiveAnalVC.stats = self.stats;

    }
    else if([segue.identifier isEqualToString:@"oralToPosSegue"]){
        
        OralSexToPosVC *oralSexToPosVC = segue.destinationViewController;
        oralSexToPosVC.stat = self.stats.giveOral;
        oralSexToPosVC.stats = self.stats;

    }
    else if([segue.identifier isEqualToString:@"oralFromPosSegue"]){
        
        OralSexFromPosVC *oralSexFromPosVC = segue.destinationViewController;
        oralSexFromPosVC.stat = self.stats.receiveOral;
        oralSexFromPosVC.stats = self.stats;

    }
    
}

- (IBAction)doneHivNegPartner:(UIStoryboardSegue *)segue
{
    self.lblHivNegPartner.text = [self.stats.hivNegPartner getSummaryString];
    if ([_stats.hivNegPartner isDefined] &&  [_stats.hivPosPartner isDefined]) {
        [self showSexActsSection];
    }
    
    NSLog(@"doneHivNegPartner in RiskInputVC");
}

- (IBAction)doneHivPosPartner:(UIStoryboardSegue *)segue
{
    self.lblHivPosPartner.text = [self.stats.hivPosPartner getSummaryString];
    if ([_stats.hivNegPartner isDefined] &&  [_stats.hivPosPartner isDefined]) {
        [self showSexActsSection];
    }
    
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

-(void)handleNotification:(NSNotification *)pNotification
{
        // NSLog(@"Received notification in CondomUsageRiskChart = %@",(NSString*)[pNotification object]);
        self.lblHivNegPartner.text = [self.stats.hivNegPartner getSummaryString];
        self.lblHivPosPartner.text = [self.stats.hivPosPartner getSummaryString];
        self.lblInsertiveVagSex.text = [self.stats.insertiveVaginal getSummaryString];
        self.lblReceptiveVagSex.text = [self.stats.receptiveVaginal getSummaryString];
        self.lblInsertiveAnal.text = [self.stats.insertiveAnal getSummaryString];
        self.lblReceptiveAnal.text = [self.stats.receptiveAnal getSummaryString];
        self.lblOralSexFrom.text = [self.stats.receiveOral getSummaryString];
        self.lblOralSexTo.text = [self.stats.giveOral getSummaryString];
    
}

-(void)showSexActsSection
{
    if ([_stats.hivNegPartner isFemale] && [_stats.hivPosPartner isMale]) {
        self.cellInsertiveVag.hidden = TRUE;
        self.cellReceptiveVag.hidden = FALSE;
        self.cellInsertiveAnal.hidden = TRUE;
        self.cellReceptiveAnal.hidden = FALSE;
        self.cellReceiveOral.hidden = FALSE;
        self.cellGiveOral.hidden = FALSE;
        self.showActsSection = TRUE;
        [self.tableView reloadData];
        
        
    } else if ([_stats.hivNegPartner isMale] && [_stats.hivPosPartner isFemale]) {
        self.cellInsertiveVag.hidden = FALSE;
        self.cellReceptiveVag.hidden = TRUE;
        self.cellInsertiveAnal.hidden = FALSE;
        self.cellReceptiveAnal.hidden = TRUE;
        self.cellReceiveOral.hidden = FALSE;
        self.cellGiveOral.hidden = FALSE;
        self.showActsSection = TRUE;
        [self.tableView reloadData];
        
        
    } else if ([_stats.hivNegPartner isMale] && [_stats.hivPosPartner isMale]) {
        self.cellInsertiveVag.hidden = TRUE;
        self.cellReceptiveVag.hidden = TRUE;
        self.cellInsertiveAnal.hidden = FALSE;
        self.cellReceptiveAnal.hidden = FALSE;
        self.cellReceiveOral.hidden = FALSE;
        self.cellGiveOral.hidden = FALSE;
        self.showActsSection = TRUE;
        [self.tableView reloadData];
        
        
    } else if ([_stats.hivNegPartner isFemale] && [_stats.hivPosPartner isFemale]) {
        self.cellInsertiveVag.hidden = TRUE;
        self.cellReceptiveVag.hidden = TRUE;
        self.cellInsertiveAnal.hidden = TRUE;
        self.cellReceptiveAnal.hidden = TRUE;
        self.cellReceiveOral.hidden = TRUE;
        self.cellGiveOral.hidden = TRUE;
        self.showActsSection = FALSE;
        [self.tableView reloadData];
        
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"No data available."
                                                          message:@"Data is not available for female-female discordant couples."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }

}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"Part 1: HIV Status information about you and your partner";
    if (section == 1 && self.showActsSection) 
        return @"Part 2: Questions for the HIV Negative partner - your sexual activity and condom use";
    return @"";
    
}



@end
