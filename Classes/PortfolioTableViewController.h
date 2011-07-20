//
//  PortfolioTableViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/10/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PositionDetailViewController.h"

@class PieChartViewController,StockSimulatorAppDelegate;
@interface PortfolioTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
	
	PositionDetailViewController *positionViewController;
	
	//VEERU 
	IBOutlet	UITableView	    *tableView;
	IBOutlet    UIView          *chartView;
	BOOL show_Chart;
   
	PieChartViewController *pieChartView;
	
	//piechart data array
	NSMutableArray *dataArray;

	//apdelagate
	StockSimulatorAppDelegate *appDelegate;

}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property (nonatomic, retain) PositionDetailViewController *positionViewController;

@property (nonatomic, retain) UIView *chartView;

@property (nonatomic, retain) PieChartViewController *pieChartView;
@property (nonatomic, retain) NSMutableArray *dataArray;


@property BOOL show_Chart;

- (void)reloadDataFunction;
- (void)toggleChart:(id)sender;


@end
