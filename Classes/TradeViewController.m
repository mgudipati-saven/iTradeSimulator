//
//  TradeViewController.m
//  StockSimulator
//
//  Created by isimulator-svnMurthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "TradeViewController.h"
#import "DetailCell.h"
#import "MakeTradeCell.h"


// veeru Private interface for TradeViewController - internal only methods.
@interface TradeViewController ()

@property (retain, nonatomic) UITableView *tableView;
@end


@implementation TradeViewController

@synthesize searchSymbolViewController,appDelegate,submitButton,orderViewController,orderDetails,tableView,typeListViewController,editingViewController,contentOfCurrentProperty;



// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		self.title = @"Make a Trade";
		self.tabBarItem.image = [UIImage imageNamed:@"trade.png"];    
		
		UIBarButtonItem *oderHisButton = [[UIBarButtonItem alloc] initWithTitle:@"Pending Orders" style:UIBarButtonItemStyleBordered
																		target:self action:@selector(showOrderHistory:)];
        self.navigationItem.rightBarButtonItem = oderHisButton;

		[oderHisButton release]; 
	}		 
	
	return self;
	
}

//serach init if  necesary
- (SearchSymbolViewController *)searchSymbolViewController
 {
 // Instantiate the stcok quote view controller if necessary.
 if (searchSymbolViewController == nil) 
 {
 SearchSymbolViewController *controller = [[SearchSymbolViewController alloc] initWithNibName:@"SearchSymbolViewController" bundle:[NSBundle mainBundle]];
 self.searchSymbolViewController = controller;
 [controller release];
 }
 
 return searchSymbolViewController;
 }



- (void)viewDidLoad {
 [super viewDidLoad];
    submitButton.showsTouchWhenHighlighted = YES;
	submitButton.opaque = YES;
	self.tableView.backgroundColor = [UIColor blackColor];
	self.tableView.separatorColor = [UIColor darkGrayColor];
 }


 - (void)viewDidAppear:(BOOL)animated {
	 [super viewDidAppear:animated];
	 
	/* if([[self.orderDetails valueForKey:@"Symbol"] length] != 0 &&  [[self.orderDetails valueForKey:@"Quantity"] length] != 0 )
	 {
		 self.navigationItem.rightBarButtonItem.enabled = YES;
		 
	 }*/
	 [self.tableView reloadData]; 
 }

/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	//	


}*/

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

- (void)submit:(id)sender
{
  //validations here
	if([[self.orderDetails valueForKey:@"Symbol"] length] != 0 &&  [[self.orderDetails valueForKey:@"Quantity"] length] != 0  && [[self.orderDetails valueForKey:@"Price"] integerValue] > 0 )
	{
		[NSThread detachNewThreadSelector:@selector(submitOrder) toTarget:self withObject:nil];
	}
	else
	{
		//alert
		UIAlertView *baseAlert = [[UIAlertView alloc] 
								  initWithTitle:@"Make A Trade " message:@"Please, Fill all the fields" 
								  delegate:self cancelButtonTitle:nil
								  otherButtonTitles:@"OK", nil];
		[baseAlert show];
		[baseAlert release];
	}
}

-(void)submitOrder
{

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	
	UserAccount *account = appDelegate.currentAccount;
		
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/placeOrderAction.action", [appDelegate baseURL]];
	
	NSMutableString *httpBodyString=[[NSMutableString alloc] 
									 initWithFormat:@"symbol=%@&qty=%@&side=%@&ordertype=%@&price=%@&tif=%d&commission=10&userid=%@&accountid=%d",
									 [orderDetails valueForKey:@"Symbol"] == nil ? @"" : [[orderDetails valueForKey:@"Symbol"] uppercaseString], 
									 [orderDetails valueForKey:@"Quantity"] == nil ? @"" : [orderDetails valueForKey:@"Quantity"],
									 [orderDetails valueForKey:@"Order Type"] == nil ? @"" : [orderDetails valueForKey:@"Order Type"], 
									 [orderDetails valueForKey:@"Price Type"] == nil ? @"" : [orderDetails valueForKey:@"Price Type"], 
									 [orderDetails valueForKey:@"Price"] == nil ? @"" : [orderDetails valueForKey:@"Price"], 
									 [[orderDetails valueForKey:@"Term"] isEqualToString:@"Day"] ? 0 : 1,
									 [appDelegate userid],
									 account.accountID];
	NSLog( @"%@", httpBodyString);
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
		/* inform the user that the connection failed */
		NSString *message = NSLocalizedString (@"Unable to initiate request.", 
											   @"NSURLConnection initialization method failed.");
		NSLog( @"Connection Failed -> %@", message);
	}
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
	//											encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	// Parse the xml response.
	NSError *parseError = nil;
	[self parseXMLQuote:data parseError:&parseError];
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;	
	
	NSLog( @"%@", [orderDetails description]);

	// open an alert dialog showing the order id with just an OK button
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:[NSString stringWithFormat:@"Order submitted with ID\n%@", [orderDetails valueForKey:@"Order ID"]]
															 delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"OK" otherButtonTitles:nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	[actionSheet showInView:self.view];
	[actionSheet release];
	
	
	[pool release];
   	
	//refresh the port folio after  submit  the  order
	[appDelegate getPortfolioData];
	//[NSThread detachNewThreadSelector:@selector(getPortfolioData) toTarget:appDelegate withObject:nil];

}


