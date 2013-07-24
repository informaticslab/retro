//
//  RiskInputVC.h
//  retro
//
//  Created by jtq6 on 7/22/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexualActStats.h"

@interface RiskInputVC : UITableViewController

@property(nonatomic, weak) UIPopoverController *popover;
@property(nonatomic, weak) SexualActStats *stats;
@property (weak, nonatomic) IBOutlet UILabel *lblHivNegPartner;
@property (weak, nonatomic) IBOutlet UILabel *lblHivPosPartner;

- (IBAction)doneHivNegPartner:(UIStoryboardSegue *)segue;
- (IBAction)doneHivPosPartner:(UIStoryboardSegue *)segue;


@end
