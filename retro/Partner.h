//
//  Partner.h
//  retro
//
//  Created by jtq6 on 7/3/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum GenderType : NSUInteger {
    GENDER_UNDEFINED,
    GENDER_MALE,
    GENDER_FEMALE
} GenderType;


@interface Partner : NSObject

@property GenderType gender;

-(void) genderIsMale;
-(void) genderIsFemale;
-(BOOL) isFemale;
-(BOOL) isMale;



@end
