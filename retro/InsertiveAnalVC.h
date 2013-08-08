//
//  InsertiveAnalVC.h
//  retro
//
//  Created by jtq6 on 7/23/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexualActStat.h"
#import "SexualActStats.h"

@interface InsertiveAnalVC : UIViewController

- (IBAction)sliderActsPerMonthValueChange:(id)sender;
- (IBAction)sliderCondomUsageValueChange:(id)sender;

@property SexualActStat *stat;
@property SexualActStats *stats;
@property (weak, nonatomic) IBOutlet UISlider *sliderActsPerMonth;
@property (weak, nonatomic) IBOutlet UISlider *sliderCondomUsage;
@property (weak, nonatomic) IBOutlet UILabel *actsPerMonthLabel;
@property (weak, nonatomic) IBOutlet UILabel *condomUsageLabel;

@end
