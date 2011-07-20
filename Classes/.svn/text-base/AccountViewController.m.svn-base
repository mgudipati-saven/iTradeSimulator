//
//  AccountViewController.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StockSimulatorAppDelegate.h"
#import "AccountViewController.h"
#import "UserAccount.h"
#import "UserProfile.h"
#import "DefaultViewCell.h"
#import "AccountCell.h"


// Private interface for PortfolioTableViewController - internal only methods.
@interface AccountViewController ()
@property (retain, nonatomic) UITableView *tableView;
@end

@implementation AccountViewController

@synthesize splashScreen,appDelegate,tableView,settings_Hadler,settingsViewController,data,lastUpdatedLabel,loginScreenViewController;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		//appDeleagate
		self.appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];
		
		
		self.title = @"Account";
		self.tabBarItem.image = [UIImage imageNamed:@"account.png"];
		UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																					   target:self action:@selector(refresh:)];
		self.navigationItem.rightBarButtonItem = refreshButton;
		//self.navigationItem.hidesBackButton = NO;
		[refreshButton release]; 
		//small chanage in font size\\'
		
		
	}	 
	return self;
}

- (void)viewDidLoad {
	
	[super viewDidLoad];
	self.lastUpdatedLabel.font =[UIFont boldSystemFontOfSize:13];
	self.tableView.backgroundColor = [UIColor clearColor];	
	[self.splashScreen showInView:self.view];
	[NSThread detachNewThreadSelector:@selector(getLoginDetailView) toTarget:self withObject:nil];
}

-(void)getLoginDetailView
{	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	

	 [NSThread sleepForTimeInterval:2];
	 [self.splashScreen dismissWithClickedButtonIndex:-1 animated:NO];
	 	
	//getting the username  and  password from settings
	NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:@"username_isimulator"];
	NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password_isimulator"];
	
	if([userName length]<=0 || [password length]<=0 || userName ==nil || password ==nil)
	{
		[self showLogin];
	}
	else
	{
		//setting the accounts
		self.loginScreenViewController.username.text = userName;
		self.loginScreenViewController.password.text = password;
	 	[self getSimulatorDataWithLoginCheck];
	}
	
	[userName release];
	[password release];
	[pool release];
	
}
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	//refresh when view appear
	[self reloadDataFunction];	
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
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

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	// Two sections - one for user name, pic and the other for account details.
    return 2;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
	cell.backgroundColor = [UIColor blackColor];
	cell.highlighted =YES;
	
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
	return (section == 0) ? 1 : 11;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   return @"";
}
- (void)refresh:(id)sender
{
	
	
	// Spawn a thread to fetch the new account information so that the UI is not blocked while the application fetches the data.
    [NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];	
	//[NSThread detachNewThreadSelector:@selector(getSimulatorData) toTarget:appDelegate withObject:nil];	
	[appDelegate getSimulatorData];
	[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];	
}

- (SettingsViewController *)settingsViewController
{
    // Instantiate the position view controller if necessary.
    if (settingsViewController == nil) 
	{
		SettingsViewController *controller = [[SettingsViewController alloc] initWithStyle:UITableViewStyleGrouped];
		self.settingsViewController = controller;
		/*	
		 //veeru  customizing the back button of the positiondetail view
		 UIBarButtonItem *backButton = [[[UIBarButtonItem alloc] initWithTitle:@"Accounts"  style:UIBarButtonItemStyleBordered	 target:self.settingsViewController action:@selector(myBackAction:)] autorelease];
		 
		 //self.settingsViewController.navigationItem.hidesBackButton = YES;
		 self.settingsViewController.navigationItem.leftBarButtonItem = backButton;
		 */
		[controller release];
    }
	return settingsViewController;
}



