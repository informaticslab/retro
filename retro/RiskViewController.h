//
//  FirstViewController.h
//  retro
//
//  Created by jtq6 on 7/2/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexualActStats.h"

@interface RiskViewController : UIViewController

@property(nonatomic, weak) UIPopoverController *popover;
@property(nonatomic, strong) SexualActStats *stats;

@end