- (TypeListViewController *)typeListViewController
{
    // Instantiate the stcok quote view controller if necessary.
    if (typeListViewController == nil) 
	{
		TypeListViewController *controller = [[TypeListViewController alloc] initWithStyle:UITableViewStyleGrouped];
        self.typeListViewController = controller;
		
		/*
		UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Make a Trade" style:UIBarButtonItemStyleBordered
																	  target:self.typeListViewController action:@selector(myBackAction:)];
        self.typeListViewController.navigationItem.leftBarButtonItem = backButton;
		*/
		//veeru diable  submit button init
		//self.navigationItem.rightBarButtonItem.enabled = NO;
		
		
        [controller release];
    }
	
    return typeListViewController;
}

- (EditingViewController *)editingViewController
{
    // Instantiate the stcok quote view controller if necessary.
    if (editingViewController == nil) 
	{
		EditingViewController *controller = [[EditingViewController alloc] initWithStyle:UITableViewStyleGrouped];
        self.editingViewController = controller;
		[controller release];
    }
	
    return editingViewController;
}

- (OrderViewController *)orderViewController
{
    // Instantiate the stcok quote view controller if necessary.
    if (orderViewController == nil) 
	{
		OrderViewController *controller = [[OrderViewController alloc] initWithNibName:@"OrderViewController" bundle:[NSBundle mainBundle]];
        self.orderViewController = controller;
		[controller release];
    }
    return orderViewController;
}

- (void)setOrderDetails:(NSMutableDictionary *)newDetails 
{
	if (orderDetails != newDetails) 
	{
		[orderDetails release];
		orderDetails = [newDetails mutableCopy];
	}
}

#define DEFAULT_ORDER_TYPE @"Buy"
#define DEFAULT_PRICE_TYPE @"Market"
#define DEFAULT_TERM_TYPE  @"Day"

- (void)resetOrderDetails
{
	[orderDetails removeAllObjects];
	[orderDetails setValue:DEFAULT_ORDER_TYPE forKey:@"Order Type"];
	[orderDetails setValue:DEFAULT_PRICE_TYPE forKey:@"Price Type"];
	[orderDetails setValue:DEFAULT_TERM_TYPE forKey:@"Term"];
}

- (void)initOrderDetails
{
	NSMutableDictionary *defaultOrderDetails = [NSMutableDictionary dictionaryWithObjectsAndKeys:
												DEFAULT_ORDER_TYPE, @"Order Type",
												DEFAULT_PRICE_TYPE, @"Price Type", 
												DEFAULT_TERM_TYPE, @"Term", nil];
	self.orderDetails = defaultOrderDetails;
	[defaultOrderDetails release];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// the user clicked one of the OK/Cancel buttons
	[self resetOrderDetails];
	[[self tableView] reloadData];
}

