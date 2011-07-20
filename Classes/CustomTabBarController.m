//
//  CustomTabBarController.m
//  StockSimulator
//
//  Created by Saven  on 19/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "CustomTabBarController.h"


@implementation CustomTabBarController
@synthesize appDelegate;


// The designated initializer. Override to perform setup that is required before the view is loaded.

- (id)initWithCustomView{
	if ([self init]) 
	{
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		// self.presentView = 1;
	}
	return self;
}

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
	//veeru for  orientation of the image
	
	
	if(interfaceOrientation !=UIInterfaceOrientationPortraitUpsideDown)
	{
		if(appDelegate.orientation_bool)
		{
		    if(interfaceOrientation  == UIInterfaceOrientationPortrait)
			{
				return YES;
			}
			else if((interfaceOrientation  == UIInterfaceOrientationLandscapeLeft || interfaceOrientation  == UIInterfaceOrientationLandscapeRight) && !appDelegate.bigChart_Boolean)
			{
				return YES;
		       
			}
		}
	}
	else
    {
	
	}
		return NO;

		
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}




/*
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
 {
 
 if([viewController.title isEqualToString:@"Accounts"])
 {
 self.presentView = 1;
 return;
 }
 if([viewController.title isEqualToString:@"Portfolio"])
 {
 self.presentView = 2;
 return;
 }
 if([viewController.title isEqualToString:@"Make a Trade"])
 {
 self.presentView = 3;
 return;
 }
 if([viewController.title isEqualToString:@"Top20"])
 {
 self.presentView = 4;
 return;
 }
 }*/	

- (void)dealloc {
	[super dealloc];
}

@end
