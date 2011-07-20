//
//  CommunityViewController.h
//  StockSimulator
//
//  Created by Saven  on 03/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//    

#import <UIKit/UIKit.h>
#import "RatingViewController.h";
#import "DetailsOfRankerViewController.h"
#import "TradeViewController.h"

@class RatingViewController,DetailsOfRankerViewController,TradeViewController,StockSimulatorAppDelegate;
@interface CommunityViewController : UIViewController {

	IBOutlet	UITableView	    *tableView; 
	
	NSMutableArray *portfolio_Array;
	NSMutableArray *activeUsers_Array;
	NSMutableArray *buy_rating_Array;
	NSMutableArray *sell_rating_Array;
	NSMutableArray *bought_tradeStocks_Array;
	NSMutableArray *sold_tradeStocks_Array;
	NSMutableArray *popularTrader_Array;
	
	NSMutableString *contentOfCurrentProperty;
	NSMutableDictionary  *content_deatil_dictionary;	
	
	
	//rating 
	RatingViewController *ratingViewController;
	
	
	//parsing init specific  array
	BOOL stocks_rating_boolean;
	
	//intger of pasing the  values  specfic array
	
	int grouping_specifier;	
	
	 DetailsOfRankerViewController *detailsOfRankerViewController;	
	
	TradeViewController *tradeViewController;
	
	//to hold the current price
	float current_price;  
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property(nonatomic,retain) NSMutableArray *portfolio_Array;
@property(nonatomic,retain) NSMutableArray *activeUsers_Array;
@property(nonatomic,retain) NSMutableArray *buy_rating_Array;
@property(nonatomic,retain) NSMutableArray *sell_rating_Array;
@property(nonatomic,retain) NSMutableArray *bought_tradeStocks_Array;
@property(nonatomic,retain) NSMutableArray *sold_tradeStocks_Array;
@property(nonatomic,retain) NSMutableArray *popularTrader_Array;
@property (nonatomic, retain) NSMutableString *contentOfCurrentProperty;
@property (nonatomic, retain) NSMutableDictionary  *content_deatil_dictionary;	

@property (nonatomic, retain) RatingViewController *ratingViewController;
@property BOOL stocks_rating_boolean;
@property int grouping_specifier;
@property float current_price;

@property(nonatomic,retain) DetailsOfRankerViewController *detailsOfRankerViewController;
@property (nonatomic,retain) TradeViewController *tradeViewController;

- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error;
- (void)getCommunityData;
- (void)GetCurrentPrice:(NSString *)symbol;

@end