#pragma mark Table Content and Appearance

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView 
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
    return (section == 0) ? 6 : 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     return 35.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    MakeTradeCell *cell = (MakeTradeCell *)[self.tableView dequeueReusableCellWithIdentifier:@"DefaultViewCell"];
    if (cell == nil) 
	{
        cell = [[[MakeTradeCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"DefaultViewCell"] autorelease];
		cell.description.textColor = [UIColor orangeColor];
		cell.description.font = [UIFont boldSystemFontOfSize:13];
		cell.identifier.textColor = [UIColor whiteColor];
		//access
		UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(0.0,0.0,14,14)] autorelease];
		[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
		cell.accessoryView = accessImage;
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		//cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
	}
	
	cell.accessoryView.hidden = NO;
	
	if (indexPath.section == 0)
	{
		switch (indexPath.row)
		{
			case 0:
			default:
				cell.identifier.text = @"Order Type:";
				cell.description.text = [self.orderDetails valueForKey:@"Order Type"];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				//cell.promptMode = NO;
				break;
				
			case 1:
				cell.identifier.text = @"Symbol:";
				cell.description.text = [self.orderDetails valueForKey:@"Symbol"];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				//cell.promptMode = NO;
				break;
				
			case 2:
				cell.identifier.text = @"Quantity:";
				cell.description.text = [self.orderDetails valueForKey:@"Quantity"];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				//cell.promptMode = NO;
				break;
				
			case 3:
				cell.identifier.text = @"Price Type:";
				cell.description.text = [self.orderDetails valueForKey:@"Price Type"];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				//cell.promptMode = NO;
				break;			
				
			case 4:
				cell.identifier.text = @"Price:";
				cell.description.text = [self.orderDetails valueForKey:@"Price"];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				//cell.promptMode = NO;
				break;			
				
			case 5:
				cell.identifier.text = @"Term:";
				cell.description.text = [self.orderDetails valueForKey:@"Term"];
				cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
				//cell.promptMode = NO;
				break;			
		}
	}
	else
	{
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		switch (indexPath.row)
		{
			
		    case 0:
			default:
				cell.accessoryView.hidden = YES;
				cell.identifier.text = @"Est. Total:";
				
				// Calculate estimated total cost value of the order
				@try
				{
					int qty = [[self.orderDetails valueForKey:@"Quantity"] intValue];
					double price = [[self.orderDetails valueForKey:@"Price"] doubleValue];
					double estTotal = qty * price + 10.0;
					cell.description.text = [NSString stringWithFormat:@"$%0.2F", estTotal];
				}
				@catch (NSException *ex) 
				{
					cell.description.text = [NSString stringWithFormat:@"$%0.2F", 10];
				}
				
				//cell.promptMode = NO;	
				break;
		   
			case 1:
				cell.accessoryView.hidden = YES;
				cell.identifier.text = @"Avl. Cash:";
				cell.description.text =     [NSString stringWithFormat:@"$%0.2F", appDelegate.userProfile.cashBalance];				
				break;
		}	
		
	}
	
    return cell;
}

// The accessory view is on the right side of each cell. We'll use a "disclosure" indicator,
// to indicate to the user that selecting the row will navigate to a new view where details can be edited.
/*
- (UITableViewCellAccessoryType)tableView:(UITableView *)aTableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{
    return (indexPath.section == 0) ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
}
*/
#pragma mark Table Selection 

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.row == 4 || indexPath.row == 5)
	{
		if ([[self.orderDetails valueForKey:@"Price Type"] isEqualToString:@"Market"])
		{
			return nil;
		}
	}
	
	return indexPath;
}

// Called after selection. This will navigate to a new view controller.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Don't maintain the selection. We will navigate to a new view so there's no reason to keep the selection here.
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
	if(indexPath.section == 0)
	{
		if (indexPath.row == 0)
		{
			// Show order type list view to select the type of order (buy, sell, ...)
			TypeListViewController *controller = self.typeListViewController;
			controller.itemName = @"Order Type";
			controller.editingItem = self.orderDetails;
			//controller.types = [self.orderDetails valueForKey:@"Order Types"];
			controller.types = [appDelegate orderTypes];
			[self.navigationController pushViewController:controller animated:YES];
		}
		else if (indexPath.row == 1)
		{
			// Show editing view to edit symbol
			SearchSymbolViewController *controller = self.searchSymbolViewController;
			//controller.chartView.image  = nil;
			controller.editingItem = self.orderDetails;
			[self.navigationController pushViewController:controller animated:YES];		
	
		}
		else if (indexPath.row == 2)
		{
			// Show editing view to edit quantity
			EditingViewController *controller = self.editingViewController;
			controller.itemName = @"Quantity";
			controller.editingItem = self.orderDetails;
			[self.navigationController pushViewController:controller animated:YES];		
		}
		else if (indexPath.row == 3)
		{
			// Show price type list view to select the type of price (Market, Limit, ...)
			TypeListViewController *controller = self.typeListViewController;
			controller.itemName = @"Price Type";
			controller.editingItem = self.orderDetails;
			//controller.types = [self.orderDetails valueForKey:@"Price Types"];
			controller.types = [appDelegate priceTypes];
			[self.navigationController pushViewController:controller animated:YES];
		}
		else if (indexPath.row == 4)
		{
			// Show editing view to edit price
			EditingViewController *controller = self.editingViewController;
			controller.itemName = @"Price";
			controller.editingItem = self.orderDetails;
			[self.navigationController pushViewController:controller animated:YES];		
		}
		else
		{
			// Show tif type list view to select the type of time in force (GTC, GTD, ...)
			TypeListViewController *controller = self.typeListViewController;
			controller.itemName = @"Term";
			controller.editingItem = self.orderDetails;
			//controller.types = [self.orderDetails valueForKey:@"Term Types"];
			controller.types = [appDelegate termTypes];
			[self.navigationController pushViewController:controller animated:YES];
		}
	}	
}

