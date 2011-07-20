//
//  CommunityViewController.m
//  StockSimulator
//
//  Created by Saven  on 03/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "StockSimulatorAppDelegate.h"
#import "CommunityViewController.h"
#import "CommunityDefaultViewCell.h"
#import "CustomHeaderViewController.h"

@interface CommunityViewController ()
@property (retain, nonatomic) UITableView *tableView;
@end


@implementation CommunityViewController
@synthesize  appDelegate,current_price,tradeViewController,detailsOfRankerViewController,content_deatil_dictionary,ratingViewController,grouping_specifier,sold_tradeStocks_Array,stocks_rating_boolean,contentOfCurrentProperty,portfolio_Array,activeUsers_Array,buy_rating_Array,sell_rating_Array,bought_tradeStocks_Array,popularTrader_Array,tableView;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		// Custom initialization
		self.title = @"Community";
		self.tabBarItem.image = [UIImage imageNamed:@"community.png"];
	
		//initalize the array
		self.portfolio_Array = [NSMutableArray array];
		self.activeUsers_Array = [NSMutableArray array];
		self.buy_rating_Array = [NSMutableArray array];
		self.sell_rating_Array = [NSMutableArray array];
		self.bought_tradeStocks_Array = [NSMutableArray array];
		self.popularTrader_Array = [NSMutableArray array];
		self.sold_tradeStocks_Array = [NSMutableArray array];
		self.contentOfCurrentProperty = nil;
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
	self.tableView.backgroundColor = [UIColor blackColor];
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
    return 7;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return 5;
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	NSString *header;
	switch (section) {
		case 0:
			header = [[NSString alloc] initWithString:@"Top Performing Portfolio's"];
			break;
		case 1:
			header = [[NSString alloc] initWithString:@"Most Active Users"];
			break;
		case 2:
			header = [[NSString alloc] initWithString:@"Buy Sell Rating"];
			break;
		case 3:
			header = [[NSString alloc] initWithString:@"Buy"];
			break;
		case 4:
			header = [[NSString alloc] initWithString:@"Sell"];
			break;	
		case 5:
			header = [[NSString alloc] initWithString:@"Top Simulated Traded Stocks"];
			break;
		case 6:
			header = [[NSString alloc] initWithString:@"Bought"];
			break;
		case 7:
			header = [[NSString alloc] initWithString:@"Sold"];
			break;	
		default :	
			header = [[NSString alloc] initWithString:@"Most Popular Traders"];
			break;	
	}
	
	return header;
}
 */
//height of header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 30.0; 
}

