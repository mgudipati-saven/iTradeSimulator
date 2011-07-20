//
//  SearchSymbolViewController.m
//  StockSimulator
//
//  Created by Saven  on 03/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import "StockSimulatorAppDelegate.h"
#import "SearchSymbolViewController.h"
#import "SearchSymbolDataType.h"


// Private interface for SearchSymbolViewController - internal only methods.
@interface SearchSymbolViewController ()
@property (retain, nonatomic) UITableView *tableView;
@end


@implementation SearchSymbolViewController
@synthesize editSymbolViewController,editingItem,contentOfCurrentProperty,searchDataType,connection,data,appDelegate,serachInput,tableView,symbolsDataArray;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		//appDeleagate
		self.appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.title = @"Stock Finder";
		
		//
		self.symbolsDataArray = [NSMutableArray array];
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.tableView.backgroundColor = [UIColor blackColor];
	self.tableView.separatorColor = [UIColor darkGrayColor];
	self.serachInput.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
	self.serachInput.returnKeyType=UIReturnKeySearch;
	self.serachInput.placeholder = [NSString stringWithString:@"Enter company name"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
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
		
		headerLabel.text = @"Symbols"; // i.e. array element
		[customView addSubview:headerLabel];
		
		return customView;
	
	
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}
//init if  necesary
- (EditSymbolViewController *)editSymbolViewController
{
    // Instantiate the stcok quote view controller if necessary.
    if (editSymbolViewController == nil) 
	{
		EditSymbolViewController *controller = [[EditSymbolViewController alloc] initWithNibName:@"EditSymbolViewController" bundle:[NSBundle mainBundle]];
        self.editSymbolViewController = controller;
		[controller release];
    }
	
    return editSymbolViewController;
}





#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	// Two sections - one for user name, pic and the other for account details.
    //
	return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return [self.symbolsDataArray count];
}


#define LABEL_TAG 1
#define VALUE_TAG 2
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{ 
   
	static NSString *CellIdentifier = @"symbolDetail";
	UILabel *labelLabel, *valueLabel;
	
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) 
	{
		CGRect frame = [self.tableView rectForRowAtIndexPath:indexPath];
		CGFloat boundsX = frame.origin.x;
		//CGFloat boundsY = frame.origin.y;
		CGFloat boundsW = frame.size.width;
		CGFloat boundsH = frame.size.height;
		
        cell = [[[UITableViewCell alloc] initWithFrame:frame reuseIdentifier:CellIdentifier] autorelease];
		
		//access
		UIButton *accessImage = [[[UIButton alloc] initWithFrame:CGRectMake(0.0,0.0,14,14)] autorelease];
		[accessImage setBackgroundImage:[UIImage imageNamed:@"arrow.png"] forState:UIControlStateNormal];
		cell.accessoryView = accessImage;
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		
		labelLabel = [[[UILabel alloc] initWithFrame:CGRectMake(boundsX+20.0, 0.0, boundsW-40.0, boundsH/2.0)] autorelease];
		labelLabel.tag = LABEL_TAG;
		labelLabel.font = [UIFont boldSystemFontOfSize:12];
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
		labelLabel.font = [UIFont boldSystemFontOfSize:13];
	
		[cell.contentView addSubview:valueLabel];
		//cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
		
	} 
	else 
	{
		labelLabel = (UILabel *)[cell.contentView viewWithTag:LABEL_TAG];
		valueLabel = (UILabel *)[cell.contentView viewWithTag:VALUE_TAG];
	}
	
    SearchSymbolDataType  *symbolVisibleData  = [[self.symbolsDataArray objectAtIndex:indexPath.row] retain];


	
	labelLabel.text = symbolVisibleData.symbol;
	valueLabel.text = symbolVisibleData.name;
	
	[symbolVisibleData release];
	return cell;

}

- (void)loadFromURL:(NSURLRequest*)request
{
	if (self.connection!=nil) 
	{
		[self.connection cancel];
		[self.connection release];
	}
    if (self.data!=nil){ 
		[self.data release]; 
		self.data = nil;
	}
    
    self.connection = [[NSURLConnection alloc]
				  initWithRequest:request delegate:self];
    
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Don't maintain the selection. We will navigate to a new view so there's no reason to keep the selection here.
	[self.tableView deselectRowAtIndexPath:indexPath animated:NO];
	
	// Show order type list view to select the type of order (buy, sell, ...)
	
    
	if(indexPath.row<[self.symbolsDataArray count])
	{
		EditSymbolViewController  *controller = self.editSymbolViewController;
		 SearchSymbolDataType  *symbolVisibleData  = [[self.symbolsDataArray objectAtIndex:indexPath.row] retain];
		[self.editingItem setObject:symbolVisibleData.symbol forKey:@"Symbol"];
		  controller.editingItem = self.editingItem;
		  [symbolVisibleData release];
		
		[self.navigationController pushViewController:controller animated:YES];
	}
	
	
	
}	

