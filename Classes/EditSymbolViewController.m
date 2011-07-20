//
//  StockQuoteViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "StockSimulatorAppDelegate.h"
#import "EditSymbolViewController.h"
#import "DetailCell.h"

#define mini_width_max 320
#define mini_height_max 230
#define startSymbolX 10.0
#define height_Symbol_View 410
#define kNumberOfPages 2

@implementation EditSymbolViewController
@synthesize appDelegate,areaChartViewController,quoteDetails,contentOfCurrentProperty,minichartloader,chartView,detailQuoteView,label,editingItem,scrollView,pageControl,symbolView,newsViewController;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		self.title = [NSString stringWithFormat:@"Get Quotes"];
		
		UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																					target:self action:@selector(done:)];
		self.navigationItem.rightBarButtonItem = doneButton;
        
		UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
																					target:self action:@selector(cancel:)];
		self.navigationItem.leftBarButtonItem = cancelButton;
		[cancelButton release];
		[doneButton release];
		
		
		//uiVIEW THAT CONTAIN ALL THE SYMBOL DETAILS
		
		//label
		//label
		self.symbolView = [[UIView alloc] initWithFrame:CGRectMake(0.0,3.0,320.0,340)];
		
		//self.label =  [[UILabel alloc] initWithFrame:CGRectMake(startSymbolX,0.0,280.00,20)];  
		//self.label.font = [UIFont boldSystemFontOfSize:18];
		//self.label.textColor = [UIColor darkGrayColor]; // label.textColor = [UIColor darkGrayColor];
		//self.label.textAlignment = UITextAlignmentLeft;
		//self.label.backgroundColor = [UIColor clearColor];
		//self.label.text = @"Get Quotes";
		//[self.symbolView addSubview:self.label];
		
		//self.symbolField = [[UITextField alloc] initWithFrame:CGRectMake(startSymbolX,5.0,200,25.0)];
		//self.symbolField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		//self.symbolField.font = [UIFont systemFontOfSize:20.0];
		//self.symbolField.textColor = [UIColor darkGrayColor];
		//self.symbolField.keyboardType = UIKeyboardTypeASCIICapable;	
		//self.symbolField.autocorrectionType = UITextAutocorrectionTypeNo;
		//self.symbolField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
		//self.symbolField.placeholder = @"Enter Symbol";
		//self.symbolField.borderStyle = UITextBorderStyleBezel;
		//self.symbolView.backgroundColor = [UIColor greenColor];
		//[self.view addSubview:self.symbolField];
		
		//self.symbolButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		//self.symbolButton.backgroundColor = [UIColor clearColor]; 
		//[self.symbolButton setTitle:@"Get Quote" forState:UIControlStateNormal ];
		//[self.symbolButton  setImage:[UIImage imageNamed:@"go3.png"] forState:UIControlStateNormal];           
		//[self.symbolButton addTarget:self action:@selector(getQuote:) forControlEvents:UIControlEventTouchUpInside];
		
		//self.symbolButton.frame = CGRectMake(214,5.0,100,25);
		//[self.view addSubview:self.symbolButton];
		
		//detail quote
		//self.detailQuoteView = [[DetailQuoteView alloc] initWithFrame:CGRectMake(0,50.0,320.0,50.0)];
		//self.detailQuoteView.backgroundColor = [UIColor whiteColor];
		//[self.symbolView addSubview:self.detailQuoteView];
		
		//detail quote
		self.detailQuoteView = [[DetailQuoteView alloc] initWithFrame:CGRectMake(0.0,0.0,320.0,50.0)];
		self.detailQuoteView.backgroundColor = [UIColor clearColor];
		[self.view addSubview:self.detailQuoteView];
		//[self.symbolView addSubview:self.detailQuoteView];
		
		//image 
		self.chartView = [[UIImageView alloc] initWithFrame:CGRectMake(0,103.0,320.0,280.0)];
		self.chartView.backgroundColor = [UIColor blackColor];
		
		[self.symbolView addSubview:self.chartView];
		
		//loader
		self.minichartloader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[self.minichartloader setCenter:CGPointMake(160,240)];
		[self.minichartloader stopAnimating];
		
		[self.symbolView addSubview:self.minichartloader];
		
		[self.detailQuoteView setHidden:YES];
		self.chartView.image = nil;
	}	 
	
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.
	//scrollView.frame = CGRectMake(0.0,60,320.0,335);
	scrollView.contentSize = CGSizeMake(320.00*kNumberOfPages,340.00);
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.scrollsToTop = NO;
	scrollView.delegate = self;
	scrollView.directionalLockEnabled = YES;
	//(0,103.0,320.0,285.0)(0,135.0,320.0,248.0)
	self.newsViewController.view.frame = CGRectMake(320.0,58.0,320.0,280.0);//(320.0,60,320.0,335);
	
	//adding the scroll view
	[scrollView addSubview:self.symbolView];
	//[self.newsViewController.view ]
	[scrollView addSubview:self.newsViewController.view];
	
	self.pageControl.frame = CGRectMake(0.0,335.0,320.0,35.0);
	//scrollView.frame = 	CGRectMake(0.0,0.0,320.0,340);
	//scrollView.scrollEnabled =NO;
	
}	

