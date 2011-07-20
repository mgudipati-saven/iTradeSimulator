//
//  DetailOrderViewController.m
//  StockSimulator
//  PAVAN
//  Created by Saven Technologies on 09/07/09.
//  Copyright 2009 SAVENTECH. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "DetailOrderViewController.h"
#import "DetailCell.h"


@interface DetailOrderViewController ()
@property (retain, nonatomic) UITableView *tableView;
@end

@implementation DetailOrderViewController
@synthesize appDelegate,tableView,data_deatail,CancelButton;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		// Custom initialization
		self.title =[NSString stringWithFormat:@"Order Details"]; 
	
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView 
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
    return 9;
}

//height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 35;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    DetailCell *cell = (DetailCell *)[self.tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    if (cell == nil) 
	{
        cell = [[[DetailCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"DetailCell"] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		cell.value.font = [UIFont boldSystemFontOfSize:13];
	
        //cell.hidesAccessoryWhenEditing = NO;
	}
	switch (indexPath.row) {
		case 0:
			cell.label.text = [NSString stringWithString:@"Order Id"]; 
			cell.value.font = [UIFont boldSystemFontOfSize:9];
			cell.value.text = [NSString stringWithFormat:@"%@",self.data_deatail.orderID];
			break;
		case 1:
			cell.label.text =[NSString stringWithString:@"Order Date"];
			cell.value.text = [NSString stringWithFormat:@"%@",self.data_deatail.orderDate];
			break;
		case 2:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Order Type"]];
			cell.value.text = self.data_deatail.ordertype;
			break;
		case 3:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Symbol"]];
			cell.value.text = self.data_deatail.symbol;
			break;
		case 4:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Quantity"]];
			cell.value.text = self.data_deatail.qty;
			break;
		case 5:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Price Type"]];
			cell.value.text = self.data_deatail.pricetype;
			break;
		case 6:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Price"]];
			cell.value.text = self.data_deatail.price;
			break;
		case 7:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Price Paid"]];
			cell.value.text = self.data_deatail.pricepaid;
			break;
		case 8:
			cell.label.text = [NSString stringWithFormat:@"%@",[NSString stringWithString:@"Status"]];
			cell.value.text = self.data_deatail.status;
			break;
		default:
			break;
	}
	return cell;
}	

// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	
	if ([elementName isEqualToString:@"order"]) 
	{
		// Create a mutable string to hold the contents of the 'orderid' element.
		// The contents are collected in parser:foundCharacters:.

		// open an alert dialog showing the order id with just an OK button
	}	
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	if([self.data_deatail.status isEqual:@"OPEN"])
		[self.CancelButton setHidden:NO];
	else
		[self.CancelButton setHidden:YES];
	[self.tableView reloadData];
}

-(IBAction)CancelAction:(id)sender
{
	
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];	
	/*http://202.53.70.20/simulator/simulator/getOrdersAction.action?userid=a&accountid=1*/
	
	//loader
	
	
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/placeOrderAction.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"userid=%@&accountid=%d&action=cancel&ordertype=market&side=%@&symbol=%@&orderid=%@"
									 ,[appDelegate.gameSettings objectForKey:@"Login ID"],
									 appDelegate.currentAccount.accountID 
									 ,self.data_deatail.ordertype
									 ,self.data_deatail.symbol
									 ,self.data_deatail.orderID];
	
	
	/*NSString *orderID;
	 NSString *orderDate;	
	 NSString *ordertype;
	 NSString *symbol;
	 NSString *qty;
	 NSString *pricetype;
	 NSString *price;
	 NSString *pricepaid;
	 NSString *status;
	 */
	
	NSURL *url=[[NSURL alloc] initWithString:urlString];
	[urlString release];
	
	NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
	[url release];

	[urlRequest setHTTPMethod:@"POST"];
	[urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSUTF8StringEncoding]];
	[httpBodyString release];
	
	NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
	
	if (data == nil) 
	{
		/* inform the user that the connection failed*/
		//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
										//	   @"NSURLConnection initialization method failed.");
		//NSLog( @"Connection Failed -> %@", message);
		//[message release];
	}

	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
	//											encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	//NSError *parseError = nil;
	[self parseXMLQuote:data parseError:nil];
	
	self.data_deatail.status = [NSString stringWithString:@"CANCELLED"];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"Order cancelled with ID\n%@", self.data_deatail.orderID]
															 delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"OK" otherButtonTitles:nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	[self.CancelButton setHidden:YES];
	[actionSheet showInView:self.view];
	[actionSheet release];
	[pool release];
	[self.tableView reloadData];
	[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];	
	
}

- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error
{
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
	// Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
	[xmlParser setDelegate:self];
	
	// Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
	[xmlParser setShouldProcessNamespaces:NO];
	[xmlParser setShouldReportNamespacePrefixes:NO];
	[xmlParser setShouldResolveExternalEntities:NO];
	
	// Parse.
	[xmlParser parse];
	
	/*NSError *parseError = [xmlParser parserError];
	if (parseError && error) 
	{
		NSLog( @"Failed to parse -> %@", [parseError localizedDescription] );
        *error = parseError;
	}
	*/
	//NSLog(@"====%@",[[[self.portfolio_Array objectAtIndex:indexPath.row] retain] objectForKey:@"userid"]);
	
	//NSLog(@"%@ /n",[self.data_deatail description]);
	
	//refresh the tabel
	[xmlParser release];
	//ˆ [self.tableView reloadData];	
}


-(void)set_data_deatail:(OrderHistory *)newData
{
   if(self.data_deatail != nil)
   {
	   [self.data_deatail release];
    }
    self.data_deatail = newData;
	
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Deselect the new row using animation
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];

}
- (void)dealloc {

	[tableView release];
	[data_deatail  release];
	[CancelButton release];
	
    [super dealloc];
}

@end
