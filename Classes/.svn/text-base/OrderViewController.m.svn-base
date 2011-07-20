//
//  OrderViewController.m
//  StockSimulator
//  PAVAN
//  Created by Saven Technologies on 09/07/09.
//  Copyright 2009 SAVENTECH. All rights reserved.
//
#import "StockSimulatorAppDelegate.h"
#import "OrderViewController.h"
#import "OrderViewCell.h"


@interface OrderViewController ()

@property (retain, nonatomic) UITableView *tableView;

@end
@implementation OrderViewController
@synthesize appDelegate,detailOrderViewController,content_deatil_dictionary,OrderHistory_Array,tableView,contentOfCurrentProperty;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
       
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		// Custom initialization
		self.title = [NSString stringWithFormat:@"Pending Orders"];
				
        self.OrderHistory_Array = [NSMutableArray array];
		self.content_deatil_dictionary = [[OrderHistory alloc] init];
		}
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
	
	[self getCommunityData];
}
/*- (void)viewDidDisappear:(BOOL)animated
{
	[OrderHistory_Array release];
}
*/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorColor = [UIColor darkGrayColor];
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 35.0f;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   	return [self.OrderHistory_Array count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
   	OrderViewCell *cell = (OrderViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[OrderViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.m_labelleft.font = [UIFont systemFontOfSize:13];
		cell.m_labelright.font = [UIFont systemFontOfSize:10];
		cell.m_status.font = [UIFont boldSystemFontOfSize:9];
		UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(0.0,0.0,14,14)] autorelease];
		[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
		cell.accessoryView = accessImage;
	    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
	
	// Set up the cell...
	OrderHistory  *orderHis = [[self.OrderHistory_Array objectAtIndex:indexPath.row] retain];
	
	cell.m_labelright.text = [NSString stringWithFormat:@"%@",orderHis.orderDate];
	
	cell.m_labelleft.text = [NSString stringWithFormat:@"%@ %i %@ %@ @ $%0.2F."
							 ,orderHis.ordertype
							 ,[orderHis.qty intValue]
							 ,orderHis.symbol 
							 ,orderHis.pricetype  						 
							 ,[orderHis.price doubleValue]];
	
	cell.m_status.text = [NSString stringWithFormat:@"(%@)"
						  ,[orderHis.status uppercaseString]];
	
	[orderHis release];
	
	return cell;
}

/*
- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellAccessoryDisclosureIndicator;
}
*/

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
	

}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	if([elementName isEqualToString:@"order"])
	{
		
		return;
	}
	else if([elementName isEqualToString:@"orderid"])
	{               
		self.contentOfCurrentProperty = [NSMutableString string];
	}	
	else if([elementName isEqualToString:@"orderdate"])
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"ordertype"])
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"symbol"])
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"qty"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"pricetype"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"price"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"pricepaid"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"status"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else
	{
		self.contentOfCurrentProperty = nil;
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{   
	if (qName) 
	{
        elementName = qName;
    }
	if([elementName isEqualToString:@"order"])
	{
		
		[self performSelectorOnMainThread:@selector(setOrder:) withObject:content_deatil_dictionary waitUntilDone:YES];
		
		//[self.OrderHistory_Array addObject:self.content_deatil_dictionary];
        
	}
	
	if([elementName isEqualToString:@"orderid"]) 
	{
		self.content_deatil_dictionary.orderID = self.contentOfCurrentProperty;
	}	
	else if([elementName isEqualToString:@"orderdate"]) 
	{
		self.content_deatil_dictionary.orderDate = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"ordertype"]) 
	{
		self.content_deatil_dictionary.ordertype = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"symbol"]) 
	{
		self.content_deatil_dictionary.symbol = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"qty"]) 
	{
		self.content_deatil_dictionary.qty = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"pricetype"]) 
	{
		self.content_deatil_dictionary.pricetype = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"price"]) 
	{
		self.content_deatil_dictionary.price = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"pricepaid"]) 
	{
		self.content_deatil_dictionary.pricepaid = self.contentOfCurrentProperty;
	}
	else if([elementName isEqualToString:@"status"]) 
	{
		self.content_deatil_dictionary.status = self.contentOfCurrentProperty;
	}		
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.contentOfCurrentProperty) 
	{
        // If the current element is one whose content we care about, append 'string'
        // to the property that holds the content of the current element.
        [self.contentOfCurrentProperty appendString:string];
    }
}

//functions
-(void)getCommunityData
{
	
	[self.OrderHistory_Array removeAllObjects];
	//[self.TempOrderHistory_Array removeAllObjects];
	

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	/*http://202.53.70.20/simulator/simulator/getOrdersAction.action?userid=a&accountid=1*/

	//loader
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];	

	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/getOrdersAction.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	
	//NSMutableString *httpBodyString=[[NSMutableString alloc] initWithString:@"userid=mgudipati"];
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"userid=%@&accountid=%d&filter=OPEN", [appDelegate.gameSettings objectForKey:@"Login ID"],appDelegate.currentAccount.accountID];

	//NSLog(@"=================urlllllllll=======%@?%@",urlString,httpBodyString);
	
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
		//SString *message = NSLocalizedString (@"Unable to initiate request.", 
											  // @"NSURLConnection initialization method failed.");
		//NSLog( @"Connection Failed -> %@", message);
		
	}
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
												//encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	// Parse the xml response.
	[self parseXMLQuote:data parseError:nil];
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	[self.tableView  reloadData];
	[appDelegate hideLoader];
	[pool release];
	
}


- (DetailOrderViewController *)detailOrderViewController
{
    // Instantiate the position view controller if necessary.
    if (detailOrderViewController == nil) 
	{
		DetailOrderViewController *controller = [[DetailOrderViewController alloc] initWithNibName:@"DetailOrderViewController" bundle:[NSBundle mainBundle]];
		
        self.detailOrderViewController = controller;
		
		//veeru  customizing the back button of the positiondetail view
		/*UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"Portfolio"	 style:UIBarButtonItemStyleBordered	 target:self.positionViewController action:@selector(myBackAction:)] autorelease];
		 self.positionViewController.navigationItem.backBarButtonItem = backButton;
		 */
		[controller release];
    }
	
	return detailOrderViewController;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	//condition
	// Setup position detail view controller. This DetailOrderViewController.h will display the full details of an open position.
	DetailOrderViewController *controller = self.detailOrderViewController;
	[controller set_data_deatail:[[self.OrderHistory_Array objectAtIndex:indexPath.row] retain]];
		
	// push the element view controller onto the navigation stack to display it
	//[OrderHistory_Array release];
	[[self navigationController] pushViewController:controller animated:YES];
}

-(void)setOrder:(OrderHistory *)newOrderHistory
{
	[self.OrderHistory_Array addObject:newOrderHistory];
}

- (void)dealloc {
	
	[detailOrderViewController release];
	[content_deatil_dictionary release];
	[contentOfCurrentProperty release];
	[OrderHistory_Array release];
	[tableView release];
    [super dealloc];
}

@end
