//
//  PositionDetailViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "StockSimulatorAppDelegate.h"
#import "PositionDetailViewController.h"
#import "TradeViewController.h"

@implementation PositionDetailViewController

//@synthesize openPosition,pop_boolean,tradeViewController;	
@synthesize appDelegate,openPosition,tradeViewController;

- (id)initWithStyle:(UITableViewStyle)style 
{
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) 
	{
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		self.title = @"Position Details";
		
		UIBarButtonItem *sellButton = [[UIBarButtonItem alloc] initWithTitle:@"SELL" style:UIBarButtonItemStyleBordered
																	  target:self action:@selector(sell:)];
		self.navigationItem.rightBarButtonItem = sellButton;
		[sellButton release];
	}
    return self;
}

//veeru  some  probem  so added this
- (TradeViewController *)tradeViewController
{
    // Instantiate the position view controller if necessary.
    if (tradeViewController == nil) 
	{
		//veeru converted  to nib instance
		TradeViewController *controller = [[TradeViewController alloc] initWithNibName:@"TradeViewController" bundle:[NSBundle mainBundle]];
		//TradeViewController *controller = [[TradeViewController alloc] initWithStyle:UITableViewStylePlain];
        self.tradeViewController = controller;
		
		//veeru  customizing the back button of the positiondetail view
		/*
		UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"Portfolio"	 style:UIBarButtonItemStyleBordered	 target:self action:@selector(myBackAction:)] autorelease];
		self.tradeViewController.navigationItem.hidesBackButton = YES;
		self.tradeViewController.navigationItem.leftBarButtonItem = backButton;
		*/
        [controller release];
    }
	return tradeViewController;
}



 - (void)viewDidLoad {
 [super viewDidLoad];
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	 self.view.backgroundColor = [UIColor blackColor];
	 [self tableView].separatorColor = [UIColor darkGrayColor];
 }


