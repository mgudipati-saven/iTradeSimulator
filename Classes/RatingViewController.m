//
//  RatingViewController.m
//  StockSimulator
//
//  Created by Saven  on 05/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "RatingViewController.h"

@interface RatingViewController()
@property (retain, nonatomic) UITableView *tableView;
@end

@implementation RatingViewController
@synthesize data,tableView,appDelegate;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.title = @"Rating";
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
   
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor darkGrayColor];

}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	// Two sections - one for user name, pic and the other for account details.
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
	static NSString *MyIdentifier_RATING = @"RATING_IDENTIFIER";
	
	// Try to retrieve from the table view a now-unused cell with the given identifier
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier_RATING];
	
	// If no cell is available, create a new one using the given identifier
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier_RATING] autorelease];
	    cell.backgroundColor = [UIColor blackColor];
		cell.textLabel.textColor = [UIColor orangeColor];
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}

	if(indexPath.row == 0)
	{
		cell.imageView.image = [UIImage imageNamed:@"ThumbsUp.png"];
		cell.textLabel.text = @"Bull/Buy";
	}
	else
	{
	    cell.imageView.image = [UIImage imageNamed:@"ThumbsDown.png"];
		cell.textLabel.text = @"Bear/Sell";
	}
	return cell;
}


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
	
	headerLabel.text =[self.data objectForKey:@"symbol"]; // i.e. array element
	[customView addSubview:headerLabel];
	
	return customView;
	
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 25.0;
}


/*
- (void)tableView:(UITableView *)CtableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
	[[CtableView cellForRowAtIndexPath:indexPath] setEditingAccessoryType:UITableViewCellAccessoryDisclosureIndicator]; 
	
	if([[self.data objectForKey:@"rating"] isEqual:@"1"] && indexPath.row ==0)
	{
		[[CtableView cellForRowAtIndexPath:indexPath] accessoryType:UITableViewCellAccessoryCheckmark]; 
		//return UITableViewCellAccessoryCheckmark;
	}
	else if([[self.data objectForKey:@"rating"] isEqual:@"2"] && indexPath.row ==1)
	{
		[[CtableView cellForRowAtIndexPath:indexPath] accessoryType:UITableViewCellAccessoryCheckmark];
		//return UITableViewCellAccessoryCheckmark;
	}
} 
*/
// Return a checkmark accessory for only the currently selected game.
- (UITableViewCellAccessoryType)tableView:(UITableView *)aTableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{
	if([[self.data objectForKey:@"rating"] isEqual:@"1"] && indexPath.row ==0)
	{
		return UITableViewCellAccessoryCheckmark;
	}
	else if([[self.data objectForKey:@"rating"] isEqual:@"2"] && indexPath.row ==1)
	{
		return UITableViewCellAccessoryCheckmark;
	}
	else
	{
		return UITableViewCellAccessoryNone;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{    
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	//sending the changing service

	
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
	
	//http://202.53.70.20/simulator/simulator/community.action?userid=a&gid=1&symbol=BAC&rating=1&action=ratestk */
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//loader
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/community.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	NSMutableString *httpBodyString;
    if(indexPath.row == 0) 
	{
		[self.data setValue:@"1" forKey:@"rating"];
		httpBodyString =[[NSMutableString alloc] initWithFormat:@"gid=%d&rating=1&action=ratestk&userid=%@&symbol=%@",appDelegate.currentAccount.gameID,[appDelegate.gameSettings objectForKey:@"Login ID"],[[self.data objectForKey:@"symbol"] uppercaseString]];
	}
	else
	{
		[self.data setValue:@"2" forKey:@"rating"];
	    httpBodyString =[[NSMutableString alloc] initWithFormat:@"gid=%d&rating=2&action=ratestk&userid=%@&symbol=%@",appDelegate.currentAccount.gameID,[appDelegate.gameSettings objectForKey:@"Login ID"],[[self.data objectForKey:@"symbol"] uppercaseString]];
	}
	
	//NSLog(@"=================urlllllllll=======%@?%@",urlString,httpBodyString);
	
	NSURL *url=[[NSURL alloc] initWithString:urlString];
	[urlString release];
	
	NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
	[url release];
		
	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSUTF8StringEncoding]];
	[httpBodyString release];
	
	NSData *data_reponse = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
	
	if (data_reponse == nil) 
	{
		/* inform the user that the connection failed*/
		NSString *message = NSLocalizedString (@"Unable to initiate request.", 
											   @"NSURLConnection initialization method failed.");
		NSLog( @"Connection Failed -> %@", message);
	}
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data_reponse bytes] length:[data_reponse length] 
	//							encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];
	
	//non need  to  refresh the raker view 
	[pool release];
	
	[self.navigationController popViewControllerAnimated:YES];
}
- (void)setdata:(NSMutableDictionary *)Newdata
{
	if(self.data != nil)
		[self.data release];
	
	self.data = Newdata;
		
}
- (void)viewDidAppear:(BOOL)animated {
	
	 [super viewDidAppear:animated];
	 [self.tableView reloadData];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[tableView release];
	[data release];
    [super dealloc];
}

@end