//height
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 35.0f;
}*/
//customizing the header 
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if(section == 2 || section == 3)
	{	
		UIView *header=[[[UIView alloc] initWithFrame:self.tableView.tableHeaderView.frame] autorelease];
		UIImageView *image =[[UIImageView alloc] initWithFrame:CGRectMake(20,5,20,17)];		
		image.backgroundColor = [UIColor clearColor];
		if(section == 2)
			image.image = [UIImage imageNamed:@"Bull.png"];
		else
			image.image = [UIImage imageNamed:@"Bear.png"];
		
		UILabel *subTitle =[[UILabel alloc] initWithFrame:CGRectMake(45,6,100,15)];
		if(section == 2)
			subTitle.text = @"Buy Rating";
		else
			subTitle.text = @"Sell Rating";
		
		subTitle.font = [UIFont boldSystemFontOfSize:13];
		subTitle.backgroundColor = [UIColor clearColor];
		subTitle.textColor = [UIColor orangeColor]; 
		[header addSubview:image];
		[header addSubview:subTitle];
		//[title release];
		[image release];
		[subTitle release];
		return header;
	}
	else
	{
		CustomHeaderViewController *cus_header=[[[CustomHeaderViewController alloc] initWithFrame:self.tableView.tableHeaderView.frame] autorelease];
	 
		switch (section) {
			case 0:
				cus_header.header.text = @"Top Performing Portfolio's";
				cus_header.leftLable.text = @"User ";
				cus_header.rightLabel.text = @"Portfolio";
				break;
			case 1:
				cus_header.header.text = @"Most Active Users";
				cus_header.leftLable.text = @"User ";
				cus_header.rightLabel.text = @"Trades";
				break;		
			case 4:
				cus_header.header.text = @"Top Traded Stocks (Bought)";
				cus_header.leftLable.text = @"Symbol ";
				cus_header.rightLabel.text = @"Trades";
				break;	
		  	case 5:
				cus_header.header.text = @"Top Traded Stocks (Sold)";
				cus_header.leftLable.text = @"Symbol ";
				cus_header.rightLabel.text = @"Trades";
				break;	
			case 6:
				cus_header.header.text = @"Most Popular Traders";
				cus_header.leftLable.text = @"User ";
				cus_header.rightLabel.text = @"Trades";
				break;			
		}		
	   return cus_header;
    }
	
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
	static NSString *MyIdentifier_SYMBOL = @"SYMBOLS_IDENTIFIER";

	CommunityDefaultViewCell *cell = (CommunityDefaultViewCell *)[self.tableView dequeueReusableCellWithIdentifier:MyIdentifier_SYMBOL];
	if (cell == nil) 
	{
		cell = [[[CommunityDefaultViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:MyIdentifier_SYMBOL] autorelease];
	    cell.description.textAlignment = UITextAlignmentCenter;
		cell.description.textColor = [UIColor orangeColor];
		cell.description.font = [UIFont boldSystemFontOfSize:13];
		cell.identifier.textColor = [UIColor whiteColor];
		//access
		UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(0.0,0.0,14,14)] autorelease];
		[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
		cell.accessoryView = accessImage;
		
	    cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}
	
	
	if(indexPath.section == 0)
	{
		//the is for buy
		if(indexPath.row < [self.portfolio_Array count])
		{
			//nsmutall dic
			NSMutableDictionary *portfolioDict = [[self.portfolio_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[portfolioDict objectForKey:@"userid"]];
			cell.description.text =[NSString stringWithFormat:@"$%0.2F",[[portfolioDict  objectForKey:@"portfoliovalue"] doubleValue]];
			
			[portfolioDict release];
			
			cell.accessoryView.hidden = NO;
			
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];	
			cell.accessoryView.hidden = YES;
			
		}
	}
	else if(indexPath.section == 1)
	{
		//the is for buy
		if(indexPath.row < [self.activeUsers_Array count])
		{
			NSMutableDictionary *activeUsers_Array_Dict = [[self.activeUsers_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[activeUsers_Array_Dict objectForKey:@"userid"]];
			cell.description.text =[NSString stringWithFormat:@"%i",[[activeUsers_Array_Dict objectForKey:@"tradescount"] integerValue]];
			[activeUsers_Array_Dict release];
			cell.accessoryView.hidden = NO;
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];	
			cell.accessoryView.hidden = YES;
		}
	}
	else if(indexPath.section == 2)
	{
		//the is for buy
		if(indexPath.row < [self.buy_rating_Array count])
		{
			//nsmutall dic
			NSMutableDictionary *nsdict = [[self.buy_rating_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[nsdict objectForKey:@"symbol"]];
			cell.description.text = [NSString stringWithString:@""];
			cell.accessoryView.hidden = NO;
			[nsdict release];
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];
		    cell.accessoryView.hidden = YES;
		}
	}
	else if(indexPath.section == 3)
	{
		//this for  sell
		if(indexPath.row < [self.sell_rating_Array count])
		{
			//nsmutall dic
			NSMutableDictionary *sell_rating_Array_dict = [[self.sell_rating_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[sell_rating_Array_dict objectForKey:@"symbol"]]; 
			cell.description.text = [NSString stringWithString:@""];
			[sell_rating_Array_dict release];
			cell.accessoryView.hidden = NO;
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];
			cell.accessoryView.hidden = YES;
		}
	}
	else if(indexPath.section == 4)
	{
		//the is for buy
		if(indexPath.row < [self.bought_tradeStocks_Array count])
		{
			NSMutableDictionary *bought_tradeStocks_Array_dict = [[self.bought_tradeStocks_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[bought_tradeStocks_Array_dict objectForKey:@"symbol"]];
			cell.description.text = [NSString stringWithFormat:@"%@",[bought_tradeStocks_Array_dict objectForKey:@"trades"]];
			[bought_tradeStocks_Array_dict release];
			cell.accessoryView.hidden = NO;
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];
			cell.accessoryView.hidden = YES;
		}
	}
	else if(indexPath.section == 5)
	{
		//the is for buy
		if(indexPath.row < [self.sold_tradeStocks_Array count])
		{
			NSMutableDictionary *sold_tradeStocks_Array_dict = [[self.sold_tradeStocks_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[sold_tradeStocks_Array_dict objectForKey:@"symbol"]];
			cell.description.text = [NSString stringWithFormat:@"%@",[sold_tradeStocks_Array_dict objectForKey:@"trades"]];
			[sold_tradeStocks_Array_dict release];
			cell.accessoryView.hidden = NO;
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];	
			cell.accessoryView.hidden = YES;
		}
	}
	else if(indexPath.section == 6)
	{
		//the is for buy
		if(indexPath.row < [self.popularTrader_Array count])
		{
				NSMutableDictionary *popularTrader_Array_Array_dict = [[self.popularTrader_Array objectAtIndex:indexPath.row] retain];
			cell.identifier.text = [NSString stringWithFormat:@"%@",[popularTrader_Array_Array_dict objectForKey:@"userid"]]; 
			cell.description.text =[NSString stringWithFormat:@"%i",[[popularTrader_Array_Array_dict objectForKey:@"favouritecount"] integerValue]];
			[popularTrader_Array_Array_dict release];
			
			cell.accessoryView.hidden = NO;
		}
		else
		{
			cell.identifier.text = [NSString stringWithString:@""];
			cell.description.text = [NSString stringWithString:@""];
			cell.accessoryView.hidden = YES;
		}
	}	
	else
	{
		cell.identifier.text = [NSString stringWithString:@""];
		cell.description.text = [NSString stringWithString:@""];	
	}		
	return cell;
}	

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Deselect the new row using animation
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	if(indexPath.section == 0)
	{
		if(indexPath.row < [self.portfolio_Array count])
		{
			DetailsOfRankerViewController *controller = self.detailsOfRankerViewController;
			[controller setRankers:[[self.portfolio_Array objectAtIndex:indexPath.row] retain]];
			//controller.rankerData = [[[self.portfolio_Array objectAtIndex:indexPath.row] retain] autorelease];
			[[self navigationController] pushViewController:controller animated:YES];
	    }
	}
	else if(indexPath.section == 1)
	{
		//the is for buy
		if(indexPath.row < [self.activeUsers_Array count])
		{
			
			DetailsOfRankerViewController *controller = self.detailsOfRankerViewController;
			[controller setRankers:[[self.activeUsers_Array objectAtIndex:indexPath.row] retain]];
			//controller.rankerData = [[[self.activeUsers_Array objectAtIndex:indexPath.row] retain] autorelease];
			[[self navigationController] pushViewController:controller animated:YES];
		}	
	}
	else if(indexPath.section == 2)
	{
		if(indexPath.row < [self.buy_rating_Array count])
		{
			RatingViewController *controller = self.ratingViewController;
			[controller setdata:[[self.buy_rating_Array objectAtIndex:indexPath.row] retain]];
			//controller.data = [setdata:(NSMutableDictionary *)Newdata [[self.buy_rating_Array objectAtIndex:indexPath.row] retain];
			// push the element view controller onto the navigation stack to display it
			[[self navigationController] pushViewController:controller animated:YES];
	    }
    }
	else if(indexPath.section == 3)
	{
		if(indexPath.row < [self.sell_rating_Array count])
		{ 
			RatingViewController *controller = self.ratingViewController;
			[controller setdata:[[self.sell_rating_Array objectAtIndex:indexPath.row] retain]];
			//controller.data = [[[self.sell_rating_Array objectAtIndex:indexPath.row] retain] autorelease];
			// push the element view controller onto the navigation stack to display it
			[[self navigationController] pushViewController:controller animated:YES];
	    }
	}
	else if(indexPath.section == 4)
	{
		if(indexPath.row < [self.bought_tradeStocks_Array count])
		{	
			TradeViewController *controller = self.tradeViewController ;
			
			NSMutableDictionary *bought_tradeStocks_Array_Data = [[self.sold_tradeStocks_Array objectAtIndex:indexPath.row] retain];
			[self GetCurrentPrice:[bought_tradeStocks_Array_Data objectForKey:@"symbol"]];
			NSMutableDictionary *orderDetails = [NSMutableDictionary dictionaryWithObjectsAndKeys:
												 @"Sell", @"Order Type",
												 [NSString stringWithFormat:@"%@",[bought_tradeStocks_Array_Data objectForKey:@"symbol"]], @"Symbol", 
												 @"0", @"Quantity",
												 @"Market", @"Price Type", 
												 [NSString stringWithFormat:@"%0.2F",self.current_price], @"Price", nil];
			controller.orderDetails = orderDetails;
			[bought_tradeStocks_Array_Data release];
			[[self navigationController] pushViewController:controller animated:YES];
		}	
	}
	else if(indexPath.section == 5)
	{
		//the is for buy
		if(indexPath.row < [self.sold_tradeStocks_Array count])
		{	
			TradeViewController *controller = self.tradeViewController ;
		
			NSMutableDictionary *data = [[self.sold_tradeStocks_Array objectAtIndex:indexPath.row] retain];
						
			[self GetCurrentPrice:[data objectForKey:@"symbol"]];
			NSMutableDictionary *orderDetails = [NSMutableDictionary dictionaryWithObjectsAndKeys:
											  @"Sell", @"Order Type",
											  [NSString stringWithFormat:@"%@",[data objectForKey:@"symbol"]], @"Symbol", 
											  @"0", @"Quantity",
											  @"Market", @"Price Type",
											  [NSString stringWithFormat:@"%0.2F",self.current_price],@"Price",nil];
			controller.orderDetails = orderDetails;
			[data release];
			[[self navigationController] pushViewController:controller animated:YES];
		}
	}
	else if(indexPath.section == 6)
	{
	    if(indexPath.row < [self.popularTrader_Array count])
		{
			DetailsOfRankerViewController *controller = self.detailsOfRankerViewController;
			[controller setRankers:[[self.popularTrader_Array objectAtIndex:indexPath.row] retain]];			
			//controller.rankerData = [[[self.popularTrader_Array objectAtIndex:indexPath.row] retain] autorelease];
			[[self navigationController] pushViewController:controller animated:YES];
		}		
	}		
}	

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

