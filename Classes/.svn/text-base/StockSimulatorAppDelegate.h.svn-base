//
//  StockSimulatorAppDelegate.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PortfolioTableViewController.h"
#import "AccountViewController.h"
#import "SettingsViewController.h"
#import "RankingTableViewController.h"
#import "TradeViewController.h"
#import "OpenPosition.h"
#import "UserAccount.h"
#import "UserProfile.h"
#import "CustomTabBarController.h"
#import "Reachability.h"
#import "LoaderViewController.h"
#import "CommunityViewController.h"

@class LoaderViewController;
@interface StockSimulatorAppDelegate : NSObject <UINavigationControllerDelegate,UIApplicationDelegate,UIActionSheetDelegate,UITabBarDelegate,UITabBarControllerDelegate> {
    UIWindow *window;
    //coment by  veeru
	//UITabBarController *tabBarController;
	//veeru custom tab controller
	CustomTabBarController *tabBarController;
	
	PortfolioTableViewController *portfolioViewController;	
	AccountViewController *accountViewController;
	CommunityViewController *communityViewController;
	TradeViewController *tradeViewController;
	RankingTableViewController *rankingTableViewController;
	
	NSMutableArray *accountList;
	NSMutableArray *portfolioList;
	NSMutableArray *rankList;
	UserAccount *currentAccount;
	UserProfile *userProfile;
	
	//ranker deatils
	NSMutableArray *rankerPortfolioList;	
	
	NSMutableDictionary *gameSettings;
	NSString *pathToUserCopyOfPlist;

	//veeru 
	BOOL orientation_bool;
	NetworkStatus internetConnectionStatus;
			
	//lodercover to controll the  tabs movement
	LoaderViewController *loaderCover;
	
	BOOL  bigChart_Boolean;
	
	//String to HOld the Previous viewController
	NSString *presentViewControllerTitle;
	
	

}

@property (nonatomic, retain) NSString *presentViewControllerTitle;
@property (nonatomic, retain) UserAccount *currentAccount;
@property (nonatomic, retain) UserProfile *userProfile;
@property (nonatomic, retain) CustomTabBarController *tabBarController;
@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) NSMutableArray *accountList;
@property (nonatomic, retain) NSMutableArray *portfolioList;
@property (nonatomic, retain) NSMutableArray *rankList;
@property (nonatomic, retain) PortfolioTableViewController *portfolioViewController;
@property (nonatomic, retain) AccountViewController *accountViewController;
@property (nonatomic, retain) CommunityViewController *communityViewController;
@property (nonatomic, retain) TradeViewController *tradeViewController;
@property (nonatomic, retain) RankingTableViewController *rankingTableViewController;
@property (nonatomic, retain) NSMutableDictionary *gameSettings;
@property (nonatomic, copy) NSString *pathToUserCopyOfPlist;
@property BOOL  bigChart_Boolean;

//veeru 
@property BOOL orientation_bool;

@property NetworkStatus internetConnectionStatus;
@property (nonatomic, retain) LoaderViewController *loaderCover;


- (void)getSimulatorData;
- (void)getPortfolioData;
- (NSUInteger)openPositionCount;
- (OpenPosition *)openPositionAtIndex:(NSUInteger)index;
- (void)placeOrder:(NSDictionary *)orderDetails;
- (NSArray *)orderTypes;
- (NSArray *)priceTypes;
- (NSArray *)termTypes;
- (NSString *)baseURL;
- (NSString *)userid;
- (NSArray *)games;
- (UserAccount *)accountForGame:(NSString *)game;
- (UserAccount *)accountAtIndex:(NSUInteger)index;
- (NSUInteger)accountCount;
- (void)setCurrentAccountByIndex:(NSUInteger)index;

//ranker
- (NSDictionary *)getRankerAtIndex:(NSUInteger)index;
- (void)updateStatus;

//login
- (BOOL)checkLoginAction:(NSString *)username password:(NSString *)password;

//image
- (NSData *)getImageData:(NSString *)userID ;

//scalling of image
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize sourceImage:(UIImage *)image;

//rankers data
- (void)getRankersData;

//refresh the accounts
- (void)refreshAccount;


//veeru
//toshowLoader
- (void)showLoader;
//tohideLoader
- (void)hideLoader;

@end
