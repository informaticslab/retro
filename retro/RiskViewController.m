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
#import "RiskChartsContainerVC.h"
#import "AboutVC.h"
#import "AppManager.h"
#import "EulaVC.h"


#define kPDFPageBounds CGRectMake(0, 0, 8.5 * 72, 11 * 72)

@implementation RiskViewController

AppManager *appMgr;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    appMgr = [AppManager singletonAppManager];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    if (appMgr.agreedWithEula == FALSE) {
        [self presentEulaModalView];
    }
    
}



-(void)awakeFromNib
{
    SexualActStats *stats = [[SexualActStats alloc] init];
    self.stats = stats;
    
    
}


- (void)presentEulaModalView
{
    static BOOL alwaysShowEula = TRUE;
    
    if (appMgr.agreedWithEula == TRUE && alwaysShowEula == FALSE)
        return;
    
    // store the data
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *currVersion = [NSString stringWithFormat:@"%@.%@",
                             [appInfo objectForKey:@"CFBundleShortVersionString"],
                             [appInfo objectForKey:@"CFBundleVersion"]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersionEulaAgreed = (NSString *)[defaults objectForKey:@"agreedToEulaForVersion"];
    
    
    // was the version number the last time EULA was seen and agreed to the
    // same as the current version, if not show EULA and store the version number
    if (![currVersion isEqualToString:lastVersionEulaAgreed] || alwaysShowEula) {
        [defaults setObject:currVersion forKey:@"agreedToEulaForVersion"];
        [defaults synchronize];
        NSLog(@"Data saved");
        NSLog(@"%@", currVersion);
        
        //
        [self performSegueWithIdentifier:@"displayEulaSegue" sender:self];
    }
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"embedRiskInputSegue"])
    {
        RiskInputVC *destVC = segue.destinationViewController;
        destVC.stats = self.stats;
        self.riskInputVC = destVC;
        
    }
    else if([segue.identifier isEqualToString:@"embedRiskChartsContainer"])
    {
        RiskChartsContainerVC *destVC = segue.destinationViewController;
        destVC.stats = self.stats;
        
    }
    else if([segue.identifier isEqualToString:@"aboutSegue"])
    {
        // AboutVC *destVC = segue.destinationViewController;
        
    }
    else if([segue.identifier isEqualToString:@"displayEulaSegue"])
    {
        EulaVC *destVC = segue.destinationViewController;
        
    }
}

- (IBAction)doneAbout:(UIStoryboardSegue *)segue
{
    
    NSLog(@"doneAbout in RiskInputVC");
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnActionForSegue:(UIStoryboardSegue *)returnSegue {
    
    // do useful actions here.
    
}



- (IBAction)btnResetActivitiesTouchUp:(id)sender {
    
    [_stats resetActivities];
    
}

- (IBAction)btnResetAllTouchUp:(id)sender {
    
    [_stats resetAll];
    [self.riskInputVC hideSexActsSection];
    
}

- (IBAction)btnInfoTouchUp:(id)sender {
}

- (IBAction)btnShareTouchUp:(id)sender {
    
    NSData *pdfData = [self generatePDFDataForPrinting];

    NSArray *activityItems = @[@"HIV Assessment Share Text", pdfData];
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil] ;
    
    activityController.excludedActivityTypes = [[NSArray alloc] initWithObjects:
                                        UIActivityTypePostToWeibo,
                                        UIActivityTypePostToFacebook,
                                        UIActivityTypePostToTwitter,
                                        UIActivityTypeSaveToCameraRoll,
                                        UIActivityTypeCopyToPasteboard,
                                        UIActivityTypeMessage,
                                        UIActivityTypeAssignToContact,
                                        nil];
    activityController.title = @"Share HIV Assessment Results";
    
   //[self presentViewController:activityController animated:YES completion:nil];
    self.activityPopover = [[UIPopoverController alloc] initWithContentViewController:activityController];
    [self.activityPopover presentPopoverFromBarButtonItem:self.btnShareAction permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];

}

- (NSData *)generatePDFDataForPrinting {
    NSMutableData *pdfData = [NSMutableData data];
    UIGraphicsBeginPDFContextToData(pdfData, kPDFPageBounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawStuffInContext:ctx];  // Method also usable from drawRect:.
    UIGraphicsEndPDFContext();
    return pdfData;
}

- (void)drawStuffInContext:(CGContextRef)ctx {
    UIFont *font = [UIFont fontWithName:@"Zapfino" size:48];
    CGRect textRect = CGRectInset(kPDFPageBounds, 36, 36);
    [@"HIV Assessment Results" drawInRect:textRect withFont:font];
}

@end