-(void)getCommunityData
{

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	/*http://202.53.70.20/simulator/simulator/community.action?gid=1&userid=a&action=all*/
	//loader
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/community.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"action=all&gid=%d&userid=%@",appDelegate.currentAccount.gameID,[appDelegate.gameSettings objectForKey:@"Login ID"]];
	
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
		//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
		//									   @"NSURLConnection initialization method failed.");
	//	NSLog( @"Connection Failed -> %@", message);
	}
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
	//											encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	// Parse the xml response.
	[self parseXMLQuote:data parseError:nil];
	
	data = nil;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[self.tableView reloadData];
	[pool release];
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
	
	[xmlParser parse];
	//NSLog(@"%@ /n",[self.portfolio_Array description]);
	//NSLog(@"%@ /n",[self.activeUsers_Array description]);
	//NSLog(@"%@ /n",[self.popularTrader_Array description]);
	//NSLog(@"====%@",[[[self.portfolio_Array objectAtIndex:indexPath.row] retain] objectForKey:@"userid"]);
	
	//refresh the tabel
	[xmlParser release];
}

// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	else if([elementName isEqual:@"user"]) 
	{
		self.content_deatil_dictionary = [[NSMutableDictionary alloc] init];
	}	
	else if([elementName isEqual:@"userid"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}	
	else if([elementName isEqual:@"isfav"]) 
	{
		self.contentOfCurrentProperty =[NSMutableString string];
	}
	else if([elementName isEqual:@"recent"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqual:@"portfoliovalue"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqual:@"profileflag"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqual:@"tradescount"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqual:@"favouritecount"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
	}	
	else if ([elementName isEqual:@"community"]) 
	{
		self.contentOfCurrentProperty = nil;
		self.grouping_specifier = 0;
		[self.portfolio_Array removeAllObjects];
		[self.bought_tradeStocks_Array removeAllObjects];
		[self.buy_rating_Array removeAllObjects];
		[self.sell_rating_Array removeAllObjects];
	}
	else if([elementName isEqualToString:@"portfolios"])
	{
		self.contentOfCurrentProperty = nil;
		self.grouping_specifier = 1;
	}
	else if([elementName isEqual:@"activeusers"])
	{
		self.contentOfCurrentProperty = nil;
		self.grouping_specifier = 2; 
	}
	else if([elementName isEqualToString:@"favouriteusers"])
	{
		self.contentOfCurrentProperty = nil;
		self.grouping_specifier = 3; 
	}
			
    else if ([elementName isEqual:@"stocks"]) 
	{
		self.contentOfCurrentProperty = nil;
		self.stocks_rating_boolean = YES; 
	}
	else if ([elementName isEqual:@"rating"]) 
	{
		self.contentOfCurrentProperty = nil;
	   self.stocks_rating_boolean = NO; 	
	}
	else if ([elementName isEqual:@"symbol"]) 
	{
	   	if(self.stocks_rating_boolean)
		{
			if([[attributeDict objectForKey:@"id"] isEqual:@"1"])
				[self.bought_tradeStocks_Array addObject:attributeDict];
			else
				[self.sold_tradeStocks_Array addObject:attributeDict];
		}
		else
		{
			if([[attributeDict objectForKey:@"id"] isEqual:@"1"])
				[self.buy_rating_Array addObject:attributeDict];
		    else
				[self.sell_rating_Array addObject:attributeDict];
		}	
		self.contentOfCurrentProperty = nil;
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
	
	if([elementName isEqualToString:@"user"]) 
	{
		switch (self.grouping_specifier) {
				case 1:
					[self.portfolio_Array addObject:self.content_deatil_dictionary ];
					
					break;
				case 2:
					[self.activeUsers_Array addObject:self.content_deatil_dictionary ];
					break;
				case 3:
					[self.popularTrader_Array addObject:self.content_deatil_dictionary];
					break;
			}
		[self.content_deatil_dictionary release];
	}	
	if([elementName isEqualToString:@"userid"]) 
	{
		//if(self.content_deatil_dictionary != NULL)
		[self.content_deatil_dictionary setObject:self.contentOfCurrentProperty forKey:@"userid"];
		//[self.contentOfCurrentProperty release];
	}	
	if([elementName isEqualToString:@"isfav"]) 
	{
		//if(self.content_deatil_dictionary != NULL)
		[self.content_deatil_dictionary setObject:self.contentOfCurrentProperty forKey:@"isfav"];
		//[self.contentOfCurrentProperty release];
	}
	else if([elementName isEqualToString:@"recent"]) 
	{
		//if(self.content_deatil_dictionary != NULL)
		self.current_price = [self.contentOfCurrentProperty doubleValue];
		//[self.contentOfCurrentProperty release];
	}
	else if([elementName isEqualToString:@"tradescount"]) 
	{
		//if(self.content_deatil_dictionary != NULL)
		[self.content_deatil_dictionary setObject:self.contentOfCurrentProperty forKey:@"tradescount"];
		//[self.contentOfCurrentProperty release];
	}
	else if([elementName isEqualToString:@"favouritecount"]) 
	{
		[self.content_deatil_dictionary setObject:self.contentOfCurrentProperty forKey:@"favouritecount"];
		//[self.contentOfCurrentProperty release];
	}	
	if([elementName isEqualToString:@"profileflag"]) 
	{
		[self.content_deatil_dictionary setObject:self.contentOfCurrentProperty forKey:@"profileflag"];
		//[self.contentOfCurrentProperty release];
	}
	else if([elementName isEqualToString:@"portfoliovalue"]) 
	{
		[self.content_deatil_dictionary setObject:self.contentOfCurrentProperty forKey:@"portfoliovalue"];
		//[self.contentOfCurrentProperty release];
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

//rating 
- (RatingViewController *)ratingViewController
{
    // Instantiate the position view controller if necessary.
    if (ratingViewController == nil) 
	{
		RatingViewController *controller = [[RatingViewController alloc] initWithNibName:@"RatingViewController" bundle:[NSBundle mainBundle]] ;
        self.ratingViewController = controller;
		[controller release];
    }
	return ratingViewController;
}

//detail view controller
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

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	[self.tableView reloadData];
	
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

-(void)GetCurrentPrice:(NSString *)symbol
{
	/*http://202.53.70.20/simulator/simulator/getQuoteAction.action?symbols=IBM&username=chartdev&pwd=chartdev&fields=-decimal,recent*/

	
		// Fetch current quote for the ticker symbol.
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
		//veeru Loader 
		[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
		
		
		NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/getQuoteAction.action?symbols=%@&username=chartdev&pwd=chartdev&fields=-decimal,recent", 
									[appDelegate baseURL],symbol];
		NSURL *url=[[NSURL alloc] initWithString:urlString];
		[urlString release];
		
		NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
		[url release];
		
		//NSLog( @"URL Request -> %@", [urlRequest description]);
		NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:nil error:nil];
		
		if (data == nil) 
		{
			/* inform the user that the connection failed */
			//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
												  // @"NSURLConnection initialization method failed.");
			//NSLog( @"Connection Failed -> %@", message);
		}
		
		//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
		//											encoding:NSUTF8StringEncoding] autorelease];
		//NSLog( @"Get Quote Response = %@", xmlData );
		
		// Parse the xml response.
		NSError *parseError = nil;
		[self parseXMLQuote:data parseError:&parseError];
	
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		data = nil;	
		//veeru Loader 
		[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];
}

- (void)dealloc {
	[tradeViewController release];
	[detailsOfRankerViewController release];
	[content_deatil_dictionary release];
	[ratingViewController release];
	[sold_tradeStocks_Array release];
    [contentOfCurrentProperty release];
	[tableView release];
	[portfolio_Array release];
	[activeUsers_Array release];
	[sell_rating_Array release];
	[buy_rating_Array release];
	[bought_tradeStocks_Array release];
	[popularTrader_Array release];
    [super dealloc];
}

@end
