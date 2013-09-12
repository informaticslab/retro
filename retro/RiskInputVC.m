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
    [self updateSummaryLabels];
    [self hideSexActsSection];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotification:)
     name:@"StatsUpdated"
     object:nil];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    
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

-(void)updateSummaryLabels
{
    self.lblHivNegPartner.text = [self.stats.hivNegPartner getSummaryString];
    self.lblHivPosPartner.text = [self.stats.hivPosPartner getSummaryString];
    self.lblInsertiveVagSex.text = [self.stats.insertiveVaginal getSummaryString];
    self.lblReceptiveVagSex.text = [self.stats.receptiveVaginal getSummaryString];
    self.lblInsertiveAnal.text = [self.stats.insertiveAnal getSummaryString];
    self.lblReceptiveAnal.text = [self.stats.receptiveAnal getSummaryString];
    self.lblOralSexFrom.text = [self.stats.receiveOral getSummaryString];
    self.lblOralSexTo.text = [self.stats.giveOral getSummaryString];
    
}

-(void)handleNotification:(NSNotification *)pNotification
{
        // NSLog(@"Received notification in CondomUsageRiskChart = %@",(NSString*)[pNotification object]);
    [self updateSummaryLabels];
}

-(void)showSexActsSection
{
    // only show stats that apply for gender makeup of couple
    [_stats setApplicableStats];
    
    if ([_stats.hivNegPartner isFemale] && [_stats.hivPosPartner isFemale]) {

        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"No data available."
                                                          message:@"Data is not available for female-female discordant couples."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
        [message show];
    }
    
    [self.tableView reloadData];

}

-(void)hideCell:(UITableViewCell *)cellToHide
{
    cellToHide.userInteractionEnabled = NO;
    cellToHide.textLabel.enabled = NO;
    cellToHide.detailTextLabel.enabled = NO;
    cellToHide.textLabel.alpha = 0.35;
    cellToHide.detailTextLabel.alpha = 0.35;

}

-(void)showCell:(UITableViewCell *)cellToShow
{
    cellToShow.userInteractionEnabled = YES;
    cellToShow.textLabel.enabled = YES;
    cellToShow.detailTextLabel.enabled = YES;
    cellToShow.selectionStyle = UITableViewCellSelectionStyleNone;
    cellToShow.textLabel.alpha = 1;
    cellToShow.detailTextLabel.alpha = 1;
    
}

-(void)hideSexActsSection
{
    
    [_stats noApplicableStats];
    [self.tableView reloadData];

}

-(void)resetAll
{
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell.reuseIdentifier isEqualToString:@"insVagCell"]) {
        if (_stats.insertiveVaginal.isApplicable)
            [self showCell:cell];
        else
            [self hideCell:cell];
    }
    else if ([cell.reuseIdentifier isEqualToString:@"recVagCell"]) {
        if (_stats.receptiveVaginal.isApplicable)
            [self showCell:cell];
        else
            [self hideCell:cell];
    }
    else if ([cell.reuseIdentifier isEqualToString:@"insAnalCell"]) {
        if (_stats.insertiveAnal.isApplicable)
            [self showCell:cell];
        else
            [self hideCell:cell];
    }
    else if ([cell.reuseIdentifier isEqualToString:@"recAnalCell"]) {
        if (_stats.receptiveAnal.isApplicable)
            [self showCell:cell];
        else
            [self hideCell:cell];
    }
    else if ([cell.reuseIdentifier isEqualToString:@"recOralCell"]) {
        if (_stats.receiveOral.isApplicable)
            [self showCell:cell];
        else
            [self hideCell:cell];
    }
    else if ([cell.reuseIdentifier isEqualToString:@"giveOralCell"]) {
        if (_stats.giveOral.isApplicable)
            [self showCell:cell];
        else
            [self hideCell:cell];
    }
    
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return @"Part 1: HIV Status information about you and your partner";
    if (section == 1) 
        return @"Part 2: Questions for the HIV Negative partner - your sexual activity and condom use";
    return @"";
    
}



@end
