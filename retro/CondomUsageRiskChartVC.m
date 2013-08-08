//
//  CondomUsageRiskChartVC.m
//  retro
//
//  Created by jtq6 on 8/2/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "CondomUsageRiskChartVC.h"

@interface CondomUsageRiskChartVC ()

@end

@implementation CondomUsageRiskChartVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CondomUsageRiskChart *chart = (CondomUsageRiskChart *)self.view;
    chart.stats = self.stats;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotification:)
     name:@"StatsUpdated"
     object:nil];
    
}

-(void)handleNotification:(NSNotification *)pNotification
{
//    NSLog(@"Received notification in CondomUsageRiskChart = %@",(NSString*)[pNotification object]);
    [self.view setNeedsDisplay];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
