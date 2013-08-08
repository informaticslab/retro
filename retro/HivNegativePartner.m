//
//  HivNegativePartner.m
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "HivNegativePartner.h"

@implementation HivNegativePartner


-(id)init
{
    self = [super init];
    return self;
    
}

-(void) onPrep
{
    self.isOnPrep = TRUE;
}

-(void) offPrep
{
    self.isOnPrep = FALSE;
}

-(void) circumcised
{
    self.isCircumcised = TRUE;
}

-(void) notCircumcised
{
    self.isCircumcised = FALSE;
}

-(BOOL)isDefined
{
    if ([self isFemale] || [self isMale])
        return TRUE;
    return FALSE;
    
}

-(NSString *)getSummaryString
{
    NSMutableString *summary = [[NSMutableString alloc] initWithString:@""];
    
    if ([self isMale] == TRUE) {
        [summary appendString:@"Male"];
    } else if ([self isFemale]) {
        [summary appendString:@"Female"];
        
    }

    if (self.isCircumcised)
        [summary appendString:@", Circumcised"];

    if (self.isOnPrep)
        [summary appendString:@", on PrEP"];
    
    
    return [NSString stringWithString:summary];


}


@end
