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
@property (weak, nonatomic) IBOutlet UILabel *lblInsertiveVagSex;
@property (weak, nonatomic) IBOutlet UILabel *lblReceptiveVagSex;
@property (weak, nonatomic) IBOutlet UILabel *lblOralSexFrom;
@property (weak, nonatomic) IBOutlet UILabel *lblOralSexTo;
@property (weak, nonatomic) IBOutlet UILabel *lblInsertiveAnal;
@property (weak, nonatomic) IBOutlet UILabel *lblReceptiveAnal;


@property (weak, nonatomic) IBOutlet UITableViewCell *cellInsertiveVag;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellReceptiveVag;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellReceiveOral;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellGiveOral;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellInsertiveAnal;
@property (weak, nonatomic) IBOutlet UITableViewCell *cellReceptiveAnal;


@property bool showActsSection;

- (IBAction)doneHivNegPartner:(UIStoryboardSegue *)segue;
- (IBAction)doneHivPosPartner:(UIStoryboardSegue *)segue;
-(void)hideSexActsSection;


@end
