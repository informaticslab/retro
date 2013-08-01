//
//  OralSexFromPosVC.m
//  retro
//
//  Created by jtq6 on 7/23/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "OralSexFromPosVC.h"
#import "AppManager.h"


@implementation OralSexFromPosVC

AppManager *appMgr;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"OralSexFromPosVC viewDidLoad().");
    appMgr = [AppManager singletonAppManager];

    // initialize sliders
    self.sliderActsPerMonth.value = self.stat.timesPerMonth;
    self.sliderCondomUsage.value = self.stat.percentWithCondomUsage;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderActsPerMonthValueChange:(id)sender {
    self.stat.timesPerMonth = (NSUInteger)roundf(self.sliderActsPerMonth.value);
    [self.stats updateStats];

}
- (IBAction)sliderCondomUsageValueChange:(id)sender {
    self.stat.percentWithCondomUsage = (NSUInteger)roundf(self.sliderCondomUsage.value);
    [self.stats updateStats];

}


@end
