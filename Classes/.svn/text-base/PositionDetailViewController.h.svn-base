//
//  PositionDetailViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenPosition.h"
#import "TradeViewController.h"
@class StockSimulatorAppDelegate;
@interface PositionDetailViewController : UITableViewController<UINavigationControllerDelegate>{
	OpenPosition *openPosition;
	
	//veeru bool to pop up view 
	//BOOL pop_boolean; 	
	TradeViewController *tradeViewController;
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;

@property (nonatomic,retain) OpenPosition *openPosition;
//veeru
//@property BOOL pop_boolean; 
@property (nonatomic,retain) TradeViewController *tradeViewController;
-(void)setOpenPositon:(OpenPosition *)newOpenPosition;
@end
