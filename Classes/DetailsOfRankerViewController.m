//
//  DetailsOfRankerViewController.m
//  StockSimulator
//
//  Created by Saven  on 28/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "DetailsOfRankerViewController.h"
#import "RankerTableViewCell.h"
#import "CommunityDefaultViewCell.h"
#import "RankerPortfolioViewCell.h"
#import "SimulatorXMLParser.h"


// Private interface for PortfolioTableViewController - internal only methods.
@interface DetailsOfRankerViewController ()
@property (retain, nonatomic) UITableView *tableView;
@end


@implementation DetailsOfRankerViewController
@synthesize appDelegate,rankerData,tableView,rankerPortfolio,rankerProfile,favBuys,favSells,investorType;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
       
		appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		// Custom initialization
		self.title = @"Ranker Details";
		self.rankerPortfolio = [NSMutableArray array];
		self.favBuys =[[NSMutableString alloc] init];
		self.favSells =[[NSMutableString alloc] init];
		
		//inivitor types init
		self.investorType = [NSMutableArray array];
		
		//total five investors hard coding
		
		[self.investorType addObject:[NSString  stringWithString:@"Casual"]];
		[self.investorType addObject:[NSString stringWithString:@"Professional"]];
		[self.investorType addObject:[NSString stringWithString:@"Novice"]];
		[self.investorType addObject:[NSString stringWithString:@"Advanced"]];
		[self.investorType addObject:[NSString stringWithString:@"DayTrader"]];
		[self.investorType addObject:[NSString stringWithString:@""]];
		
				
		//adding the  right hand button
		
	//	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																						   																			   
																					  // target:self action:@selector(changeFavoriteSate:)];
        						
		//self.navigationItem.rightBarButtonItem = refreshButton;
		//UIImage *favImag = [UIImage imageNamed:@"addFav.png"];
					
		UIBarButtonItem *button =  [[UIBarButtonItem alloc] initWithImage:nil  style:UIBarButtonItemStyleBordered  target:self action:@selector(changeFavoriteState:)];
		
		self.navigationItem.rightBarButtonItem = button;
		[button release];
	   
		//[favImag release];
				
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

- (void)setRankers:(NSMutableDictionary *)newDetails 
{
	if(self.rankerData != nil)
		[self.rankerData release];
	
	self.rankerData = newDetails;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    if([[self.rankerData valueForKey:@"profileflag"] isEqual:@"true"] && ([self.rankerPortfolio count] > 0))
       return 4;
    else
	  return 3;
}





