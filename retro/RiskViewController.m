//
//  FirstViewController.m
//  retro
//
//  Created by jtq6 on 7/2/13.
//  Copyright (c) 2013 jtq6. All rights reserved.
//

#import "RiskViewController.h"
#import "SexualActStats.h"
#import "RiskInputVC.h"
@implementation RiskViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)awakeFromNib
{
    SexualActStats *stats = [[SexualActStats alloc] init];
    self.stats = stats;
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    

    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"embedRiskInputSegue"])
    {
        RiskInputVC *destVC = segue.destinationViewController;
        destVC.stats = self.stats;
        
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here.
    
}



@end
