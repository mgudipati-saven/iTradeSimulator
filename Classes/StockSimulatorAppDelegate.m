//
//  StockSimulatorAppDelegate.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <SystemConfiguration/SystemConfiguration.h>
#import "StockSimulatorAppDelegate.h"
#import "SimulatorXMLParser.h"


@implementation StockSimulatorAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize portfolioViewController;
@synthesize accountViewController;
@synthesize communityViewController;
@synthesize accountList;
@synthesize portfolioList;
@synthesize gameSettings;
@synthesize pathToUserCopyOfPlist;
@synthesize currentAccount;
@synthesize userProfile;
@synthesize tradeViewController;
@synthesize rankingTableViewController;
@synthesize rankList;
@synthesize  internetConnectionStatus;
//veeru
@synthesize orientation_bool;
@synthesize loaderCover;
@synthesize bigChart_Boolean;
@synthesize presentViewControllerTitle;


#define DEFAULT_ORDER_TYPE @"Buy"
#define DEFAULT_PRICE_TYPE @"Market"
#define DEFAULT_TERM_TYPE  @"Day"

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
	
	//veeru init the orientation varable
	self.orientation_bool = NO;
	self.presentViewControllerTitle  = [[NSString alloc] initWithString:@""];
	
		
	self.portfolioList = [NSMutableArray array];
	self.accountList = [NSMutableArray array];
	self.rankList = [NSMutableArray array];
	
	// Check for data in Documents directory. Copy default appData.plist to Documents if not found.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.pathToUserCopyOfPlist = [documentsDirectory stringByAppendingPathComponent:@"appData.plist"];
    if ([fileManager fileExistsAtPath:pathToUserCopyOfPlist] == NO) 
	{
        NSString *pathToDefaultPlist = [[NSBundle mainBundle] pathForResource:@"appData" ofType:@"plist"];
        if ([fileManager copyItemAtPath:pathToDefaultPlist toPath:pathToUserCopyOfPlist error:&error] == NO) 
		{
            NSAssert1(0, @"Failed to copy data with error message '%@'.", [error localizedDescription]);
        }
    }
    // Unarchive the data, store it in the local property, and pass it to the settings view controller
    self.gameSettings = [[[NSMutableDictionary alloc] initWithContentsOfFile:pathToUserCopyOfPlist] autorelease];
	
	NSLog( @"%@", [self.gameSettings description]);
	
	// Set up the main window and content view
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [window setBackgroundColor:[UIColor blackColor]];
	
	// Create a tabbar controller and an array to contain the view controllers
	self.tabBarController = [[CustomTabBarController alloc] initWithCustomView];
	self.tabBarController.delegate = self.tabBarController; 
	
	NSMutableArray *viewControllersArray = [[NSMutableArray alloc] initWithCapacity:5];
    
	//veeru converted  to nib file
	// Create account view controller
	//accountViewController = [[[AccountViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
	
	accountViewController = [[[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:[NSBundle mainBundle]] autorelease];
	accountViewController.data = self.gameSettings;
	
	
	// Create the navigation controller with the account view controller
	UINavigationController *navigationController = [[[UINavigationController alloc] initWithRootViewController:accountViewController] autorelease];
	navigationController.navigationBar.barStyle = UIBarStyleBlack;
	// Add the navigation controller to the viewControllersArray array
	[viewControllersArray addObject:navigationController];
	
	//veeru converted  to nib file view
	// Create portfolio view controller
	//portfolioViewController = [[[PortfolioTableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
	 portfolioViewController = [[[PortfolioTableViewController alloc] initWithNibName:@"PortfolioTableViewController" bundle:[NSBundle mainBundle]] autorelease];
	
	// Create the navigation controller with the portfolio view controller
	 navigationController = [[[UINavigationController alloc] initWithRootViewController:portfolioViewController] autorelease];
	 navigationController.navigationBar.barStyle = UIBarStyleBlack;
	// Add the navigation controller to the viewControllersArray array
	[viewControllersArray addObject:navigationController];
	
	// Create trade view controller 
	//veeru convert instance   from nib file 
	tradeViewController = [[[TradeViewController alloc]  initWithNibName:@"TradeViewController" bundle:[NSBundle mainBundle]] autorelease];
	
	NSMutableDictionary *defaultOrderDetails = [NSMutableDictionary dictionaryWithObjectsAndKeys:
												DEFAULT_ORDER_TYPE, @"Order Type",
												DEFAULT_PRICE_TYPE, @"Price Type", 
												DEFAULT_TERM_TYPE, @"Term", nil];
	tradeViewController.orderDetails = defaultOrderDetails;
	[defaultOrderDetails release];
	
	// Create the navigation controller with the trade view controller
	navigationController = [[[UINavigationController alloc] initWithRootViewController:tradeViewController] autorelease];
	navigationController.navigationBar.barStyle = UIBarStyleBlack;
	// Add the navigation controller to the viewControllersArray array
	[viewControllersArray addObject:navigationController];
	
	// Create ranks view controller
	rankingTableViewController = [[[RankingTableViewController alloc] initWithStyle:UITableViewStylePlain] autorelease];
	
	// Create the navigation controller with the ranks view controller
	navigationController = [[[UINavigationController alloc] initWithRootViewController:rankingTableViewController] autorelease];
	navigationController.navigationBar.barStyle = UIBarStyleBlack;
	// Add the navigation controller to the viewControllersArray array
	[viewControllersArray addObject:navigationController];
	
	// Create CommunityViewController
	 communityViewController = [[[CommunityViewController alloc] initWithNibName:@"CommunityViewController" bundle:[NSBundle mainBundle]] autorelease];
	//settingsViewController.data = self.gameSettings;
	
	// Create the navigation controller with the settings view controller
	navigationController = [[[UINavigationController alloc] initWithRootViewController:communityViewController] autorelease];
	navigationController.navigationBar.barStyle = UIBarStyleBlack;
	// Add the navigation controller to the viewControllersArray array
	[viewControllersArray addObject:navigationController];
	
	// set the tab bar controller view controller array to the viewControllersArray
	tabBarController.viewControllers = viewControllersArray;
	tabBarController.delegate =  self;
		
	[viewControllersArray release];
	
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
	
	
		
	// make the window visible
	[window makeKeyAndVisible];
	
	//checking the  network	
	[self updateStatus];	
}

