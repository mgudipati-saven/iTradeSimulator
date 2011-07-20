//
//  OrderViewController.h
//  StockSimulator
//  PAVAN
//  Created by Saven Technologies on 09/07/09.
//  Copyright 2009 SAVENTECH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailOrderViewController.h"
#import  "OrderHistory.h"
@class StockSimulatorAppDelegate;
@interface OrderViewController : UIViewController {
    
	
	IBOutlet UITableView *tableView;
	
	//perment Array
	NSMutableArray *OrderHistory_Array;
	
	
	NSMutableString *contentOfCurrentProperty;
	OrderHistory  *content_deatil_dictionary;
	
	//DetailOrderViewController
	DetailOrderViewController *detailOrderViewController;
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
}
@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property(nonatomic,retain) NSMutableArray *OrderHistory_Array;
@property(nonatomic,retain) NSMutableString *contentOfCurrentProperty;
@property(nonatomic,retain) OrderHistory  *content_deatil_dictionary;
@property(nonatomic,retain) DetailOrderViewController *detailOrderViewController;

- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error;
- (void)getCommunityData;



@end
