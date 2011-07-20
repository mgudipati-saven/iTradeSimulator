//
//  GameSelectionViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/29/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StockSimulatorAppDelegate;
@interface GameSelectionViewController : UITableViewController {

	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
	
}
  @property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@end