//veeru
//toshowLoader
- (void)showLoader
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	//init  the alert cover
	self.loaderCover = [[LoaderViewController alloc] initLoader];
	//this for covering the Tabcontroller  during the  loading 
	[self.loaderCover showInView:[[UIApplication sharedApplication] keyWindow]];
	[pool release];
	 //[[NSURLCache sharedURLCache] removeAllCachedResponses];
}

//tohideLoader
- (void)hideLoader
{   
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	//uncovering
    [self.loaderCover dismissWithClickedButtonIndex:-1 animated:NO];
	[self.loaderCover release];
	[pool release];
}

- (void)getPortfolioData
{
	[portfolioList removeAllObjects];
	//veeru  show loader
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];	
 	
    
	//NSMutableString *urlString=[[NSMutableString alloc] initWithString:@"http://www.quote.com/simulator/loginAction.action"];
	//NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/portfolioAction.action", [gameSettings objectForKey:@"Base URL"]];
	//veeru modified problem while chnaging the accounts
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/portfolioAction.action", [gameSettings objectForKey:@"Base URL"]];
	
		
	//NSMutableString *httpBodyString=[[NSMutableString alloc] initWithString:@"userid=mgudipati"];
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"userid=%@&accountid=%d&flag=true", [gameSettings objectForKey:@"Login ID"],currentAccount.accountID];
	
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
	SimulatorXMLParser *xmlParser = [[SimulatorXMLParser alloc] init];
	[xmlParser parseSimulatorData:data parseError:&parseError];
	
	//changing the latest rank port folio and  cash balnce nd ratio
	//PORTFOLIO =CASHBALANCE + TOTAL OF ALL PORTFOLIOS  
    self.userProfile.portfolio =  xmlParser.updated_portfolio + xmlParser.updated_cashBalance;	
	self.userProfile.cashBalance = 	xmlParser.updated_cashBalance;
	self.userProfile.ratio = ((self.userProfile.portfolio - self.currentAccount.initialBalance)/self.currentAccount.initialBalance) * 100.00;
	//feature add the  rank  also TO DO AFTER RANK IN PORTFOLIO TAG

	[xmlParser release];

    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

	//veeru  hide loader 
	[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:self withObject:nil];

	[pool release];
}

