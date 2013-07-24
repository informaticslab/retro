//
//  ReceptiveAnalVC.m
//  retro
//
//  Created by jtq6 on 7/23/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "ReceptiveAnalVC.h"
#import "AppManager.h"


@implementation ReceptiveAnalVC


AppManager *appMgr;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"ReceptiveAnalVC viewDidLoad().");

    appMgr = [AppManager singletonAppManager];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderActsPerMonthValueChange:(id)sender {
    self.stat.timesPerMonth = (NSUInteger)roundf(self.sliderActsPerMonth.value);
}
- (IBAction)sliderCondomUsageValueChange:(id)sender {
    self.stat.percentWithCondomUsage = (NSUInteger)roundf(self.sliderCondomUsage.value);
}

@end
