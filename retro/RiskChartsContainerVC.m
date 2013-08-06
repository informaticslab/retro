//
//  RiskChartsContainerVC.m
//  retro
//
//  Created by jtq6 on 7/31/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "RiskChartsContainerVC.h"
#import "SexActRiskChartVC.h"
#import "CondomUsageRiskChartVC.h"
#import "SexualActStats.h"
#import "ContractingHivRiskVC.h"

@interface RiskChartsContainerVC ()

@end

@implementation RiskChartsContainerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"embedSexActRiskSegue"])
    {
        SexActRiskChartVC *destVC = segue.destinationViewController;
        destVC.stats = self.stats;
        
    }
    else if([segue.identifier isEqualToString:@"embedCondomUsageRiskSegue"])
    {
        CondomUsageRiskChartVC *destVC = segue.destinationViewController;
        destVC.stats = self.stats;
        
    }
    else if([segue.identifier isEqualToString:@"embedContractingHivRiskSegue"])
    {
        ContractingHivRiskVC *destVC = segue.destinationViewController;
        destVC.stats = self.stats;
        
    }
    
    
    
    
}



@end