#define LABEL_TAG 1
#define VALUE_TAG 2

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
	static NSString *FirstCellIdentifier = @"FirstCell";
	static NSString *OtherCellIdentifier = @"OtherCells";
	
	
	UserProfile *profile = [appDelegate.userProfile retain];
	UserAccount *account = [appDelegate.currentAccount retain];
	
	if(indexPath.section == 0)
	{
	   	// First Cell shows User Icon, First Name, Last Name
		AccountCell *cell = (AccountCell *)[self.tableView dequeueReusableCellWithIdentifier:FirstCellIdentifier];
		if (cell == nil)
		{
			cell = [[[AccountCell alloc] initWithFrame:CGRectZero reuseIdentifier:FirstCellIdentifier] autorelease];
			//cell.textLabel.textColor = [UIColor orangeColor];
			cell.selectionStyle = UITableViewCellSelectionStyleNone;
			
		}

		
		if(profile.image != NULL )
		{
			//UIImage *image = [[UIImage alloc] initWithData:profile.image];
			cell.avatar.image =  [appDelegate imageByScalingAndCroppingForSize:CGSizeMake(45.0,39.0) sourceImage:[UIImage imageWithData:profile.image]];
			//image = [UIImage imageWithData:profile.image];
			//[image release];
		}
		else
		{
			if ([profile.gender isEqualToString:@"M"])
			{
				//UIImage *image = [UIImage imageNamed:@"male.png"];
				cell.avatar.image =  [appDelegate imageByScalingAndCroppingForSize:CGSizeMake(45.0,39.0) sourceImage:[UIImage imageNamed:@"male.png"]];
			}
			else
			{
				//UIImage *image = [UIImage imageNamed:@"female.png"];
				cell.avatar.image =  [appDelegate imageByScalingAndCroppingForSize:CGSizeMake(45.0,39.0) sourceImage: [UIImage imageNamed:@"female.png"]];
			}
		}
		
		
		
		if([profile.firstName length]<=0 || [profile.lastName length]<=0)
		{
			cell.label.text = @"";
		}
		else
		{
			cell.label.text = [NSString stringWithFormat:@"%@ %@", profile.firstName, profile.lastName];
		}
		[profile release];
		[account release];
		return cell;
	}
	else
	{
		DefaultViewCell *cell = (DefaultViewCell *)[self.tableView dequeueReusableCellWithIdentifier:OtherCellIdentifier];
		if (cell == nil) 
		{
			cell = [[[DefaultViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:OtherCellIdentifier] autorelease];
		    cell.selectionStyle = UITableViewCellSelectionStyleNone;
			cell.description.textColor = [UIColor orangeColor];
			cell.description.font = [UIFont boldSystemFontOfSize:12];
			cell.identifier.textColor = [UIColor whiteColor];
			cell.identifier.font = [UIFont boldSystemFontOfSize:12];
		}
		
		switch (indexPath.row) 
		{
			case 0:
			default:
				// Show "Current Rank" information
				cell.identifier.text = @"Current Rank";
				cell.description.text = [NSString stringWithFormat:@"%d", account.rank];
				break;
				
			case 1:
				// Show "Cash Balance" information
				cell.identifier.text = @"Cash Balance";
				cell.description.text = [NSString stringWithFormat:@"$%0.2F", profile.cashBalance];
				break;
			case 2:
				// Show "Cash Balance" information
				cell.identifier.text = @"Available Balance";
				cell.description.text = [NSString stringWithFormat:@"$%0.2F", profile.cashBalance];
				break;
				
			case 3:
				// Show "Portfolio Value" information
				cell.identifier.text = @"Portfolio Value";
				cell.description.text = [NSString stringWithFormat:@"$%0.2F", profile.portfolio];
				break;
			case 4:
				cell.identifier.text = @"Beginning Cash Balance";
				cell.description.text = [NSString stringWithFormat:@"$%0.2F", account.initialBalance];
				break;
			case 5:
				cell.identifier.text = @"Game Begin Date";
				cell.description.font = [UIFont boldSystemFontOfSize:10];
				if([account.beginDate length] <= 0)
					cell.description.text = @"";
				else
					cell.description.text = [NSString stringWithFormat:@"%@", account.beginDate];
				
				break;
			case 6:
				cell.identifier.text = @"Game End Date";
				cell.description.font = [UIFont boldSystemFontOfSize:10];
				if([account.EndDate length] <= 0)
					cell.description.text = @"";
				else
					cell.description.text = [NSString stringWithFormat:@"%@", account.EndDate];
				
				break;
			case 7:
				cell.identifier.text = @"Market Value Of Long";
				cell.description.text = [NSString stringWithFormat:@"$%0.2F", account.MarketValue];
				break;
			case 8:
				cell.identifier.text = @"Buying Power:";
				cell.description.text = [NSString stringWithFormat:@"$%0.2F", profile.portfolio];
				break;
			case 9:
				cell.identifier.text = @"Trades Made/Allowed";
				cell.description.text = [NSString stringWithFormat:@"%d/%d",account.Trades,account.TradeLimit];
				break;
			case 10:
				// Show "Percent Gain" information
				cell.identifier.text = @"% Gain(Loss)";
				if (profile.ratio < 0)
				{
					
					cell.description.text = [NSString stringWithFormat:@"(%0.2F)",  (-1*profile.ratio)];
					cell.description.textColor = [UIColor redColor];
				}
				else
				{
					cell.description.text = [NSString stringWithFormat:@"%0.2F", profile.ratio];
					cell.description.textColor = [UIColor greenColor];
				}
				break;
		}
		[profile release];
		[account release];
	    return cell;
	}
}

