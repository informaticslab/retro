//
//  AboutVC.m
//  retro
//
//  Created by jtq6 on 8/12/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "AboutVC.h"


@implementation AboutVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    // Custom initialization
    _labelVersionInfo.text = [self getVersionString];
    _labelBuildInfo.text = [self getBuildString];
}


-(NSString *)getVersionString
{
    
    return [NSString stringWithFormat:@"Version %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
}

-(NSString *)getBuildString
{
    return [NSString stringWithFormat:@"Build %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
