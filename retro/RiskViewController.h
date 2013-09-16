//
//  FirstViewController.h
//  retro
//
//  Created by jtq6 on 7/2/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexualActStats.h"
#import "RiskInputVC.h"


@interface RiskViewController : UIViewController

@property(nonatomic, weak) UIPopoverController *popover;
@property(nonatomic, strong) SexualActStats *stats;
@property(nonatomic, weak) RiskInputVC *riskInputVC;

- (IBAction)btnResetActivitiesTouchUp
:(id)sender;
- (IBAction)btnResetAllTouchUp:(id)sender;
- (IBAction)btnInfoTouchUp:(id)sender;
- (IBAction)btnShareTouchUp:(id)sender;
@end