- (void)getSimulatorData
{  
	//start of the game service  it  will only at start of the  game

	[self.portfolioList removeAllObjects];
	[self.accountList removeAllObjects];
	[self.rankList removeAllObjects];

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];	

    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	//
	[gameSettings setObject:@"chethan" forKey:@"Login ID"];

	//NSMutableString *urlString=[[NSMutableString alloc] initWithString:@"http://www.quote.com/simulator/loginAction.action"];
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/loginAction.action", [gameSettings objectForKey:@"Base URL"]];
	//NSMutableString *httpBodyString=[[NSMutableString alloc] initWithString:@"userid=mgudipati"];

	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"userid=%@", [gameSettings objectForKey:@"Login ID"]];

	NSLog(@"%@?%@",[gameSettings objectForKey:@"Base URL"],httpBodyString);

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
		//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
		//									   @"NSURLConnection initialization method failed.");
		//NSLog( @"Connection Failed -> %@", message);
	}
	
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
	//											encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	// Parse the xml response.
	SimulatorXMLParser *xmlParser = [[SimulatorXMLParser alloc] init];
	[xmlParser parseSimulatorData:data parseError:nil];

	//changing the latest rank port folio and  cash balnce
	//PORTFOLIO =CASHBALANCE + TOTAL OF ALL PORTFOLIOS 
    self.userProfile.portfolio =  xmlParser.updated_portfolio + xmlParser.updated_cashBalance;	
	self.userProfile.cashBalance = 	xmlParser.updated_cashBalance;
	self.userProfile.ratio = ((self.userProfile.portfolio - self.currentAccount.initialBalance)/self.currentAccount.initialBalance) * 100.00;
	//feature add the  rank  also TO DO AFTER RANK IN PORTFOLIO TAG
	data = nil;
	NSLog(@"Iinitial Pasrsing COmpleted =========================");
	
	[xmlParser release];
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
		
	[self.accountViewController  reloadDataFunction];
	[pool release];	
}

-(NSData *)getImageData:(NSString *)userID
{

		

	//[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/fileUpload.action", [gameSettings objectForKey:@"Base URL"]];
	//NSMutableString *httpBodyString=[[NSMutableString alloc] initWithString:@"userid=mgudipati"];
	//NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"action=get&userid=%@", [gameSettings objectForKey:@"Login ID"]];
	 
	NSMutableString *httpBodyString=[[NSMutableString alloc]  initWithFormat:@"action=get&profileid=%@", userID];
	
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
		//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
											//   @"NSURLConnection initialization method failed.");
		//NSLog( @"Connection Failed -> %@", message);
	}
	
	
	// Shows User Icon, First Name, Last Name
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
											//encoding:NSUTF8StringEncoding] autorelease];
	
	//veeru  hide loader
	//[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:self withObject:nil];
	//[pool release];
	if([[data description] length] > 2 && (data != nil))
	{
		return data;
    }
	else
	{
		return NULL;
	}
}

/*
 - (void)placeOrder:(OpenPosition *)positionDetails
 {	
 [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
 
 NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/placeOrderAction.action", [gameSettings valueForKey:@"Base URL"]];
 NSMutableString *httpBodyString=[[NSMutableString alloc] 
 initWithFormat:@"symbol=%@&qty=%d&side=Sell&ordertype=Market&userid=%@&accountid=3231",
 positionDetails.symbol, positionDetails.quantity, [gameSettings valueForKey:@"Login ID"]];
 
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
 // inform the user that the connection failed
 NSString *message = NSLocalizedString (@"Unable to initiate request.", 
 @"NSURLConnection initialization method failed.");
 NSLog( @"Connection Failed -> %@", message);
 }
 
 NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
 encoding:NSUTF8StringEncoding] autorelease];
 NSLog( @"Response = %@", xmlData );
 
 [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
 }
 */