- (void)connection:(NSURLConnection *)theConnection	didReceiveData:(NSData *)incrementalData {
    
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	if (self.data == nil) {
		self.data =	[[NSMutableData alloc] init];
    }
	
	NSString *xmlData = [[[NSString alloc] initWithBytes:[incrementalData bytes] length:[incrementalData length] 
												encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
    [self.data appendData:incrementalData];

    [self parseXMLQuote:self.data parseError:nil];
	
	[self.tableView reloadData];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)parseXMLQuote:(NSMutableData *)datatoparse parseError:(NSError **)error
{
	
	[self.symbolsDataArray removeAllObjects];
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:datatoparse];
	
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

// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if (qName) 
	{
        elementName = qName;
    }
      
    if ([elementName isEqualToString:@"symbol"]) 
	{
		contentOfCurrentProperty = [NSMutableString string];
    } 
	else if ([elementName isEqualToString:@"name"]) 
	{
		contentOfCurrentProperty = [NSMutableString string];
    } 
	else if ([elementName isEqualToString:@"exchange"]) 
	{
		contentOfCurrentProperty = [NSMutableString string];
    } 
	else if ([elementName isEqualToString:@"type"]) 
	{
		contentOfCurrentProperty = [NSMutableString string];
    } 
	else if ([elementName isEqualToString:@"cusip"]) 
	{
		contentOfCurrentProperty = [NSMutableString string];
    } 
	
	else
	{
		if ([elementName isEqualToString:@"row"]) 
		{
			self.searchDataType = [[SearchSymbolDataType alloc] init];
		}
              
		contentOfCurrentProperty = nil;
    }
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
    if (qName) 
	{
        elementName = qName;
    }
    
    if ([elementName isEqualToString:@"symbol"]) 
	{
		searchDataType.symbol = [NSString stringWithFormat:@"%@",self.contentOfCurrentProperty];
    } 
	else if ([elementName isEqualToString:@"name"]) 
	{
		searchDataType.name = [NSString stringWithFormat:@"%@",self.contentOfCurrentProperty];
    } 
	else if ([elementName isEqualToString:@"exchange"]) 
	{
		searchDataType.exchange = [NSString stringWithFormat:@"%@",self.contentOfCurrentProperty];
    } 
	else if ([elementName isEqualToString:@"type"]) 
	{
		searchDataType.type = [NSString stringWithFormat:@"%@",self.contentOfCurrentProperty];
    } 
	else if ([elementName isEqualToString:@"cusip"]) 
	{
		searchDataType.cusip = [NSString stringWithFormat:@"%@",self.contentOfCurrentProperty];
    } 
	else if ([elementName isEqualToString:@"row"]) 
	{
		[self.symbolsDataArray addObject:self.searchDataType];
		[self.searchDataType release];
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



- (void)connectionDidFinishLoading:(NSURLConnection*)theConnection {
	
  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)getSymbolsData:(id)sender
{
  //[NSThread detachNewThreadSelector:@selector(sendRequest) toTarget:self withObject:nil];
	if([self.serachInput.text length] >0)
		[self sendRequest];
}
- (BOOL)textFieldShouldReturn:(UITextField *)doneButtonPressed
{
	 [self.serachInput resignFirstResponder];
	if([self.serachInput.text length] >0)
	   [self sendRequest];
	return YES;
}

- (void)viewDidAppear:(BOOL)animated {
	[self.serachInput becomeFirstResponder]; 
	
	if([[self.editingItem objectForKey:@"Symbol"] length]>0)
	{
		self.serachInput.text = [self.editingItem objectForKey:@"Symbol"];
		
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		
		NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@=%@",[appDelegate.gameSettings objectForKey:@"Search URL"],self.serachInput.text];
		NSURL *url=[[NSURL alloc] initWithString:urlString];
		NSURLRequest* request = [NSURLRequest requestWithURL:url
												 cachePolicy:NSURLRequestUseProtocolCachePolicy
											 timeoutInterval:60.0];
		[urlString release];
		[url release];
		
		[self loadFromURL:request];
	  
		[pool release];
	}
	
	
	
}


- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	[connection cancel];
	
	[self.symbolsDataArray removeAllObjects];
	[self.tableView reloadData];
	self.serachInput.text =@"";

}
-(void)sendRequest
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
   	NSString *symbolString =  [self.serachInput.text stringByReplacingOccurrencesOfString:@" " withString:@"%20"];

	
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@=%@*",[appDelegate.gameSettings objectForKey:@"Search URL"],symbolString];
	NSURL *url=[[NSURL alloc] initWithString:urlString];
	NSURLRequest* request = [NSURLRequest requestWithURL:url
											 cachePolicy:NSURLRequestUseProtocolCachePolicy
										 timeoutInterval:60.0];
	[urlString release];
	[url release];
	
	NSLog(@"FROMKEYBORD === %@",symbolString);
	NSLog(@"sendRequest ===== %@",request);
	
	[self loadFromURL:request];
	
	[pool release];
}

- (void)dealloc {
	[editSymbolViewController release];
	[editingItem release];
	[searchDataType release];
	[contentOfCurrentProperty release];
	[connection cancel];
    [connection release];
    [data release];	
	[symbolsDataArray release];
	[tableView release];
	[serachInput release];
    [super dealloc];
}


@end