//height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(indexPath.section ==0)
		return 45.0f;
	else
		return 27.0f;
}
 
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if(section == 1)
		return -2.0f;
	else
		return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view= [[[UIView alloc] initWithFrame:CGRectMake(0,0,320.0,5.0)] autorelease];  
	view.backgroundColor = [UIColor clearColor];
	
	return view;
}



//to reload data
- (void)reloadDataFunction{
	//setting the  lastupdate here
	
	//self.lastUpdatedLabel.text =[[NSString alloc] initWithFormat:@"LastUpdatedTime : %@",appDelegate.currentAccount.dateAndTime]; 
	//time
	NSDate *date = [NSDate date];
	
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@" hh:mm:ss EE MMMM dd, YYYY"];
	//NSString *dateAndTime =  [[NSString alloc] initWithString:];
	self.lastUpdatedLabel.text =[NSString stringWithFormat:@"LastUpdatedTime : %@",[dateFormat stringFromDate:date]];

	[dateFormat release];
	
	[self.tableView reloadData];
}

//to flip the settings
-(IBAction)setting_Visibilty_function
{
	SettingsViewController *controller = self.settingsViewController;
	//controller.data = self.data;
	[[self navigationController] pushViewController:controller animated:YES];	
}



//init if  necesary
- (LoginScreenViewController *)loginScreenViewController
{
    // Instantiate the stcok quote view controller if necessary.
    if (loginScreenViewController == nil) 
	{
		LoginScreenViewController *controller = [[LoginScreenViewController alloc] initWithNibName:@"LoginScreenViewController" bundle:[NSBundle mainBundle]];
        self.loginScreenViewController = controller;
		self.loginScreenViewController.view.frame = CGRectMake(0.0,-5,self.view.frame.size.width,self.view.frame.size.height);
		[self.loginScreenViewController.loginButton  addTarget:self action:@selector(checkLogin:) forControlEvents:UIControlEventTouchUpInside];
		
		[controller release];
    }
	
    return loginScreenViewController;
}






//init if  necesary
- (SplashViewController *)splashScreen
{
    // Instantiate the stcok quote view controller if necessary.
    if (splashScreen == nil) 
	{
		//SplashViewController *controller = [[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:[NSBundle mainBundle]];
        SplashViewController *controller = [[SplashViewController alloc] initScreen];
		self.splashScreen = controller;
		[controller release];
    }
	
    return splashScreen;
}



