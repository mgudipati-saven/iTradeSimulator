//
//  SearchSymbolViewController.h
//  StockSimulator
//
//  Created by Saven  on 03/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchSymbolDataType.h"
#import "EditSymbolViewController.h"

@class StockSimulatorAppDelegate,SearchSymbolDataType,EditSymbolViewController;
@interface SearchSymbolViewController : UIViewController {

	//appdelegate
	StockSimulatorAppDelegate *appDelegate;
	IBOutlet	UITableView	    *tableView;
	IBOutlet	UITextField	 *serachInput;

	NSMutableArray *symbolsDataArray; 	
	
	NSURLConnection* connection;
    NSMutableData* data;
	
	NSMutableString *contentOfCurrentProperty;
	
    SearchSymbolDataType *searchDataType;
	//initail data
	NSMutableDictionary *editingItem;
	
	//
	EditSymbolViewController *editSymbolViewController;
	
}
@property (nonatomic, retain) EditSymbolViewController *editSymbolViewController;
@property (nonatomic, retain) NSMutableString *contentOfCurrentProperty;
@property (nonatomic, retain)  SearchSymbolDataType *searchDataType;
@property (nonatomic,assign) StockSimulatorAppDelegate *appDelegate;
@property (nonatomic,retain) IBOutlet UITextField *serachInput;
@property (nonatomic,retain) IBOutlet NSMutableArray *symbolsDataArray; 
@property (nonatomic,retain) NSURLConnection* connection;
@property (nonatomic,retain)  NSMutableData* data;
@property (nonatomic, retain) NSMutableDictionary *editingItem;
- (void)loadFromURL:(NSURLRequest *)url;
- (void)getSymbolsData:(id)sender;
- (void)parseXMLQuote:(NSData *)datatoparse parseError:(NSError **)error;
-(void)sendRequest;
@end
