//
//  HivNegPartnerVC.h
//  retro
//
//  Created by jtq6 on 7/19/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HivNegativePartner.h"

@interface HivNegPartnerVC : UIViewController
- (IBAction)btnMaleTouchUp:(id)sender;
- (IBAction)btnFemaleTouchUp:(id)sender;
- (IBAction)btnYesCircumcisedTouchUp:(id)sender;
- (IBAction)btnNoCircumcisedTouchUp:(id)sender;
- (IBAction)btnYesOnPrepTouchUp:(id)sender;
- (IBAction)btnNoOnPrepTouchUp:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnMale;
@property (weak, nonatomic) IBOutlet UIButton *btnFemale;
@property (weak, nonatomic) IBOutlet UIButton *btnYesCircumcised;
@property (weak, nonatomic) IBOutlet UIButton *btnNoCircumcised;
@property (weak, nonatomic) IBOutlet UIButton *btnYesOnPrep;
@property (weak, nonatomic) IBOutlet UIButton *btnNoOnPrep;
@property (strong, nonatomic) NSString *summaryText;

@property (weak, nonatomic) IBOutlet UILabel *lblGender;
@property (weak, nonatomic) IBOutlet UILabel *lblCircumcised;
@property (weak, nonatomic) IBOutlet UILabel *lblOnPrep;
@property (weak, nonatomic) IBOutlet UILabel *lblCircumcisedQuestion;

@property (weak, nonatomic) HivNegativePartner *negPartner;
@end
