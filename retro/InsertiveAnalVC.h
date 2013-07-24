//
//  InsertiveAnalVC.h
//  retro
//
//  Created by jtq6 on 7/23/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexualActStat.h"

@interface InsertiveAnalVC : UIViewController

- (IBAction)sliderActsPerMonthValueChange:(id)sender;
- (IBAction)sliderCondomUsageValueChange:(id)sender;

@property SexualActStat *stat;
@property (weak, nonatomic) IBOutlet UISlider *sliderActsPerMonth;
@property (weak, nonatomic) IBOutlet UISlider *sliderCondomUsage;

@end
