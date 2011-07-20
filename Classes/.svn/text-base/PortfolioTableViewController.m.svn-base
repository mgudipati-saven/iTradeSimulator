//
//  PortfolioTableViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "PortfolioTableViewController.h"
#import "OpenPosition.h"
#import "UserAccount.h"
#import "PieChartViewController.h"
#import "PortfolioTableViewCell.h"
#import "DefaultViewCell.h"



// Private interface for PortfolioTableViewController - internal only methods.
// Private interface for PortfolioTableViewController - internal only methods.
@interface PortfolioTableViewController ()
	@property (retain, nonatomic) UITableView *tableView;
@end

@implementation PortfolioTableViewController
@synthesize appDelegate,positionViewController,tableView,chartView,show_Chart,dataArray,pieChartView;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		self.title = @"Portfolio";
		self.tabBarItem.image = [UIImage imageNamed:@"portfolio.png"];    
		
		UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																					   target:self action:@selector(refresh:)];
        self.navigationItem.rightBarButtonItem = refreshButton;
		
		UIImage *image = [UIImage imageNamed:@"PieChart.png"];
		//UIImage *image = [UIImage imageNamed:@"grid_04.png"];
		
		UIBarButtonItem *chartButton = [[UIBarButtonItem alloc] initWithImage:image  style:UIBarButtonItemStyleBordered  target:self action:@selector(toggleChart:)];
		self.navigationItem.rightBarButtonItem = refreshButton;
		
		self.navigationItem.leftBarButtonItem = chartButton;
		[image release];
		[refreshButton release];
		[chartButton release];
	
	}	 
	return self;

}




 - (void)viewDidLoad {
	 [super viewDidLoad];
	 self.dataArray = [NSMutableArray array]; 
	 pieChartView =[[[PieChartViewController alloc] initChart:CGRectMake(0.0, 0.0,self.chartView.frame.size.width-10,(self.chartView.frame.size.height-100)) data:self.dataArray] autorelease];
	 pieChartView.backgroundColor = [UIColor clearColor];
	 [self.chartView addSubview:pieChartView];
	 self.navigationItem.rightBarButtonItem.enabled = YES;
	 self.tableView.backgroundColor = [UIColor blackColor];
	 self.tableView.separatorColor = [UIColor darkGrayColor];
	 
	 	 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 }


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if(section==1)
	{
	// create the parent view that will hold header Label
	UIView* customView = [[[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0,30.0)] autorelease];
	customView.backgroundColor = [UIColor darkGrayColor];
	// create the button object
	UILabel * headerLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
	headerLabel.backgroundColor = [UIColor clearColor];
	headerLabel.opaque = NO;
	headerLabel.textColor = [UIColor orangeColor];
	headerLabel.highlightedTextColor = [UIColor orangeColor];
	headerLabel.font = [UIFont boldSystemFontOfSize:16];
	headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 20.0);
	
	// If you want to align the header text as centered
	// headerLabel.frame = CGRectMake(150.0, 0.0, 300.0, 44.0);
	
	headerLabel.text = @"Open Positions"; // i.e. array element
	[customView addSubview:headerLabel];
	
	return customView;
	}
	
	return nil;
		
}



 - (void)viewDidAppear:(BOOL)animated {
    
	 [super viewDidAppear:animated];
	  self.show_Chart = YES;
	 [self.chartView setHidden:self.show_Chart];
	   
	 //    
 }

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

- (PositionDetailViewController *)positionViewController
{
    // Instantiate the position view controller if necessary.
    if (positionViewController == nil) 
	{
		PositionDetailViewController *controller = [[PositionDetailViewController alloc] initWithStyle:UITableViewStylePlain];
        self.positionViewController = controller;
		
		//veeru  customizing the back button of the positiondetail view
		/*UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"Portfolio"	 style:UIBarButtonItemStyleBordered	 target:self.positionViewController action:@selector(myBackAction:)] autorelease];
		self.positionViewController.navigationItem.backBarButtonItem = backButton;
	    */
		 [controller release];
    }

	return positionViewController;
}

