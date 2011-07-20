//
//  TypeListViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TypeListViewController.h"


@implementation TypeListViewController

@synthesize editingItem, itemName, types;

- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{

	}
    return self;
}


 - (void)viewDidLoad {
 [super viewDidLoad];
	 self.view.backgroundColor = [UIColor blackColor];
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 }


- (void)viewWillAppear:(BOOL)animated 
{
    //[super viewWillAppear:animated];
	self.title = [NSString stringWithFormat:@"%@ List", itemName];
	NSIndexPath *tableSelection = [[self tableView] indexPathForSelectedRow];
	[[self tableView] deselectRowAtIndexPath:tableSelection animated:NO];
	[[self tableView] reloadData];
}

 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];    
 }

 - (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

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

#pragma mark Table view methods

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return [types count];
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
		cell.selectionStyle  = UITableViewCellSelectionStyleGray;
	}
    
    // Set up the cell...
	cell.textLabel.text = [types objectAtIndex:indexPath.row];
	
    return cell;
}

// Selection updates the game and navigates to the previous view controller.
- (NSIndexPath *)tableView:(UITableView *)aTableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [editingItem setValue:[types objectAtIndex:indexPath.row] forKey:itemName];
	[self.navigationController popViewControllerAnimated:YES];
    return indexPath;
}

// Return a checkmark accessory for only the currently selected type.
- (UITableViewCellAccessoryType)tableView:(UITableView *)aTableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{
	return ([[types objectAtIndex:indexPath.row] isEqualToString:[editingItem valueForKey:itemName]]) ? 
	UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
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


- (void)dealloc 
{
    [super dealloc];
	[editingItem release];
	[itemName release];
	[types release];
}


@end

