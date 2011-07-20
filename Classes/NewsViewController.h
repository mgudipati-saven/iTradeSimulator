//
//  NewsViewController.h
//  StockSimulator
//
//  Created by Saven  on 07/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StockSimulatorAppDelegate;
@interface NewsViewController : UIViewController {

	//veeru for  tabel view
	IBOutlet UITableView *tableView;
	
	//veeru for  tabel view
	NSString  *symbol;
	NSMutableString *contentOfCurrentProperty;
	
	NSMutableArray *news_Array;
	NSMutableArray *date_Array;
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property (retain, nonatomic) NSString  *symbol;
@property (retain, nonatomic) NSMutableString *contentOfCurrentProperty;
@property (nonatomic, retain) NSMutableArray  *news_Array;
@property (nonatomic, retain) NSMutableArray  *date_Array;

- (void)getNewData:(NSString *)newsSymbol;
- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error;
@end