- (void)viewWillAppear:(BOOL)animated 
{
	// veeru setting boolean this  to  ture
	//self.pop_boolean = YES;	
	
	[[self tableView] reloadData];
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	
	//veeru to move  the  view  front state beuse when back button is  click it  will pop 2  views  so thst  hadlling the  boolean
	//if(self.pop_boolean)
		//[self.navigationController popViewControllerAnimated:NO];
	
	
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

- (void)sell:(id)sender 
{
	//self.pop_boolean = YES;	
	
	
	NSMutableDictionary *orderDetails = [NSMutableDictionary dictionaryWithObjectsAndKeys:
										 @"Sell", @"Order Type",
										 openPosition.symbol, @"Symbol", 
										 [NSString stringWithFormat:@"%d", openPosition.quantity], @"Quantity",
										 @"Market", @"Price Type", 
										 [NSString stringWithFormat:@"%0.2F", openPosition.currentPrice], @"Price", nil];
	//[appDelegate placeOrder:orderDetails];
    //[self.navigationController popViewControllerAnimated:YES];
	/*TradeViewController *controller = [[TradeViewController alloc] initWithStyle:UITableViewStyleGrouped];
	 controller.orderDetails = orderDetails;
	 //veeru  customizing the back button of the positiondetail view
	 UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"Position Details"	 style:UIBarButtonItemStyleBordered	 target:controller action:@selector(myBackAction:)] autorelease];
	 controller.navigationItem.hidesBackButton = YES;
	 controller.navigationItem.leftBarButtonItem = backButton;
	 //[orderDetails release];
	 [self.navigationController pushViewController:controller animated:YES];
	 */
	//veeru comment above
	// Setup position detail view controller. This controller will display the full details of an open position.
	//moving to the next navigation
	
	TradeViewController *controller = self.tradeViewController;
	controller.orderDetails = orderDetails;
	[self.navigationController pushViewController:controller animated:YES];
	
	
	
	
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return 8;
}

#define LABEL_TAG 1
#define VALUE_TAG 2

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
    static NSString *CellIdentifier = @"PositionDetail";
	UILabel *labelLabel, *valueLabel;
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (cell == nil) 
	{
		CGRect frame = [tableView rectForRowAtIndexPath:indexPath];
		CGFloat boundsX = frame.origin.x;
		//CGFloat boundsY = frame.origin.y;
		CGFloat boundsW = frame.size.width;
		CGFloat boundsH = frame.size.height;
		
        cell = [[[UITableViewCell alloc] initWithFrame:frame reuseIdentifier:CellIdentifier] autorelease];
		
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		labelLabel = [[[UILabel alloc] initWithFrame:CGRectMake(boundsX+20.0, 0.0, boundsW-40.0, boundsH/2.0)] autorelease];
		labelLabel.tag = LABEL_TAG;
		labelLabel.font = [UIFont boldSystemFontOfSize:13];
		labelLabel.backgroundColor = [UIColor clearColor];
		labelLabel.textAlignment = UITextAlignmentLeft;
		labelLabel.textColor = [UIColor whiteColor];
		labelLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		[cell.contentView addSubview:labelLabel];
		
		valueLabel = [[[UILabel alloc] initWithFrame:CGRectMake(boundsX+20.0, boundsH/2.0, boundsW-40.0, boundsH/2.0)] autorelease];
		valueLabel.tag = VALUE_TAG;
		valueLabel.font = [UIFont boldSystemFontOfSize:14];
		valueLabel.backgroundColor = [UIColor clearColor];
		valueLabel.textAlignment = UITextAlignmentRight;
		valueLabel.textColor = [UIColor orangeColor];
		valueLabel.lineBreakMode = UILineBreakModeWordWrap;
		valueLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[cell.contentView addSubview:valueLabel];
		//cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
		
	} 
	else 
	{
		labelLabel = (UILabel *)[cell.contentView viewWithTag:LABEL_TAG];
		valueLabel = (UILabel *)[cell.contentView viewWithTag:VALUE_TAG];
	}
	
	//NSLog( @"Open Position at row %@:", [indexPath description]);
   // NSLog( @"%@", [openPosition description]);
	
    // Setup the position detail view at the row
	switch (indexPath.row) 
	{
		case 0:
		default:
			// Show "Symbol" information
			//cell.text = [[NSString alloc] initWithFormat:@"Symbol = %@", openPosition.symbol];
			labelLabel.text = @"Symbol:";
			valueLabel.text = openPosition.symbol;
			break;
			
		case 1:
			// Show "Descripton" information
			//cell.text = [[NSString alloc] initWithFormat:@"Description = %@", openPosition.desc];
			labelLabel.text = @"Description:";
			valueLabel.text = openPosition.desc;
			break;
			
		case 2:
			// Show "Quantity" information
			//cell.text = [[NSString alloc] initWithFormat:@"Quantity = %d", openPosition.quantity];
			labelLabel.text = @"Quantity:";
			valueLabel.text = [NSString stringWithFormat:@"%d", openPosition.quantity];
			break;
			
		case 3:
			// Show "Current Price" information
			//cell.text = [[NSString alloc] initWithFormat:@"Current Price = %F", openPosition.currentPrice];
			labelLabel.text = @"Current Price:";
			valueLabel.text = [NSString stringWithFormat:@"$%0.2F", openPosition.currentPrice];
			break;
			
		case 4:
			// Show "Price Paid" information
			//cell.text = [[NSString alloc] initWithFormat:@"Price Paid = %F", openPosition.purchasePrice];
			labelLabel.text = @"Price Paid:";
			valueLabel.text = [NSString stringWithFormat:@"$%0.2F", openPosition.purchasePrice];
			break;
			
		case 5:
			// Show "Change" information
			//cell.text = [[NSString alloc] initWithFormat:@"Change = %F", openPosition.netChange];
			labelLabel.text = @"Change:";
			valueLabel.text = [NSString stringWithFormat:@"$%0.2F", openPosition.netChange];
			if (openPosition.netChange < 0)
			{
				valueLabel.textColor = [UIColor redColor];
			}
			else
			{
				valueLabel.textColor = [UIColor greenColor];
			}
			break;
			
		case 6:
			// Show "Current Value" information
			//cell.text = [[NSString alloc] initWithFormat:@"Current Value = %F", openPosition.currentValue];
			labelLabel.text = @"Current Value:";
			valueLabel.text = [NSString stringWithFormat:@"$%0.2F", openPosition.currentValue];
			break;
			
		case 7:
			// Show "Net Gain(Loss)" information
			//cell.text = [[NSString alloc] initWithFormat:@"Net Gain(Loss) = %F", openPosition.lossOrGain];
			labelLabel.text = @"Net Gain(Loss):";
			if (openPosition.lossOrGain < 0)
			{
				
				valueLabel.text = [NSString stringWithFormat:@"$%0.2F", (-1*openPosition.lossOrGain)];
				valueLabel.textColor = [UIColor redColor];
			}
			else
			{
				valueLabel.text = [NSString stringWithFormat:@"$%0.2F", openPosition.lossOrGain];
				valueLabel.textColor = [UIColor greenColor];
			}
			break;
	}
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
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

-(void)setOpenPositon:(OpenPosition *)newOpenPosition
{
 if(self.openPosition !=nil)
	 [self.openPosition release];
 
	self.openPosition = newOpenPosition;
}

- (void)dealloc 
{
	//veeru
	[tradeViewController release];
	[openPosition release];
    [super dealloc];
}


@end

