//
//  EditingViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/17/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EditingViewController.h"

@implementation EditingViewController

@synthesize headerView;
@synthesize itemName;
@synthesize editingItem;

- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
		UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
																					  target:self action:@selector(cancel:)];
		self.navigationItem.leftBarButtonItem = cancelButton;
		
		UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
																					target:self action:@selector(save:)];
        self.navigationItem.rightBarButtonItem = saveButton;
		
		[cancelButton release];
		[saveButton release];
	}
    return self;
}

- (void)viewDidLoad 
{
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor blackColor];

	
	// use an empty view to position the cells in the vertical center of the portion of the view not covered by the keyboard
	self.headerView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 100)] autorelease];
}

- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
	
	self.title = [NSString stringWithFormat:@"Edit %@",itemName];
	
	if (!itemCell)
	{
		itemCell = [[EditableCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"ItemCell"];
		itemCell.textField.textColor = [UIColor orangeColor];
	}
	
	itemCell.textField.placeholder = [NSString stringWithFormat:@"Enter %@",itemName];
	itemCell.textField.text = [editingItem valueForKey:itemName];
	

	//veeru for the changing the  keybord to onlynumbers
	if([itemName isEqual:@"Quantity"])
		itemCell.textField.keyboardType = UIKeyboardTypeNumberPad;	
	
	// Starts editing in the name field and shows the keyboard
	[itemCell.textField becomeFirstResponder];
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */

- (void)viewWillDisappear:(BOOL)animated 
{
	[super viewWillDisappear:animated];
	[itemCell.textField resignFirstResponder];
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

- (void)cancel:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)save:(id)sender 
{
    // save edits to the settings data.
    [editingItem setValue:itemCell.textField.text forKey:itemName];
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
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    return itemCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}

// Make the header height in the first section 45 pixels
- (CGFloat)tableView:(UITableView *)aTableView heightForHeaderInSection:(NSInteger)section 
{
    return (section == 0) ? 45.0 : 10.0;
}

// Show a header for only the first section
- (UIView *)tableView:(UITableView *)aTableView viewForHeaderInSection:(NSInteger)section 
{
    return (section == 0) ? headerView : nil;
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
	[headerView release];
	[itemName release];
	[editingItem release];
}


@end

