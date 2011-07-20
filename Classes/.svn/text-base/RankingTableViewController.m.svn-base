//
//  RankingTableViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 5/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "StockSimulatorAppDelegate.h"
#import "RankingTableViewController.h"
#import "RankingTableViewCell.h"

@implementation RankingTableViewController
@synthesize appDelegate,detailsOfRankerViewController;

- (id)initWithStyle:(UITableViewStyle)style 
{
	// Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
	if (self = [super initWithStyle:style]) 
	{
	    appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.title = @"Top 20";
		self.tabBarItem.image = [UIImage imageNamed:@"ranks.png"];
	}
	return self;
}


 - (void)viewDidLoad {
	 [super viewDidLoad];
	 self.tableView.backgroundColor = [UIColor clearColor];
	 self.tableView.separatorColor = [UIColor darkGrayColor];
    
 }


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */

 - (void)viewWillDisappear:(BOOL)animated {
	 [super viewWillDisappear:animated];
 }
 
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */

- (void)viewWillAppear:(BOOL)animated;
{
	//[super viewDidDisappear:animated];
	[self.tableView reloadData];
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

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	
    return [appDelegate.rankList count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
	static NSString *CellIdentifier = @"RankingCell";
    
	RankingTableViewCell *cell = (RankingTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) 
	{
		cell = [[[RankingTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		//access
		UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(0.0,0.0,14,14)] autorelease];
		[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
		cell.accessoryView = accessImage;
	    cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}
	
   	NSDictionary *rankDetails = [appDelegate getRankerAtIndex:indexPath.row];
		
    // Set up the cell...
	
	//veeru just added one  to start rankl from 1 
	// Rank
	cell.rank.text = [NSString stringWithFormat:@"%d.", indexPath.row+1];
	
	/*// Avatar
	if ([[rankDetails valueForKey:@"gender"] isEqualToString:@"M"])
	{
		cell.avatar.image = [UIImage imageNamed:@"male.png"];
	}
	else
	{
		cell.avatar.image = [UIImage imageNamed:@"female.png"];
	} */
	
	// public or private 
	if ([[rankDetails valueForKey:@"profileflag"] isEqualToString:@"true"])
	{
		cell.avatar.image = [UIImage imageNamed:@"UnlockImage.png"];
	}
	else
	{
		cell.avatar.image = [UIImage imageNamed:@"lockImage.png"];
	}
	
	//fav
	if ([[rankDetails valueForKey:@"isfav"] isEqualToString:@"true"])
	{
		cell.favAvatar.image = [UIImage imageNamed:@"fav.png"];
	}
	else
	{
		cell.favAvatar.image = [UIImage imageNamed:@"notFav.png"];
	}
	
	// User ID
	cell.userid.text = [rankDetails valueForKey:@"userid"];
	
	// Portfolio Value
	double portfolioValue = [[rankDetails valueForKey:@"portfoliovalue"] doubleValue];
	cell.portfolioValue.text = [NSString stringWithFormat:@"$%.2F", portfolioValue];
	[rankDetails  release];
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	
	// Navigation logic may go here. Create and push another view controller.
	
	// Deselect the new row using animation
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

	// Get the open position that is represented by the selected row.
	//OpenPosition *openPostion = [appDelegate openPositionAtIndex:indexPath.row];

	// Setup position detail view controller. This controller will display the full details of an open position.
	DetailsOfRankerViewController *controller = self.detailsOfRankerViewController;
	[controller setRankers:[appDelegate getRankerAtIndex:indexPath.row]];
	
	// push the element view controller onto the navigation stack to display it
	[[self navigationController] pushViewController:controller animated:YES];

}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (DetailsOfRankerViewController *)detailsOfRankerViewController
{
    // Instantiate the position view controller if necessary.
    if (detailsOfRankerViewController == nil) 
	{
		//DetailsOfRankerViewController *controller = [[DetailsOfRankerViewController alloc] initWithStyle:UITableViewStylePlain];
        DetailsOfRankerViewController *controller = [[DetailsOfRankerViewController alloc] initWithNibName:@"DetailsOfRankerViewController" bundle:[NSBundle mainBundle]];
		self.detailsOfRankerViewController = controller;
		
		//veeru  customizing the back button of the positiondetail view
		//UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"Portfolio"	 style:UIBarButtonItemStyleBordered	 target:self.positionViewController action:@selector(myBackAction:)] autorelease];
		//self.positionViewController.navigationItem.hidesBackButton = YES;
		//self.positionViewController.navigationItem.leftBarButtonItem = backButton;
		
        [controller release];
    }
	return detailsOfRankerViewController;
}

-(void)reloadDataFunction
{
	[self.tableView reloadData];
}


- (void)dealloc {
	[detailsOfRankerViewController release];
    [super dealloc];
}


@end

