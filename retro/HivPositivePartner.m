//
//  HivPositivePartner.m
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "HivPositivePartner.h"

@implementation HivPositivePartner

-(id)init
{
    self = [super init];
    return self;
    
}

-(NSString *)getSummaryString
{
    NSMutableString *summary = [[NSMutableString alloc] initWithString:@""];
    
    if ([self isMale] == TRUE) {
        [summary appendString:@"Male"];
    } else if ([self isFemale]) {
        [summary appendString:@"Female"];
        
    } else {
        [summary appendString:@"Undefined"];
        
    }
    
    if (self.isOnArt)
        [summary appendString:@", on ART"];
    
    return [NSString stringWithString:summary];
    
}

-(BOOL)isDefined
{
    if ([self isFemale] || [self isMale])
        return TRUE;
    return FALSE;
    
}

-(void)resetPartner
{
    [self resetGender];
    _isOnArt = FALSE;
}


@end
