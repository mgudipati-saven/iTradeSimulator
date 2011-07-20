
//
//  GameSelectionViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "GameSelectionViewController.h"
@implementation GameSelectionViewController
@synthesize appDelegate;
- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
		
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.title = [NSString stringWithFormat:@"Game List"];
		
		/*UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
		 target:self action:@selector(cancel:)];
		 self.navigationItem.leftBarButtonItem = cancelButton;
		 
		 UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
		 target:self action:@selector(save:)];
		 self.navigationItem.rightBarButtonItem = saveButton;*/
    }
    return self;
}



 - (void)viewDidLoad {
 [super viewDidLoad];
 
	 self.view.backgroundColor = [UIColor blackColor];
 }


- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
	NSIndexPath *tableSelection = [[self tableView] indexPathForSelectedRow];
	[[self tableView] deselectRowAtIndexPath:tableSelection animated:NO];
	[[self tableView] reloadData];
}


/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)cancel:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	
    return [appDelegate accountCount];
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
    static NSString *CellIdentifier = @"ItemName";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
	{
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        cell.backgroundColor = [UIColor blackColor];
		cell.textLabel.textColor = [UIColor orangeColor];
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}
     // Set up the cell...
	UserAccount *account = [appDelegate accountAtIndex:indexPath.row];
	
	if (account.gameID == appDelegate.currentAccount.gameID)
	{
		cell.accessoryType =  UITableViewCellAccessoryCheckmark;
	}
	else
	{
		cell.accessoryType =  UITableViewCellAccessoryNone;
	}
	
	
	cell.textLabel.text = account.gameName;
	[account release];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{

	
	UserAccount *account = [appDelegate accountAtIndex:indexPath.row];
	
	
    //loader
	//[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
	
	[tableView deselectRowAtIndexPath:indexPath animated:NO];
     
	if(appDelegate.currentAccount != nil)
		[appDelegate.currentAccount release];
	
	appDelegate.currentAccount = account;
	
	//[account release];
	//refresh the coounts
	[appDelegate  refreshAccount];
	
	[self.navigationController popViewControllerAnimated:YES];
}



- (void)dealloc 
{
    [super dealloc];
		
}


@end

