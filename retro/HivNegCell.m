//
//  HivNegCell.m
//  retro
//
//  Created by jtq6 on 7/23/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "HivNegCell.h"

@implementation HivNegCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.detailTextLabel.text = @"Unspecified";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
