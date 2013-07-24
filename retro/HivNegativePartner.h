//
//  HivNegativePartner.h
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "Partner.h"

@interface HivNegativePartner : Partner

@property BOOL isOnPrep;
@property BOOL isCircumcised;

-(NSString *)getSummaryString;

@end