- (void)placeOrder:(NSDictionary *)orderDetails
{	
	//veeru  hide loader
	 NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];	
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/placeOrderAction.action", [gameSettings valueForKey:@"Base URL"]];
	NSMutableString *httpBodyString=[[NSMutableString alloc] 
									 initWithFormat:@"symbol=%@&qty=%@&side=%@&ordertype=%@&price=%@&userid=%@&accountid=%d&tif=%d&commission=10",
									 [orderDetails valueForKey:@"Symbol"] == nil ? @"" : [orderDetails valueForKey:@"Symbol"], 
									 [orderDetails valueForKey:@"Quantity"] == nil ? @"" : [orderDetails valueForKey:@"Quantity"],
									 [orderDetails valueForKey:@"Order Type"] == nil ? @"" : [orderDetails valueForKey:@"Order Type"], 
									 [orderDetails valueForKey:@"Price Type"] == nil ? @"" : [orderDetails valueForKey:@"Price Type"], 
									 [orderDetails valueForKey:@"Price"] == nil ? @"" : [orderDetails valueForKey:@"Price"], 
									 [gameSettings valueForKey:@"Login ID"],
									 currentAccount.accountID,
									 [[orderDetails valueForKey:@"Term"] isEqualToString:@"Day"] ? 0 : 1];
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
	
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	//veeru  hide loader
	[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:self withObject:nil];	
	
	[pool release];
}

- (void)addToPortfolioList:(OpenPosition *)newPosition
{
	//NSLog( @"==========port=======================%@", [newPosition description]);
	
	
	[self.portfolioList addObject:newPosition];
	
	// The XML parser calls addToPortfolioList: each time it creates an open position object.
    // The portfolio table needs to be reloaded to reflect the new content.
    [portfolioViewController reloadDataFunction];
	
}

- (void)addToAccountList:(UserAccount *)newAccount
{
	//NSLog( @"===================================addToAccountList %@", [newAccount description]);
	[self.accountList addObject:newAccount];
	
	// The XML parser calls addToAccountList: each time it creates a user account object.
    // The account table needs to be reloaded to reflect the current account content (default game).
	if (newAccount.defaultGame)
	{
		if(self.currentAccount != nil)
			[self.currentAccount release];
		
		self.currentAccount = [newAccount retain];
	}	
}




- (void)addToRankList:(NSDictionary *)aRank
{
	//NSLog( @"%@", [newPosition description]);
	[self.rankList addObject:aRank];
	
	// The XML parser calls addToPortfolioList: each time it creates an open position object.
    // The portfolio table needs to be reloaded to reflect the new content.
    [[rankingTableViewController tableView] reloadData];
}

//veeru adtt
- (NSDictionary *)getRankerAtIndex:(NSUInteger)index
{
	//veeru chaged  to retain for  chat  data
	return [[self.rankList objectAtIndex:index] retain];
}

- (void)setProfile:(UserProfile *)aProfile
{
	if(self.userProfile != nil)
		[self.userProfile release];
	
	self.userProfile = aProfile;
	
	self.userProfile.image = [self getImageData:[gameSettings objectForKey:@"Login ID"]];
	[accountViewController reloadDataFunction];
}

- (NSUInteger)openPositionCount
{
	return [self.portfolioList count];
}

