//
//  LoginScreenViewController.m
//  StockSimulator
//
//  Created by Saven  on 25/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LoginScreenViewController.h"


@implementation LoginScreenViewController

@synthesize password,username,loader,loginButton,errormessage,container;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		   self.view.backgroundColor = [UIColor clearColor];
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
	self.errormessage.font =[UIFont boldSystemFontOfSize:13];	
	[self.loader stopAnimating];	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[container release];
	[errormessage release];
	[loginButton release];
	[password release];
	[username release];
	[loader release];
    [super dealloc];
}

@end
