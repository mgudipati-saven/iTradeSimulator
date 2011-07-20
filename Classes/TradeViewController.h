//
//  TradeViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditingViewController.h"
#import "TypeListViewController.h"
#import "SearchSymbolViewController.h"
#import "OrderViewController.h"

@class  OrderViewController,DefaultViewCell,SearchSymbolViewController;
@interface TradeViewController : UIViewController <UIActionSheetDelegate> {
	NSMutableDictionary *orderDetails;
	SearchSymbolViewController *searchSymbolViewController;
	TypeListViewController *typeListViewController;
	EditingViewController *editingViewController;
	NSMutableString *contentOfCurrentProperty;
	
	//veeru for  tabel view
	IBOutlet UITableView *tableView;
	

	OrderViewController *orderViewController;
		
	IBOutlet  UIButton *submitButton;
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
	
}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;

@property (nonatomic, copy) NSMutableDictionary *orderDetails;
@property (nonatomic, retain) SearchSymbolViewController *searchSymbolViewController;
@property (nonatomic, retain) TypeListViewController *typeListViewController;
@property (nonatomic, retain) EditingViewController *editingViewController;
@property (nonatomic, retain) OrderViewController *orderViewController;
@property (nonatomic, retain) NSMutableString *contentOfCurrentProperty;
@property (nonatomic, retain) IBOutlet  UIButton *submitButton;

- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error;
- (void)initOrderDetails;
- (void)submit:(id)sender;
- (IBAction)showOrderHistory:(id)sender;
- (void)resetOrderDetails;

@end