//show login
-(void)showLogin
{ 
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	//this for covering the Tabcontroller  during the  loading 
	//[self.loginScreenViewController showInView:[[UIApplication sharedApplication] keyWindow]];
	//[self.loginScreenViewController showInView:[[UIApplication sharedApplication] keyWindow]];
	[self presentModalViewController:self.loginScreenViewController  animated:NO];
	//[self.loginContainer showInView:self.view];
	[pool release];
	
}


//hidelogin
-(void)hideLogin
{
	  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    //uncovering
    //[self.loginContainer dismissWithClickedButtonIndex:-1 animated:YES];
		[self dismissModalViewControllerAnimated:NO];
	   //[self.loginScreenViewController  release];
	   [pool release];
}

-(void)checkLogin:(id)sender
{
	[self  loginAction];
}

-(void)loginAction
{
    [self.loginScreenViewController.username resignFirstResponder];
	[self.loginScreenViewController.password resignFirstResponder];
	
	//NSLog(@"%@",self.loginScreenViewController.username.text);
	//NSLog(@"%@",self.loginScreenViewController.password.text);

	/* chaging to os.3
	 if([self.loginScreenViewController.username.text isNotEqualTo:@""] && [self.loginScreenViewController.password.text isNotEqualTo:@""])
	 {      	
	 }
	 else
	 {
	 
	 }
	 */
	
	if([self.loginScreenViewController.username.text isEqualToString:@""] && [self.loginScreenViewController.password.text isEqualToString:@""])
	{
		if([self.loginScreenViewController.username.text isEqualToString:@""])
			self.loginScreenViewController.errormessage.text = @"Please Enter Username"; 
	    else
			self.loginScreenViewController.errormessage.text = @"Please Enter Password";
	}
	else
	{
		self.loginScreenViewController.loginButton.userInteractionEnabled = NO;
		[self.loginScreenViewController.loader startAnimating];
		//[NSThread detachNewThreadSelector:@selector(getSimulatorDataWithLoginCheck) toTarget:self withObject:nil];
		[NSThread detachNewThreadSelector:@selector(showLoader) toTarget:appDelegate withObject:nil];
		[self getSimulatorDataWithLoginCheck];
		[appDelegate hideLoader];
	}
}

-(void)getSimulatorDataWithLoginCheck
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	
	    BOOL login_Boolean = [appDelegate checkLoginAction:self.loginScreenViewController.username.text password:self.loginScreenViewController.password.text];
	//[NSThread detachNewThreadSelector:@selector(hideLoader) toTarget:appDelegate withObject:nil];

	if(login_Boolean)
	{   
		
		
		[self.data setValue:self.loginScreenViewController.username.text forKey:@"Login ID"];
		[self.data setValue:self.loginScreenViewController.password.text forKey:@"Password"];
		
		//saveing  username  and  password to the settings
	    [[NSUserDefaults standardUserDefaults] setValue:self.loginScreenViewController.username.text forKey:@"username_isimulator"];
		[[NSUserDefaults standardUserDefaults] setValue:self.loginScreenViewController.password.text forKey:@"password_isimulator"];
		
		//[NSThread detachNewThreadSelector:@selector(getSimulatorData) toTarget:appDelegate withObject:nil];
		//[NSThread detachNewThreadSelector:@selector(hideLogin) toTarget:self withObject:nil];
		
		[self hideLogin];
		[appDelegate getSimulatorData];

	}
	else
	{
		self.loginScreenViewController.errormessage.text = [NSString stringWithString:@"Username & Password Not Correct"];
		[self showLogin];
	}
	
	
	
	[self.loginScreenViewController.loader stopAnimating];
	self.loginScreenViewController.loginButton.userInteractionEnabled = YES;
	[pool release];
}


- (void)dealloc 
{   
	[splashScreen release];
	[loginScreenViewController release];
	[lastUpdatedLabel release];
	[data release];
    [settingsViewController release];
	[tableView release];
    [super dealloc];
}

@end
