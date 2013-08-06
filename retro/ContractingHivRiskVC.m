//
//  ContractingHivRiskVCViewController.m
//  retro
//
//  Created by jtq6 on 8/5/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "ContractingHivRiskVC.h"
#import "ContractingHivRisk.h"

@interface ContractingHivRiskVC ()

@end

@implementation ContractingHivRiskVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    ContractingHivRisk *chart = (ContractingHivRisk *)self.view;
    chart.stats = self.stats;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotification:)
     name:@"StatsUpdated"
     object:nil];
    
}

-(void)handleNotification:(NSNotification *)pNotification
{
    NSLog(@"Received notification in ContractingHivRiskVC = %@",(NSString*)[pNotification object]);
    [self.view setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