- (NewsViewController *)newsViewController
{
    // Instantiate the stcok quote view controller if necessary.
    if (newsViewController == nil) 
	{
		//veeru commented becuse  it  is chnaging to the nib view 
		//EditSymbolViewController *controller = [[EditSymbolViewController alloc] initWithStyle:UITableViewStyleGrouped];
		// Create portfolio view controller
		NewsViewController *controller = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:[NSBundle mainBundle]];
    	self.newsViewController = controller;
        [controller release];
    }
	
    return newsViewController;
}


- (void)scrollViewDidScroll:(UIScrollView *)sender{
	// Switch the indicator when more than 50% o	f the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
	
}	

- (IBAction)changePage:(id)sender
{
	if(scrollView.scrollEnabled)
	{
		
		CGRect frame = scrollView.frame;
		frame.origin.y = 0;
	    if(self.pageControl.currentPage == 0)
			frame.origin.x = 0;
		else
			frame.origin.x = 320;
		
		[scrollView scrollRectToVisible:frame animated:YES];
		
	}
	else
	{
		if(self.pageControl.currentPage == 0)
			self.pageControl.currentPage = 1;
		else
			self.pageControl.currentPage = 0;
	}
}
//get quotes
- (void)getQuote
{
    
	[self getQuoteStatus];
	if([[self.quoteDetails objectForKey:@"symbol"] length]>0)
	{
		//load Small image
		[self.minichartloader startAnimating];
		[self.newsViewController getNewData:[self.quoteDetails objectForKey:@"symbol"]];
		self.navigationItem.rightBarButtonItem.enabled = YES;
		[NSThread detachNewThreadSelector:@selector(LoadMiniImage) toTarget:self withObject:nil];
		[self hidingFunction];		
	}
	else{
		UIAlertView *baseAlert = [[UIAlertView alloc] 
								  initWithTitle:@"Get Quotes" message:@"Invalid Symbol" 
								  delegate:self cancelButtonTitle:nil
								  otherButtonTitles:@"OK", nil];
		[baseAlert show];
		[baseAlert release];		
	}
	[appDelegate hideLoader];
	
	
}

-(void)getQuoteStatus
{
	 
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/getQuoteAction.action?symbols=%@&username=chartdev&pwd=chartdev&fields=-decimal", 
								[appDelegate baseURL],[self.editingItem objectForKey:@"Symbol"]];
	NSURL *url=[[NSURL alloc] initWithString:urlString];
	[urlString release];
	
	NSMutableURLRequest *urlRequest=[NSMutableURLRequest requestWithURL:url];
	[url release];
	
	NSLog( @"URL Request -> %@", [urlRequest description]);
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
	//NSLog( @"Get Quote Response = %@", xmlData );
	
	// Parse the xml response.
	NSError *parseError = nil;
	[self parseXMLQuote:data parseError:&parseError];
	
	//[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];
	
}

