//
//  SettingsViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "DetailCell.h"
#import "StockSimulatorAppDelegate.h"

@implementation SettingsViewController

@synthesize   gameSelectionViewController;

- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
        self.title = @"Settings";
		self.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
		/*UIBarButtonItem *loginButton = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStyleBordered
																		target:self action:@selector(login:)];
        self.navigationItem.rightBarButtonItem = loginButton;*/
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor blackColor];
	[self tableView].separatorColor = [UIColor darkGrayColor];
	

}

- (void)viewWillAppear:(BOOL)animated 
{
	// veeru setting boolean this  to  ture
	//self.pop_boolean = YES;	
		
    [[self tableView] reloadData];
}


- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	//veeru to move  the  view  front state beuse when back button is  click it  will pop 2  views  so thst  hadlling the  boolean
	/*if(self.pop_boolean)
		[self.navigationController popViewControllerAnimated:NO];
	*/
	
}




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


- (GameSelectionViewController *)gameSelectionViewController
{
    // Instantiate the game selection controller if necessary.
    if (gameSelectionViewController == nil) 
	{
		GameSelectionViewController *controller = [[GameSelectionViewController alloc] initWithStyle:UITableViewStyleGrouped];
        self.gameSelectionViewController = controller;
		
				
        [controller release];
    }
    return gameSelectionViewController;
}

#pragma mark Table Content and Appearance

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
		// create the parent view that will hold header Label
		UIView* customView = [[[UIView alloc] initWithFrame:CGRectMake(0.0,0.0,300.0,25.0)] autorelease];
		customView.backgroundColor = [UIColor clearColor];
		// create the button object
		UILabel * headerLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
		headerLabel.backgroundColor = [UIColor clearColor];
		headerLabel.opaque = NO;
		headerLabel.textColor = [UIColor orangeColor];
		headerLabel.highlightedTextColor = [UIColor orangeColor];
		headerLabel.font = [UIFont boldSystemFontOfSize:16];
		headerLabel.frame = CGRectMake(5.0, 0.0, 300.0,20.0);
		
		// If you want to align the header text as centered
		// headerLabel.frame = CGRectMake(150.0, 0.0, 300.0, 44.0);
		
		headerLabel.text = @"Select Game"; // i.e. array element
		[customView addSubview:headerLabel];
		
		return customView;

	
}
/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Select Game"
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView 
{
	//development purpose
	return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
	/*//development purpose
	if([[self.data valueForKey:@"Base URL"]  isEqual:@"Development"])	
        return (section == 0) ? 2 : 1;
	else
		return 1;
	 */
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	DetailCell *cell = (DetailCell *)[tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
	if (cell == nil) 
	{
		cell = [[[DetailCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"SettingCell"] autorelease];
	    UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(2.0,0.0,14,14)] autorelease];
		[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
		cell.accessoryView = accessImage;
	    cell.selectionStyle = UITableViewCellSelectionStyleGray;
	
	}

	StockSimulatorAppDelegate *appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
   
		cell.label.text = @"Game:";
		cell.value.text = appDelegate.currentAccount.gameName;
		cell.promptMode = NO;
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 25.0;
}
#pragma mark Table Selection 

// Called after selection. This will navigate to a new view controller.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Don't maintain the selection. We will navigate to a new view so there's no reason to keep the selection here.
	  [tableView deselectRowAtIndexPath:indexPath animated:NO];
		GameSelectionViewController *controller = self.gameSelectionViewController;
		[self.navigationController pushViewController:controller animated:YES];
}	
- (void)dealloc 
{   
	//[loginEditingViewController release];
  

	[gameSelectionViewController release];
	[super dealloc];
}

@end
