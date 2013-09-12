//
//  HivPosPartnerVC.h
//  retro
//
//  Created by jtq6 on 7/22/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SexualActStats.h"

@interface HivPosPartnerVC : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnMale;
@property (weak, nonatomic) IBOutlet UIButton *btnFemale;
@property (weak, nonatomic) IBOutlet UIButton *btnYesOnArt;
@property (weak, nonatomic) IBOutlet UIButton *btnNoOnArt;

@property (weak, nonatomic) IBOutlet UILabel *lblGender;
@property (weak, nonatomic) IBOutlet UILabel *lblOnArt;

@property(weak, nonatomic) SexualActStats *stats;


- (IBAction)btnMaleTouchUp:(id)sender;
- (IBAction)btnFemaleTouchUp:(id)sender;
- (IBAction)btnYesOnArtTouchUp:(id)sender;
- (IBAction)btnNoOnArtTouchUp:(id)sender;


@end