- (void)viewWillDisappear:(BOOL)animated
{
	//scroll to  to top
	 self.tableView.scrollEnabled = YES;
	 self.navigationItem.rightBarButtonItem.enabled = YES;
	 [self.tableView scrollRectToVisible:CGRectMake(0,0,320,1) animated:NO];
	
	 
	
		//sending the changing service
	RankerProfileCell.user.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	RankerProfileCell.gender.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	RankerProfileCell.rank.text =  [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	RankerProfileCell.city.text =  [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	RankerProfileCell.country.text =  [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	RankerProfileCell.desc.text =  [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	RankerProfileCell.avatar.image = nil;
	[RankerProfileCell.loader  stopAnimating];
	
	self.rankerProfile.joinedDate = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.portfolio =0;
	self.rankerProfile.cashBalance=0;
	self.rankerProfile.lastTrade=0;
	self.rankerProfile.profitOrLoss=0;
	self.rankerProfile.ratio=0;
	self.rankerProfile.firstName =[NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.lastTrade =[NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.gender =[NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.rank = 0;
	self.rankerProfile.lastName = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.country = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.city = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.description = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")];
	self.rankerProfile.investorType = 5;

	
	//realse the string and init
	[self.favBuys release];
	[self.favSells release];
	self.favSells = nil;
	self.favBuys =nil;
	
	
	
	self.favBuys =[[NSMutableString alloc] init];
	self.favSells =[[NSMutableString alloc] init];
    [self.rankerPortfolio removeAllObjects];	
	
	
	
	[self.tableView reloadData]; 
	
	
	
	//self.navigationItem.rightBarButtonItem.hidden = YES;
	
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
   
	//self.navigationItem.hidesBackButton = YES;
	

	if (!RankerProfileCell)
	{
		RankerProfileCell = [[RankerTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"RankingProfile"];
	    RankerProfileCell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	
	/*
	
	//get the image  first
    
	NSData *imageData =[appDelegate getImageData:[self.rankerData objectForKey:@"userid"]];
	
	//changing the view of the fav button*/
	if([[self.rankerData valueForKey:@"isfav"] isEqual:@"true"])
	{	
		self.navigationItem.rightBarButtonItem.image =  [UIImage imageNamed:@"favorite_delete.png"];	
		//[self.favImageView setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
	}
	else
	{	
		// [self.favImageView setBackgroundImage:[UIImage imageNamed:@"notFav.png"] forState:UIControlStateNormal];
		 self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"favAddImage.png"];
	}	
	
	//startsmall loader
	[RankerProfileCell.loader startAnimating];

	//getrankerDetailservice
	//pavan  do not block the  ui
	//[self getRankerDetails];
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
	[NSThread detachNewThreadSelector:@selector(getRankerDetails) toTarget:self withObject:nil];
	
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	
	switch (section) {
		case 0:
			return 1;
			break;
		case 1:
			return 8;
			break;
		case 2:
			return 2;
			break;
		default:
			return [self.rankerPortfolio count];
			break;
	}
	
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	
	NSString *header;
	
	switch (section) {
		case 0:
			header = [[NSString alloc] initWithString:@"Profile"];
			break;
		case 1:
			header = [[NSString alloc] initWithString:@"Details"];
			break;
		case 2:
			header = [[NSString alloc] initWithString:@"Favorite Quotes"];
			break;
		case 3:
			header = [[NSString alloc] initWithString:@"Portfolio"];
			break;
		default:
				header = [[NSString alloc] initWithString:@"Portfolio \n Symbol \t Quantity "];
				break;
	}
	
	return header;
}
*/


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
	static NSString *CellIdentifier = @"RankingDetail";
	static NSString *CellPortfolio = @"RankingPortfolio";
	
	if(indexPath.section == 0)
	{	
		return RankerProfileCell;
	}
	else
	{	
		CommunityDefaultViewCell *cell = (CommunityDefaultViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		RankerPortfolioViewCell *cell_pro = (RankerPortfolioViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellPortfolio];
		if (cell == nil) 
		{
			cell = [[[CommunityDefaultViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		    cell.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		if (cell_pro == nil) 
		{
			cell_pro = [[[RankerPortfolioViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellPortfolio] autorelease];
		    cell_pro.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		
		
		
		switch (indexPath.section) {
			case 1:
			{
				switch (indexPath.row) {
						
					case 0:
						cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Playing Since",@"playingScinece")];
						if([self.rankerProfile.joinedDate length] <= 0)
							cell.description.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")] ;
						else
							cell.description.text = [NSString stringWithFormat:@"%@",self.rankerProfile.joinedDate] ;
						
					break;		
						
					case 1:
							cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Investor Type",@"InvestorType")];
						 //desc = [[[NSString alloc] initWithFormat:@"%@",self.rankerProfile.joinedDate] autorelease];
							NSString *investor =  [[self.investorType objectAtIndex:self.rankerProfile.investorType] retain];
						    cell.description.text = [NSString stringWithFormat:@"%@",investor];
							[investor release];
							
						
						break;	
						
					case 2:
						cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Portfolio",@"Portfolio")];
						cell.description.text = [NSString stringWithFormat:@"$%0.2F",self.rankerProfile.portfolio];
					   	break;
					
					case 3:
						cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Cash Balance",@"Balance")];
						cell.description.text = [NSString stringWithFormat:@"$%0.2F",self.rankerProfile.cashBalance] ;
						break;
						
					case 4:
						cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Return %",@"Return")];	
						cell.description.text = [NSString stringWithFormat:@"%0.2F",self.rankerProfile.ratio] ;
						break;
						
					case 5:
						 cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Profit/Loss",@"ProfitOrLoss")];
                         cell.description.text = [NSString stringWithFormat:@"$%0.2F",self.rankerProfile.profitOrLoss];
					
						break;
						
					case 6:
						 cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Trades",@"Trades")];
						cell.description.text = [NSString stringWithFormat:@"%i",self.rankerProfile.trades];
						break;
					case 7:	
					default :
							cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Last Trade",@"LastTrade")];
							if([self.rankerProfile.lastTrade length] <= 0)
							cell.description.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"",@"EmptyString")] ;
							else
						    cell.description.text = [NSString stringWithFormat:@"%@",self.rankerProfile.lastTrade];
							
						break;
				}   	
				
				
			}
			break;
			case 2:
				if(indexPath.row)
				{
				   cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Fav Buy",@"FavBuy")];
				   cell.description.text = [NSString stringWithFormat:@"%@",self.favBuys];
				}
				else
				{
				    cell.identifier.text = [NSString stringWithFormat:@"%@",NSLocalizedString(@"Fav Sell",@"FavSell")];
				    cell.description.text = [NSString stringWithFormat:@"%@",self.favSells];
					
				}
				break;
			
			case 3:
			default: 
			{
				//NSLog(@"111......%d..........",[[self.rankerPortfolio objectAtIndex:indexPath.row] retainCount]);
				NSMutableArray *dict = [[self.rankerPortfolio objectAtIndex:indexPath.row] retain];
				//NSLog(@"222......%d..........",[[self.rankerPortfolio objectAtIndex:indexPath.row] retainCount]);
				cell_pro.symbol.text = [dict valueForKey:@"symbol"];
				cell_pro.quantity.text = [NSString stringWithFormat:@"%d",[[dict valueForKey:@"quantity"] intValue]];
				cell_pro.pricePaid.text = [NSString stringWithFormat:@"%0.2F",[[dict valueForKey:@"pricepaid"] doubleValue]];
				cell_pro.currentPrice.text = [NSString stringWithFormat:@"%0.2F",[[dict valueForKey:@"price"] doubleValue]];
				[dict release];
			}
				break;
		}
		
		if(indexPath.section == 3)
		{
		   return cell_pro;
		}
		else
		{
			return cell;
		}
	}
}

//height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
/*	
	switch (indexPath.section) {
		case 0:
			return 180.0f;
			break;
		case 1:
			return @"Deatails";
			break;
		case 2:
			return @"Favorite Quotes";
			break;
		default:
			return @"Portfolio";
			break;
	}
*/	
    if(indexPath.section == 0)
		return 180.0f;
	else
		return 25.0f;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];

	// Navigation logic may go here. Create and push another view controller.
	
	// Deselect the new row using animation
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];

}

-(void)getRankerDetails
{
	

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	[self.rankerPortfolio removeAllObjects];
    RankerProfileCell.avatar.image = nil;
	
	
	
	
	/*http://202.53.70.20/simulator/simulator/community.action?action=profile&gid=2&userid=murthy*/

	
	//loader
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
		
		
	
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/community.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	
	NSMutableString *httpBodyString=[[NSMutableString alloc] initWithFormat:@"action=profile&gid=%d&profileid=%@",appDelegate.currentAccount.gameID,[self.rankerData objectForKey:@"userid"]];
	
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
		/* inform the user that the connection failed
		 NSString *message = NSLocalizedString (@"Unable to initiate request.", 
		 @"NSURLConnection initialization method failed.");
		 NSLog( @"Connection Failed -> %@", message);*/
	}
	
	NSString *xmlData = [[NSString alloc] initWithBytes:[data bytes] length:[data length] 
												encoding:NSUTF8StringEncoding];
	NSLog( @"Response = %@", xmlData );
	
	//Parse the xml response.
	NSRange range = [xmlData rangeOfString:@"message"];

	self.navigationItem.hidesBackButton = YES;
	
	if(range.location != NSNotFound)
	{

		//alert
		UIAlertView *baseAlert = [[UIAlertView alloc] 
								  initWithTitle:@"Ranker Details" message:@"Fail to load the profile. Try Again" 
								  delegate:self cancelButtonTitle:nil
								  otherButtonTitles:@"OK", nil];
		[baseAlert show];
		[baseAlert release];
		 self.tableView.scrollEnabled = NO;
		self.navigationItem.rightBarButtonItem.enabled = NO;
		
		//self.navigationItem.hidesBackButton = NO;
		//[self.tableView reloadData];
	}
	else
	{
		SimulatorXMLParser *xmlParser = [[SimulatorXMLParser alloc] init];
		[xmlParser parseSimulatorData:data parseError:nil];
		
		if(self.rankerProfile !=nil)
		{	
			//[self.rankerProfile.image release];
			self.rankerProfile.image = nil;
			[self.rankerProfile release];
			self.rankerProfile = nil;
		}
		
		self.rankerProfile =xmlParser.userProfile; 
		
		//calculating the fav Buy and sell
		
		//realse the string and init
		[self.favBuys release];
		[self.favSells release];
		self.favSells = nil;
		self.favBuys =nil;
		
		
		
		self.favBuys =[[NSMutableString alloc] init];
		self.favSells =[[NSMutableString alloc] init];
		
		for(int i=0;i<[xmlParser.favStocks count];i++)
		{	    
			
			NSMutableDictionary *favStocksDict = [[xmlParser.favStocks objectAtIndex:i] retain];
			
			if([[favStocksDict valueForKey:@"rating"] isEqual:@"1"])
			{
				[self.favBuys appendString:[favStocksDict valueForKey:@"symbol"]];
				[self.favBuys appendString:@","];  				
			}
			else
			{
				[self.favSells appendString:[favStocksDict valueForKey:@"symbol"]];
				[self.favSells appendString:@","];  	
			}
			
			[favStocksDict release];
		}
		//tring the last character
		if([self.favBuys length]>1)
		{
			//self.favBuys = [self.favBuys substringWithRange:NSMakeRange(0,([self.favBuys length]-2))];
			//[self.favBuys deleteCharactersInRange:];
			[self.favBuys replaceCharactersInRange:NSMakeRange(([self.favBuys length]-1),1) withString:@""];
		}
		if([self.favSells length]>1)
		{
			[self.favSells replaceCharactersInRange:NSMakeRange(([self.favSells length]-1),1) withString:@""];
		}	
		
		//adding the portfolios
		self.rankerPortfolio = xmlParser.portfolioList;
		[xmlParser release];
		
	}
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
  	//gettin the data
	[xmlData release];
	[self reloadDataFunction];
	[appDelegate hideLoader];
	[pool release];
	

}

-(void)reloadDataFunction
{
	
	
	[NSThread detachNewThreadSelector:@selector(imageData) toTarget:self withObject:nil];
	
	if([self.rankerProfile.firstName length] <= 0)
		RankerProfileCell.user.text = [NSString stringWithFormat:@""];	
	else
		RankerProfileCell.user.text = [NSString stringWithFormat:@"%@ %@",self.rankerProfile.firstName,self.rankerProfile.lastName];
	
	RankerProfileCell.gender.text = self.rankerProfile.gender;
	RankerProfileCell.rank.text = [NSString stringWithFormat:@"%d",self.rankerProfile.rank]; 
	
	RankerProfileCell.city.text = self.rankerProfile.city;
	RankerProfileCell.country.text = self.rankerProfile.country;
	RankerProfileCell.desc.text = self.rankerProfile.description;
	
	if ([self.rankerProfile.gender isEqualToString:@"M"])
	{
		RankerProfileCell.avatar.image =  [appDelegate imageByScalingAndCroppingForSize:CGSizeMake(130.00,110.00) sourceImage:[UIImage imageNamed:@"male.png"]];
	}
	else
	{
		RankerProfileCell.avatar.image =  [appDelegate imageByScalingAndCroppingForSize:CGSizeMake(130.00,110.00) sourceImage:[UIImage imageNamed:@"female.png"]];
		
	}
	
	[self.tableView reloadData];
}

//getimageData
-(void)imageData
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	self.rankerProfile.image =[appDelegate getImageData:self.rankerProfile.userid];
	
	if(self.rankerProfile.image != NULL )
	{	
		UIImage *image = [[UIImage alloc] initWithData:self.rankerProfile.image];
 		RankerProfileCell.avatar.image =  [appDelegate imageByScalingAndCroppingForSize:CGSizeMake(130.00,110.00) sourceImage:image];
		[image release];
	}
	else
	{
		
	}
	
	[RankerProfileCell.loader stopAnimating];
	[self.tableView reloadData];	
	self.navigationItem.hidesBackButton = NO;
	[pool release];

}


//height of header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if(section == 3)
		return 50;
	else
		return 30; 
}
//customizing the header 
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{  
	UIView *header=[[[UIView alloc] initWithFrame:self.tableView.tableHeaderView.frame] autorelease];
	header.backgroundColor = [UIColor darkGrayColor];
	UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(20,0,180,25)];
	title.textColor = [UIColor orangeColor];
	
	switch (section)
	{
		case 0:
			title.text = @"Profile"; 
			title.font = [UIFont boldSystemFontOfSize:18];
			title.backgroundColor = [UIColor clearColor];
			//title.textColor = [UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]; 
			[header addSubview:title];
			//header = [[NSString alloc] initWithString:@"Profile"];
			break;
		case 1:
			title.text = @"Details"; 
			title.font = [UIFont boldSystemFontOfSize:18];
			title.backgroundColor = [UIColor clearColor];
			//title.textColor = [UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]; 
			
			[header addSubview:title];
			//header = [[NSString alloc] initWithString:@"Profile"];
		
			break;
		case 2:
			title.text = @"Favorite Quotes"; 
			title.font = [UIFont boldSystemFontOfSize:18];
			title.backgroundColor = [UIColor clearColor];
			//title.textColor = [UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]; 
			[header addSubview:title];
			//header = [[NSString alloc] initWithString:@"Profile"];
			break;
		case 3:
			title.text = @"Portfolio"; 
			title.font = [UIFont boldSystemFontOfSize:18];
			title.backgroundColor = [UIColor clearColor];
			//title.textColor = [UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]; 
			[header addSubview:title];
			UILabel *subTitle =[[UILabel alloc] initWithFrame:CGRectMake(20,25,280,15)];
			subTitle.text = @"     Symbol              Quantity         Purchase($)       Current($)"; 
			subTitle.font = [UIFont systemFontOfSize:10];
			subTitle.backgroundColor = [UIColor clearColor];
			subTitle.textColor = [UIColor blackColor];
			[header addSubview:subTitle];
			//[title release];
			[subTitle release];
			break;
		default:
			break;
	}
	[title release];
	return header;
			
/*	if(section == 3)
	{	
		UIView *header=[[[UIView alloc] initWithFrame:self.tableView.tableHeaderView.frame] autorelease];
		UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(20,0,100,25)];
		title.text = @"Portfolio"; 
		title.font = [UIFont boldSystemFontOfSize:18];
		title.backgroundColor = [UIColor clearColor];
		//title.textColor = [UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]; 
		[header addSubview:title];
		UILabel *subTitle =[[UILabel alloc] initWithFrame:CGRectMake(20,25,280,15)];
		subTitle.text = @"     Symbol              Quantity         Purchase($)         Current($)"; 
		subTitle.font = [UIFont systemFontOfSize:10];
		subTitle.backgroundColor = [UIColor clearColor];
		subTitle.textColor = [UIColor blackColor]; 
		
		[header addSubview:subTitle];
		//[title release];
		[subTitle release];
		return header;
	}
	if(section == 0)
	{
		UIView *header=[[[UIView alloc] initWithFrame:self.tableView.tableHeaderView.frame] autorelease];
		UILabel *title =[[UILabel alloc] initWithFrame:CGRectMake(20,0,100,25)];
		title.text = @"Profile"; 
		title.font = [UIFont boldSystemFontOfSize:18];
		title.backgroundColor = [UIColor clearColor];
		//title.textColor = [UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.2]; 
		[header addSubview:title];
		//header = [[NSString alloc] initWithString:@"Profile"];
		return header;
	}
	else
	{

		return self.tableView.tableHeaderView;
    }
 */
}


//fav
-(void)changeFavoriteState:(id)sender
{
	

	
	
	[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
	
	/*http://202.53.70.20/simulator/simulator/community.action?action=profile&gid=2&userid=murthy*/
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	//loader
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
		
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@/community.action", [appDelegate.gameSettings objectForKey:@"Base URL"]];
	NSMutableString *httpBodyString;
	if([[self.rankerData valueForKey:@"isfav"] isEqual:@"true"])
	{
	   	[self.rankerData setValue:@"false" forKey:@"isfav"];
		//[self.favImageView setBackgroundImage:[UIImage imageNamed:@"notFav.png"] forState:UIControlStateNormal];
		self.navigationItem.rightBarButtonItem.image =  [UIImage imageNamed:@"favAddImage.png"];
		httpBodyString =[[NSMutableString alloc] initWithFormat:@"gid=%d&fuserid=%@&action=DELFAV&userid=%@",appDelegate.currentAccount.gameID,[self.rankerData objectForKey:@"userid"],[appDelegate.gameSettings objectForKey:@"Login ID"]];
		
	}	
	else
	{
		[self.rankerData setValue:@"true" forKey:@"isfav"];
		self.navigationItem.rightBarButtonItem.image =  [UIImage imageNamed:@"favorite_delete.png"];
		//[self.favImageView setBackgroundImage:[UIImage imageNamed:@"fav.png"] forState:UIControlStateNormal];
		httpBodyString=[[NSMutableString alloc] initWithFormat:@"gid=%d&fuserid=%@&action=ADDFAV&userid=%@",appDelegate.currentAccount.gameID,[self.rankerData objectForKey:@"userid"],[appDelegate.gameSettings objectForKey:@"Login ID"]];
	    
	}
	
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
											  // @"NSURLConnection initialization method failed.");
		//NSLog( @"Connection Failed -> %@", message);
	}
	
	//NSString *xmlData = [[[NSString alloc] initWithBytes:[data bytes] length:[data length] 
	//											encoding:NSUTF8StringEncoding] autorelease];
	//NSLog( @"Response = %@", xmlData );
	
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];
	
	//non need  to  refresh the raker view 
		
	[pool release];
	
}
- (void)dealloc {

	[investorType release];
	[RankerProfileCell release];
	[favBuys release];
	[favSells release];
	[rankerProfile release];
	[rankerPortfolio release];
	[tableView release];
	[rankerData release];
    [super dealloc];
}

@end
