//
//  RankingTableViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 5/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsOfRankerViewController.h"
@class DetailsOfRankerViewController,StockSimulatorAppDelegate;
@interface RankingTableViewController : UITableViewController {
    DetailsOfRankerViewController *detailsOfRankerViewController;	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
}

@property(nonatomic,retain) DetailsOfRankerViewController *detailsOfRankerViewController;
@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
-(void)reloadDataFunction;
@end
