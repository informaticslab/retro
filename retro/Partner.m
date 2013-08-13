//
//  Partner.m
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "Partner.h"


@implementation Partner


-(id)init
{
    self = [super init];
    self.gender = GENDER_UNDEFINED;
    return self;
    
}

-(void) genderIsMale
{
    self.gender = GENDER_MALE;
}

-(void) genderIsFemale
{
    self.gender = GENDER_FEMALE;
}

-(BOOL) isFemale
{
    if (self.gender == GENDER_FEMALE)
        return TRUE;
    else
        return FALSE;
}

-(BOOL) isMale
{
    if (self.gender == GENDER_MALE)
        return TRUE;
    else
        return FALSE;
}

-(void)resetGender
{
    
    _gender = GENDER_UNDEFINED;
}


@end
