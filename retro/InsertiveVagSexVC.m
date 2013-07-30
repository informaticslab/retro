//
//  InsertiveVagSexVC.m
//  retro
//
//  Created by jtq6 on 7/22/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "InsertiveVagSexVC.h"
#import "AppManager.h"


@implementation InsertiveVagSexVC

AppManager *appMgr;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"InsertiveVagSexVC viewDidLoad().");
    appMgr = [AppManager singletonAppManager];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderActsPerMonthValueChange:(id)sender {
    self.stat.timesPerMonth = (NSUInteger)roundf(self.sliderActsPerMonth.value);
    [self.stats updateStats];
    NSLog(@"Insertive vaginal sex times per month set to %d", self.stat.timesPerMonth);
    
}
     
- (IBAction)sliderCondomUsageValueChange:(id)sender {
    [self.stats updateStats];
    self.stat.percentWithCondomUsage = (NSUInteger)roundf(self.sliderCondomUsage.value);
}


@end