- (OpenPosition *)openPositionAtIndex:(NSUInteger)index
{
	//veeru chaged  to retain for  chat  data
	return [[self.portfolioList objectAtIndex:index] retain];
}


 // Optional UITabBarControllerDelegate method
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    	
	 //top 20 and community services
	 
	 if([viewController.title isEqual:@"Community"])
	 {
		 [NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];
	     //init the community 
		 [self.communityViewController  getCommunityData];
		   [self hideLoader];
	 }
	 else if([viewController.title isEqual:@"Top 20"])
	 {
		[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil]; 
	    [self getRankersData];
		 //in the dats is zero  refresh here
		 if([self.rankList count]<=0)
			 [self.rankingTableViewController reloadDataFunction]; 
		 [self hideLoader];
	  }
	 
	 if([self.presentViewControllerTitle isEqual:@"Community"])
	 {
	      [self.communityViewController.navigationController popToRootViewControllerAnimated:NO]; 
	 }
	 else if([self.presentViewControllerTitle isEqual:@"Portfolio"])
	 {
	      [self.portfolioViewController.navigationController popToRootViewControllerAnimated:NO];
	 }
	 else if([self.presentViewControllerTitle isEqual:@"Make a Trade"])
	 {
	      [self.tradeViewController.navigationController popToRootViewControllerAnimated:NO];
		  [self.tradeViewController resetOrderDetails];
	 }
	 else if([self.presentViewControllerTitle isEqual:@"Top 20"])
	 {
	       [self.rankingTableViewController.navigationController popToRootViewControllerAnimated:NO];
	 }
	 else
	 {
	     [self.accountViewController.navigationController popToRootViewControllerAnimated:NO]; 
	 }
	 //release the string and  inazalize
	 [self.presentViewControllerTitle   release];
	 self.presentViewControllerTitle  = nil;
	 self.presentViewControllerTitle  = [[NSString alloc] initWithFormat:@"%@",viewController.title];
	 
	
}


-(NSArray *)orderTypes
{
	return [gameSettings valueForKey:@"Order Types"];
}

-(NSArray *)priceTypes
{
	return [gameSettings valueForKey:@"Price Types"];
}

-(NSArray *)termTypes
{
	return [gameSettings valueForKey:@"Term Types"];
}

- (NSString *)baseURL
{
	return [gameSettings valueForKey:@"Base URL"];
}

- (NSString *)userid
{
	return [gameSettings valueForKey:@"Login ID"];
}

- (NSArray *)games
{
	NSMutableArray *gamesList = [NSMutableArray arrayWithCapacity:[accountList count]];
	NSEnumerator *accountEnumerator = [accountList objectEnumerator];
	UserAccount *aAccount;
	while (aAccount = [accountEnumerator nextObject])
	{
		[gamesList addObject:aAccount.gameName];
	}
	return gamesList;
}

- (UserAccount *)accountForGame:(NSString *)game
{
	NSEnumerator *accountEnumerator = [accountList objectEnumerator];
	UserAccount *aAccount;
	while (aAccount = [accountEnumerator nextObject])
	{
		if ([aAccount.gameName isEqualToString:game])
		{
			return aAccount;
		}
	}
	return nil;
}

- (UserAccount *)accountAtIndex:(NSUInteger)index
{
	return [[self.accountList objectAtIndex:index] retain];
}

- (NSUInteger)accountCount
{
	return [self.accountList count];
}

- (void)setCurrentAccountByIndex:(NSUInteger)index
{
	//self.currentAccount = [[self.accountList objectAtIndex:index] retain];
	//self.currentAccount = [[self.accountList objectAtIndex:index] retain];
}

- (void)dealloc
{
	[presentViewControllerTitle release];
	[window release];
    [tabBarController release];
	[portfolioViewController release];
	[accountViewController release];
	[communityViewController release];
	[tradeViewController release];
	[rankingTableViewController release];
    [currentAccount release];
	[portfolioList release];
	[gameSettings release];
	[pathToUserCopyOfPlist release];
	[userProfile release];
	[rankList release];
	[loaderCover release];
	
	[super dealloc];
}

- (void)updateStatus
{
	// Query the SystemConfiguration framework for the state of the device's network connections.
	self.internetConnectionStatus	= [[Reachability sharedReachability] internetConnectionStatus];
	if(self.internetConnectionStatus == NotReachable)
	{
		UIAlertView *baseAlert = [[UIAlertView alloc] 
								  initWithTitle:@"Network Cannot Access" message:@"Relaunch Application With Network" 
								  delegate:self cancelButtonTitle:nil
								  otherButtonTitles:@"OK", nil];
		[baseAlert show];

		[baseAlert release];

	}
	else
	{
		//veeru  hide loader 
		//[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];
	}
}



- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	//[(id)[[UIApplication sharedApplication] delegate] terminate];

    //exit(0);
}


