//
//  AccountViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StockSimulatorAppDelegate.h"
#import "SettingsViewController.h"
#import "LoginScreenViewController.h" 
#import "SplashViewController.h"

@class LoginScreenViewController,StockSimulatorAppDelegate,SplashViewController;
@interface AccountViewController : UIViewController<UIActionSheetDelegate>{
	
	//appdelegate
	StockSimulatorAppDelegate *appDelegate;	
	
	IBOutlet	UITableView	    *tableView;
	
	//veeru moving setting to accounts
	SettingsViewController *settingsViewController;
	
	NSMutableDictionary *data;
	//
	IBOutlet UIButton *settings_Hadler;
	
	IBOutlet UILabel *lastUpdatedLabel;
	
	//loginscreen
	LoginScreenViewController *loginScreenViewController;
	
	
	//splash screen
	SplashViewController *splashScreen;
	
	//serach screen
	//SearchSymbolViewController *searchSymbolViewController;

}

@property (nonatomic,assign) StockSimulatorAppDelegate *appDelegate;

@property (nonatomic, retain) SettingsViewController *settingsViewController;
@property (nonatomic, retain) IBOutlet UIButton *settings_Hadler;

@property (nonatomic, retain) IBOutlet UILabel *lastUpdatedLabel;

@property (nonatomic, retain) IBOutlet NSMutableDictionary *data;

//loginscreen
@property (nonatomic, retain) LoginScreenViewController *loginScreenViewController;
@property (nonatomic, retain) SplashViewController *splashScreen;


- (void)refresh:(id)sender;
- (void)reloadDataFunction;
- (IBAction)setting_Visibilty_function;
//show login
- (void)showLogin;
//hidelogin
- (void)hideLogin;
- (void)loginAction;
- (void)checkLogin:(id)sender;
-(void)getLoginDetailView;
-(void)getSimulatorDataWithLoginCheck;
//-(void)showSearchSymbol:(id)sender;

@end
