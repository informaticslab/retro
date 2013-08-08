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
    
    // initialize sliders
    self.sliderActsPerMonth.value = self.stat.timesPerMonth;
    self.sliderCondomUsage.value = self.stat.percentWithCondomUsage;
    
    _actsPerMonthLabel.text = [NSString stringWithFormat:@"%d", _stat.timesPerMonth ];
    _condomUsageLabel.text = [NSString stringWithFormat:@"%d%%", _stat.percentWithCondomUsage ];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderActsPerMonthValueChange:(id)sender {
    _stat.timesPerMonth = (NSUInteger)roundf(self.sliderActsPerMonth.value);
    _actsPerMonthLabel.text = [NSString stringWithFormat:@"%d", _stat.timesPerMonth];
    [self.stats updateStats];
    
}
     
- (IBAction)sliderCondomUsageValueChange:(id)sender {
    _stat.percentWithCondomUsage = (NSUInteger)roundf(_sliderCondomUsage.value);
    _condomUsageLabel.text = [NSString stringWithFormat:@"%d%%", _stat.percentWithCondomUsage];
    [self.stats updateStats];
}


@end