-(BOOL)checkLoginAction:(NSString *)username password:(NSString *)password
{
	/*
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@",[self.gameSettings objectForKey:@"Login URL"]];
	NSMutableString *httpBodyString = [[NSMutableString alloc] initWithFormat:@"username=%@&password=%@",username,password];
	
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
		///* inform the user that the connection failed 
		//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
											//  @"NSURLConnection initialization method failed.");
	//	NSLog( @"Connection Failed -> %@", message);
	}
	
	NSString *xmlData = [[NSString alloc] initWithBytes:[data bytes] length:[data length] 
												encoding:NSUTF8StringEncoding];
	NSLog( @"Response = %@", xmlData );
		
	//checking for error
	NSRange range = [xmlData rangeOfString:@"portfolios"];
	
	[xmlData release];
	[pool release];

	if(range.location != NSNotFound)	
	{
		return YES;
	}
	else
	{
		//return YES;
		return NO;	
	}	
	 */
	return YES;

}


//scalling of  image

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize sourceImage:(UIImage *)image
{
	
	UIImage *sourceImage = image;
	UIImage *newImage = nil;        
	CGSize imageSize = sourceImage.size;
	CGFloat width = imageSize.width;
	CGFloat height = imageSize.height;
	CGFloat targetWidth = targetSize.width;
	CGFloat targetHeight = targetSize.height;
	CGFloat scaleFactor = 0.0;
	CGFloat scaledWidth = targetWidth;
	CGFloat scaledHeight = targetHeight;
	CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
	
	if (CGSizeEqualToSize(imageSize, targetSize) == NO) 
	{
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
		
        if (widthFactor > heightFactor) 
			scaleFactor = widthFactor; // scale to fit height
        else
			scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
		
        // center the image
        if (widthFactor > heightFactor)
		{
			thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; 
		}
        else 
			if (widthFactor < heightFactor)
			{
				thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
			}
	}       
	
	UIGraphicsBeginImageContext(targetSize); // this will crop
	
	CGRect thumbnailRect = CGRectZero;
	thumbnailRect.origin = thumbnailPoint;
	thumbnailRect.size.width  = scaledWidth;
	thumbnailRect.size.height = scaledHeight;
	
	[sourceImage drawInRect:thumbnailRect];
	
	newImage = UIGraphicsGetImageFromCurrentImageContext();
	if(newImage == nil) 
        NSLog(@"could not scale image");
	
	//pop the context to get back to the default
	UIGraphicsEndImageContext();
	return newImage;
}


//to get the to TOP 20 Ranks
-(void)getRankersData
{
    //removing the rankers list 
     [self.rankList removeAllObjects];
	
	
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
	//[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:self withObject:nil];	
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	/*http://202.53.70.20/simulator/simulator/getRankAction.action?userid=a&accountid=1&gid=1 */
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/getRankAction.action", [gameSettings objectForKey:@"Base URL"]];
	//NSMutableString *httpBodyString=[[NSMutableString alloc] initWithString:@"userid=testing1"];
	
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"userid=%@&accountid=%d&gid=%d",[gameSettings objectForKey:@"Login ID"],currentAccount.accountID,currentAccount.gameID];
	
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
		//NSString *message = NSLocalizedString (@"Unable to initiate request.", 
										//	   @"NSURLConnection initialization method failed.");
		//NSLog( @"Connection Failed -> %@", message);
	}
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
	//											encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	// Parse the xml response.
	//NSError *parseError = nil;
	SimulatorXMLParser *xmlParser = [[SimulatorXMLParser alloc] init];
	[xmlParser parseSimulatorData:data parseError:nil];

	[xmlParser release];
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
	//veeru  hide loader
	//[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:self withObject:nil];
    [pool release];

}

-(void)refreshAccount
{  
			
	[self getPortfolioData];
	
   	[self.accountViewController reloadDataFunction];

	//in the dats is zero  refresh here
	if([self.portfolioList count]<=0)
		[self.portfolioViewController reloadDataFunction];

}

- (void)applicationWillTerminate:(UIApplication *)application 
{
    // save changes to settings plist in Documents
    [gameSettings writeToFile:pathToUserCopyOfPlist atomically:NO];
}

@end
