//
//  SexActRiskChartVC.m
//  retro
//
//  Created by jtq6 on 7/25/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "SexActRiskChartVC.h"

@implementation SexActRiskChartVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    SexActRiskChart *chart = (SexActRiskChart *)self.view;
    chart.stats = self.stats;
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(handleNotification:)
     name:@"StatsUpdated"
     object:nil];
    
}
-(void)handleNotification:(NSNotification *)pNotification
{
//    NSLog(@"Received notification in SexActRiskChart = %@",(NSString*)[pNotification object]);
    [self.view setNeedsDisplay];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