- (void)refresh:(id)sender
{
	
	
    //[appDelegate getPortfolioData];
	//Spawn a thread to fetch the new portfolio information so that the UI is not blocked while the application fetches the data.
     //[NSThread detachNewThreadSelector:@selector(getPortfolioData) toTarget:appDelegate withObject:nil];	
	[appDelegate getPortfolioData];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section==0)
		return 25.00;
	else
		return 50.00;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	
    
	//NSLog(@"=================count==== %d",[appDelegate openPositionCount]);
	return (section==0)?2:[appDelegate openPositionCount];    
	
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
    static NSString *CellIdentifier = @"PorfolioTableViewCell";
	static NSString *OtherCellIdentifier=@"MartketTabelViewCell";



	// Set the cell's text to the ticker symbol of the open position at the row
    //cell.text = openPosition.symbol;
	
	if(indexPath.section == 0)
	{
		/*cell.symbol.font = [UIFont boldSystemFontOfSize:10];
	   if(indexPath.row==0)
	   {
		   
	     cell.symbol.text = @"Market Value";
	   }
	   else
	   {
	       cell.symbol.text = @"Total Gain(Loss)";
	   }*/
		DefaultViewCell *cell = (DefaultViewCell *)[self.tableView dequeueReusableCellWithIdentifier:OtherCellIdentifier];
		if (cell == nil) 
		{
			cell = [[[DefaultViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:OtherCellIdentifier] autorelease];
		    cell.description.textColor = [UIColor orangeColor];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.description.font = [UIFont boldSystemFontOfSize:12];
			cell.identifier.textColor = [UIColor whiteColor];
			cell.identifier.font = [UIFont boldSystemFontOfSize:13];
		}
		
		if(indexPath.row==0)
		{
		  cell.identifier.text = @"Market Value";
			cell.description.text = [NSString stringWithFormat:@"$%0.2F",(appDelegate.userProfile.portfolio - appDelegate.userProfile.cashBalance)]; 	
			
		}
		else
		{
		    cell.identifier.text = @"% Gain (Loss)";
			
			if (appDelegate.userProfile.ratio < 0)
			{
				cell.description.text = [NSString stringWithFormat:@"(%0.2F)",(appDelegate.userProfile.ratio*-1)];
				cell.description.textColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
			}
			else
			{
				cell.description.text = [NSString stringWithFormat:@"%0.2F",appDelegate.userProfile.ratio];
				cell.description.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
			}
		}
		//cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
	    return cell;
	}	
	else
	{	
		OpenPosition *openPosition = [appDelegate openPositionAtIndex:indexPath.row];
		
		PortfolioTableViewCell *cell = (PortfolioTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		
		if (cell == nil) 
		{
			cell = [[[PortfolioTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
			//cell.hidesAccessoryWhenEditing = NO;
			cell.value.font = [UIFont boldSystemFontOfSize:13];
			cell.gain.font = [UIFont boldSystemFontOfSize:13];
			//access
			UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(0.0,0.0,14,14)] autorelease];
			[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
			cell.accessoryView = accessImage;
			cell.selectionStyle = UITableViewCellSelectionStyleGray;
			//cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
		}
		
		
		cell.symbol.text = openPosition.symbol;
		cell.value.text = [NSString stringWithFormat:@"$%0.2F", openPosition.currentValue];
		if (openPosition.lossOrGain < 0)
		{
			//NSString *val = [[NSString stringWithFormat:@"%0.2F", openPosition.lossOrGain] autorelease]; 
			cell.gain.text = [NSString stringWithFormat:@"($%0.2F)", (-1.0 * openPosition.lossOrGain)];
			cell.gain.textColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
		}
		else
		{
			cell.gain.text = [NSString stringWithFormat:@"$%0.2F", openPosition.lossOrGain];
			cell.gain.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
		}
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;	
		[openPosition release];
		return cell;
		
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Deselect the new row using animation
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    // Navigation logic may go here. Create and push another view controller.
	if(indexPath.section == 1)
	{
	
	
		// Get the open position that is represented by the selected row.
		
		// Setup position detail view controller. This controller will display the full details of an open position.
		PositionDetailViewController *controller = self.positionViewController;
		[controller setOpenPositon:[appDelegate openPositionAtIndex:indexPath.row]];
		//controller.openPosition = openPostion;
	
		// push the element view controller onto the navigation stack to display it
		[[self navigationController] pushViewController:controller animated:YES];
	}
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
//to reload data
- (void)reloadDataFunction{
	
	[self.tableView reloadData];

}

//togglling of chart
- (void)toggleChart:(id)sender{
  
	
	if(self.show_Chart)
	{
		self.navigationItem.leftBarButtonItem.image =  [UIImage imageNamed:@"table.png"];
		//diable the  right button
		self.navigationItem.rightBarButtonItem.enabled =NO;
		
		[self.dataArray removeAllObjects];		
				
		//first add the  cash
		//user cash base
		UserAccount *account = appDelegate.currentAccount;
	    
		//init the data array
		PieChartDataType *chartDatavalue = [[PieChartDataType alloc] init];
		
		chartDatavalue.desc =[NSString stringWithFormat:@"CASH"];
		chartDatavalue.value = account.cashBalance;
		
		//adding cash
		[dataArray addObject:chartDatavalue];
		//[chartDatavalue release];
		
		//to get chart data
		for(int i = 0 ; i<[appDelegate openPositionCount];i=i+1){
			
			//init the data array
			PieChartDataType *chartData = [[PieChartDataType alloc] init];
			
			OpenPosition *openPosition = [appDelegate openPositionAtIndex:i];
			
			chartData.desc = openPosition.symbol;
			chartData.value = (openPosition.purchasePrice * openPosition.quantity) + openPosition.commission;
			
			[dataArray addObject:chartData];
			
			[openPosition release];
			openPosition = nil;
			//[chartData release];
		}
				
		[self.pieChartView changeDataFuntion:dataArray];
		[self.pieChartView setNeedsDisplay];
		
		//flip the view
		[self.chartView setHidden:!self.show_Chart];
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.chartView cache:NO];
		
		[UIView commitAnimations];		
		self.show_Chart = !self.show_Chart;
	}
	else
	{
		self.navigationItem.leftBarButtonItem.image =  [UIImage imageNamed:@"PieChart.png"];
		self.navigationItem.rightBarButtonItem.enabled =YES;
	    [self.chartView setHidden:!self.show_Chart];
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:1.0];
		[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.chartView cache:NO];
		[UIView commitAnimations];
		self.show_Chart = !self.show_Chart;
	}	
}

- (void)dealloc 
{
	[dataArray release];
	[pieChartView release];
	[tableView release];
	[chartView release];
   	[positionViewController release];
	[super dealloc];
}

@end