-(void)hidingFunction
{
	
	
	
	appDelegate.orientation_bool = YES;	
	
	scrollView.scrollEnabled =YES;
	
	[UIView beginAnimations:nil context:NULL];  
	[UIView setAnimationDuration:0.3];  
	CGRect rect = CGRectMake(0, -45.0,320.0,height_Symbol_View);
	//enabling the left button 
	self.navigationItem.rightBarButtonItem.enabled = YES;
	
	self.symbolView.frame = rect;  
	//setting the values '
	self.detailQuoteView.descrption.text = [NSString stringWithFormat:@"%@",[self.quoteDetails objectForKey:@"desc"]];
	self.detailQuoteView.exchange.text = [NSString stringWithFormat:@"%@      Update Time : %@",[self.quoteDetails objectForKey:@"exchg"],[self.quoteDetails objectForKey:@"utcabsupdatetime"]];
    self.detailQuoteView.volume.text = [NSString stringWithFormat:@"%@",[self.quoteDetails objectForKey:@"volume"]]; 
	
	if([[self.quoteDetails valueForKey:@"change"] doubleValue] < 0.0)
	{
		self.detailQuoteView.change.textColor = [UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
		//self.detailQuoteView.last.textColor =[UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
		//self.detailQuoteView.change_label.textColor =[UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
		//self.detailQuoteView.last_label.textColor =[UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0];
	
	}
	else
	{
		self.detailQuoteView.change.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
		//self.detailQuoteView.last.textColor = [UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
		//self.detailQuoteView.change_label.textColor =[UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
		//self.detailQuoteView.last_label.textColor =[UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0];
		
	}
	self.detailQuoteView.change.text = [NSString stringWithFormat:@"%@$(%@%%)",[self.quoteDetails valueForKey:@"change"],[self.quoteDetails valueForKey:@"pctchg"]];
	self.detailQuoteView.last.text = [NSString stringWithFormat:@"%@$",[self.quoteDetails valueForKey:@"recent"]];

	
	[self.detailQuoteView setHidden:NO];
	//self.tableView.frame =CGRectMake(0,395,330,20.0);	
	[UIView commitAnimations];  
	
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
	
	NSError *parseError = [xmlParser parserError];
	if (parseError && error) 
	{
		NSLog( @"Failed to parse -> %@", [parseError localizedDescription] );
        *error = parseError;
	}
	
	[xmlParser release];
}

/* A Sample XML quote.
 
 <?xml version="1.0" standalone="yes" ?>
 <quotes request="IBM" retrieved="Thursday, April 23, 2009 13:20:44">
 <quote status="ok" request="IBM" id="IBM" delay="15">
 <type>stock</type>
 <symbol>IBM</symbol>
 <dispname>IBM</dispname>
 <root>IBM</root>
 <priceexp>-4</priceexp>
 <timezone>-240</timezone>
 <desc>INTERNATIONAL BUSINESS MACHS</desc>
 <annhigh>1309300</annhigh>
 <divyield>1.950300</divyield>
 <annlow>695000</annlow>
 <volume>10739</volume>
 <wh52date>Thursday, July 24, 2008</wh52date>
 <dividend>0.500000</dividend>
 <eps>9.07</eps>
 <divdate>Friday, February 06, 2009</divdate>
 <exchg>NYSE</exchg>
 <lastupdatetime>13:05:20</lastupdatetime>
 <pe>11.146000</pe>
 <prev>1025500</prev>
 <shares>1.34B</shares>
 <updatedate>20090423</updatedate>
 <wl52date>Friday, November 21, 2008</wl52date>
 <date>Apr23</date>
 <texg>NYSE</texg>
 <time>Wednesday, April 22, 2009 20:00:12</time>
 <avevol>10875073</avevol>
 <minimumincrement>0.0001</minimumincrement>
 <recent>1025500</recent>
 <utcabsupdatetime>Thursday, April 23, 2009 13:05:20</utcabsupdatetime>
 <divint>90.000000</divint>
 </quote>
 </quotes>
 */

// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	
    if ([elementName isEqualToString:@"quote"]) 
	{
		// Root element. Initialize.
		self.quoteDetails = [NSMutableDictionary dictionaryWithDictionary:attributeDict];
		return;
	}
	else
	{
		// Create a mutable string to hold the contents of the each element.
		// The contents are collected in parser:foundCharacters:.
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	/*
	 if ([elementName isEqualToString:@"recent"]) 
	 {
	 // Create a mutable string to hold the contents of the 'recent' element.
	 // The contents are collected in parser:foundCharacters:.
	 self.contentOfCurrentProperty = [NSMutableString string];
	 }
	 else if ([elementName isEqualToString:@"desc"]) 
	 {
	 // Create a mutable string to hold the contents of the 'desc' element.
	 // The contents are collected in parser:foundCharacters:.
	 self.contentOfCurrentProperty = [NSMutableString string];
	 } 
	 else if ([elementName isEqualToString:@"priceexp"]) 
	 {
	 // Create a mutable string to hold the contents of the 'lastname' element.
	 // The contents are collected in parser:foundCharacters:.
	 self.contentOfCurrentProperty = [NSMutableString string];
	 }
	 else 
	 {
	 // The element isn't one that we care about, so set the property that holds the 
	 // character content of the current element to nil. That way, in the parser:foundCharacters:
	 // callback, the string that the parser reports will be ignored.
	 self.contentOfCurrentProperty = nil;
	 }*/
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
    if (qName) 
	{
        elementName = qName;
    }
    
    if ([elementName isEqualToString:@"quotes"]) 
	{
    } 
	else if ([elementName isEqualToString:@"quote"]) 
	{
    } 
	else
	{
        [self.quoteDetails setValue:contentOfCurrentProperty forKey:elementName];        
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

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

-(void)LoadMiniImage{
	
	
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@?gradient=true&bordercolor=255,128,0&plotcolor=255,128,0&gridcolor=255,128,0&panebackground=black&scalecolor=255,128,0&cont=%@&size=%ix%i&bartype=AREA&range=1d&showheader=false&showprev=true&prevcolor=255,128,0&plotoutline=255,128,0",[appDelegate.gameSettings objectForKey:@"Chart URL"],[self.editingItem objectForKey:@"Symbol"],mini_width_max,mini_height_max];
	
	NSURL *url=[[NSURL alloc] initWithString:urlString];
	[urlString release];
	
	NSData *data =   [[NSData alloc] initWithContentsOfURL:url];
	
	UIImage *image1 =[[UIImage alloc] initWithData:data];
	self.chartView.image = image1;
	[url release];
	[image1 release];
	[data release];
	[self.minichartloader stopAnimating];
    [pool release];
	//[self.minichartloader stopAnimating];
}


- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	self.navigationItem.rightBarButtonItem.enabled = NO;
	scrollView.scrollEnabled =NO;
		
	[self getQuote];
	
}


- (void)viewWillDisappear:(BOOL)animated{
	[super viewWillDisappear:animated];
	
	CGRect rect = CGRectMake(0,3.0,320.0,height_Symbol_View);
	self.symbolView.frame = rect;
	[self.detailQuoteView setHidden:YES];
	self.chartView.image = nil;
	appDelegate.orientation_bool = NO;
	appDelegate.bigChart_Boolean = NO;
	
	CGRect frame = scrollView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:NO];
	self.pageControl.currentPage = 0;
	
}


- (void)done:(id)sender 
{
	//self.symbolField.text = @"";
    // save edits to the editing item.
    [editingItem setValue:[self.quoteDetails valueForKey:@"symbol"] forKey:@"Symbol"];	
	[editingItem setValue:[self.quoteDetails valueForKey:@"recent"] forKey:@"Price"];
		
	//lopping the alert to place  it on the  above  of the label
	for( UIViewController *viewController in self.navigationController.viewControllers){
	
	 if([viewController.title isEqualToString:@"Make a Trade"])
			 [self.navigationController popToViewController:viewController animated:YES];
	  
	 }
	
	//[self.navigationController popToViewController: animated:YES];
}

- (void)cancel:(id)sender 
{
	//self.symbolField.text = @"";
	[self.navigationController popViewControllerAnimated:YES];
	
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;	
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	
	
	if(fromInterfaceOrientation == UIInterfaceOrientationPortrait){
		
		   [self.areaChartViewController updateTicker:[self.editingItem valueForKey:@"Symbol"]];
			
		    [self.areaChartViewController show];
			appDelegate.bigChart_Boolean = YES;
	}
	else
	{
	    [self.areaChartViewController dismissWithClickedButtonIndex:-1 animated:NO];
		 appDelegate.bigChart_Boolean = NO;
	}
		
	
	
}	


- (AreaChartViewController *)areaChartViewController

{
    // Instantiate the stcok quote view controller if necessary.
    if (areaChartViewController == nil) 
	{
		AreaChartViewController *controller =  [[AreaChartViewController alloc] initWithdelegate:self];
        
		self.areaChartViewController = controller;
		
		[controller release];
    }
	
    return areaChartViewController;
}


-(void)willPresentAlertView:(UIAlertView *)alertView
{
	self.areaChartViewController.frame = CGRectMake(0.0,0.0,480.0,320.0); 	
	self.areaChartViewController.hidden = YES; 
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
	//self.areaChartViewController.frame = CGRectMake(0.0,0.0,480.0,20.0); 
	self.areaChartViewController.hidden = NO; 
	
}




- (void)dealloc 
{  
	[areaChartViewController release];
	[contentOfCurrentProperty release];
	[quoteDetails release];
	[minichartloader release];
	[chartView release];
	[detailQuoteView release];
	[label release];
	[newsViewController release];
	[symbolView release];
	[pageControl release];
	[scrollView release];
	[editingItem release];
	[super dealloc];
	
}


@end

