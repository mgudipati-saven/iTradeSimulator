//
//  NewsViewController.m
//  StockSimulator
//
//  Created by Saven  on 07/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NewsViewController.h"
#import "StockSimulatorAppDelegate.h"
// veeru Private interface for EditSymbolViewController - internal only methods.
@interface NewsViewController ()

@property (retain, nonatomic) UITableView *tableView;


@end

@implementation NewsViewController
@synthesize appDelegate,news_Array,tableView,symbol,contentOfCurrentProperty,date_Array;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
      appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.title = @"News";
		self.view.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
		//symbol = [[NSString alloc] init];
		self.news_Array = [NSMutableArray array];
		self.date_Array = [NSMutableArray array];
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
	tableView.separatorColor = [UIColor orangeColor];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.news_Array count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return  @"";
}
#define LABEL_TAG 1
#define DATE_TAG 2
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell;
	UILabel *labelLabel;
	UILabel *dateLabel;
	
	CGRect frame = [self.tableView rectForRowAtIndexPath:indexPath];
	CGFloat boundsX = frame.origin.x;
	//CGFloat boundsY = frame.origin.y;
	CGFloat boundsW = frame.size.width;
	CGFloat boundsH = frame.size.height;
    
    cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.backgroundColor = [UIColor blackColor];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		 dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(boundsX+10.0, 0.0, boundsW-20, boundsH/3)] autorelease];
		
		labelLabel = [[[UILabel alloc] initWithFrame:CGRectMake(boundsX+10.0, boundsH/3, boundsW-20, 2*boundsH/3)] autorelease];
		
		labelLabel.tag = LABEL_TAG;
		dateLabel.tag = DATE_TAG;
		dateLabel.font = [UIFont boldSystemFontOfSize:12];
		dateLabel.backgroundColor = [UIColor clearColor];
		dateLabel.numberOfLines = 1;
		dateLabel.textAlignment = UITextAlignmentLeft;
		dateLabel.textColor = [UIColor orangeColor];
		dateLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		labelLabel.font = [UIFont systemFontOfSize:11];
		labelLabel.backgroundColor = [UIColor clearColor];
		labelLabel.numberOfLines = 2;
		labelLabel.textColor = [UIColor whiteColor];
		labelLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
		[cell.contentView addSubview:labelLabel];
		[cell.contentView addSubview:dateLabel];
		
	}else 
	{
		labelLabel = (UILabel *)[cell.contentView viewWithTag:LABEL_TAG];
		dateLabel = (UILabel *)[cell.contentView viewWithTag:DATE_TAG];
	}
    
	NSString *labeltext = [[self.news_Array objectAtIndex:indexPath.row] retain];
	labelLabel.text = [NSString stringWithFormat:@"%@",labeltext];
	[labeltext release];
	
	NSMutableDictionary *DataLabeldict = [[self.date_Array objectAtIndex:indexPath.row] retain]; 
	dateLabel.text =  [NSString stringWithFormat:@"%@",[DataLabeldict objectForKey:@"date"]];
	[DataLabeldict release];

    // Set up the cell...
	
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

-(void)getNewData:(NSString *)newsSymbol
{
	[self.news_Array removeAllObjects];
	[self.date_Array removeAllObjects];

		
	
	
	//[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	 /*http://202.53.70.20/simulator/simulator/getNews.action?username=chartdev&pwd=chartdev&symbol=goog&count=2*/
	//loader
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/getNews.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"username=chartdev&pwd=chartdev&count=5&symbol=%@",newsSymbol];
	
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
		
	[pool release];

	
	//[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];
	
	
	

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
	
	NSLog(@"==============%@",[self.news_Array description]);
	
	NSError *parseError = [xmlParser parserError];
	if (parseError && error) 
	{
		NSLog( @"Failed to parse -> %@", [parseError localizedDescription] );
        *error = parseError;
	}
	[xmlParser release];
    [self.tableView reloadData];
}


// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	
    if ([elementName isEqualToString:@"headline"]) 
	{
		self.contentOfCurrentProperty = [NSMutableString string];
		[self.date_Array addObject:attributeDict];		
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
    
    if ([elementName isEqualToString:@"headline"]) 
	{
		[self.news_Array addObject:[self.contentOfCurrentProperty retain]];
		[self.contentOfCurrentProperty release];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.contentOfCurrentProperty) 
	{
        [self.contentOfCurrentProperty appendString:string];
    }
}

- (void)dealloc {
	[date_Array release];
	[news_Array release];
	[contentOfCurrentProperty release];
	[symbol release];
	[tableView release];
    [super dealloc];
}

@end
