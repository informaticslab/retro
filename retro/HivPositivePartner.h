//
//  HivPositivePartner.h
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Partner.h"

@interface HivPositivePartner : Partner

@property(nonatomic) BOOL isOnArt;

-(NSString *)getSummaryString;
-(BOOL)isDefined;
-(void)resetPartner;

@end