/*
 textField.textColor = [UIColor darkGrayColor];
 
 UIKeyboardTypeDefault,                // Default type for the current input method.
 UIKeyboardTypeASCIICapable,           // Displays a keyboard which can enter ASCII characters.
 UIKeyboardTypeNumbersAndPunctuation,  // Numbers and assorted punctuation.
 UIKeyboardTypeURL,                    // A type optimized for URL entry (shows . / .com prominently).
 UIKeyboardTypeNumberPad,              // A number pad (0-9). Suitable for PIN entry.
 UIKeyboardTypePhonePad,               // A phone pad (1-9, *, 0, #, with letters under the numbers).
 UIKeyboardTypeNamePhonePad,           // A type optimized for entering a person's name or phone number.
 UIKeyboardTypeEmailAddress,           // A type optimized for multiple email address entry (shows space @ . prominently).
 */

#pragma mark Editing

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
	
	NSError *parseError = [xmlParser parserError];
	if (parseError && error) 
	{
		NSLog( @"Failed to parse -> %@", [parseError localizedDescription] );
        *error = parseError;
	}
	
	[xmlParser release];	
}

/* A Sample XML quote.
 
 <order status="known" trades="8">
 <orderid>99B21245-2320-4004-B63F-84C8208C5D9B</orderid>
 <message>Order submitted with orderid 99B21245-2320-4004-B63F-84C8208C5D9B</message>
 <orderdate>2009-04-23 07:16:06 EDT</orderdate>
 <ordertype>BUY</ordertype>
 <symbol>AT</symbol>
 <qty>21</qty>
 <pricetype>Market</pricetype>
 <price>11</price>
 <pricepaid> </pricepaid>
 <status>PENDING</status>
 </order>
 
 */

// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	
	if ([elementName isEqualToString:@"orderid"]) 
	{
		// Create a mutable string to hold the contents of the 'orderid' element.
		// The contents are collected in parser:foundCharacters:.
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else 
	{
		// The element isn't one that we care about, so set the property that holds the 
		// character content of the current element to nil. That way, in the parser:foundCharacters:
		// callback, the string that the parser reports will be ignored.
		self.contentOfCurrentProperty = nil;
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
    if (qName) 
	{
        elementName = qName;
    }
    
	if ([elementName isEqualToString:@"orderid"]) 
	{
		[orderDetails setValue:contentOfCurrentProperty forKey:@"Order ID"];
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

//veeru to hale  back functionality in detail view this  is clallinf  from front view
- (void)myBackAction:(id)sender {
	//veeru to hadle  the  boolean
	//self.pop_boolean = NO;
	[self.navigationController popViewControllerAnimated:YES]; 
}

//orderhistory button
-(IBAction)showOrderHistory:(id)sender
{

	OrderViewController *controller = self.orderViewController;
	[controller getCommunityData];
	[self.navigationController pushViewController:controller animated:YES];
	
	
}


- (void)dealloc 
{   [searchSymbolViewController release];
	[orderViewController release];
    [submitButton release];
  	[tableView release];
	[orderDetails release];
	[typeListViewController release];
	[editingViewController release];
	[contentOfCurrentProperty release];
    
	[super dealloc];

}


@end

