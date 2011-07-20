//
//  DetailsOfRankerViewController.h
//  StockSimulator
//
//  Created by Saven  on 28/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankerTableViewCell.h"
#import "UserProfile.h"
@class  DefaultViewCell,StockSimulatorAppDelegate;
@interface DetailsOfRankerViewController : UIViewController {
	
	NSDictionary *rankerData;
	
	RankerTableViewCell *RankerProfileCell;
	
	//VEERU 
	IBOutlet	UITableView	    *tableView;
	
	NSMutableArray *rankerPortfolio;
	
	UserProfile *rankerProfile;
	
	//favimage
	//UIBarButtonItem  *favButton;
	
	//fava quotes
	NSMutableString   *favBuys;
	NSMutableString   *favSells;
	
	//
	NSMutableArray   *investorType;
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;	
	
}
- (void)reloadDataFunction;
- (void)getRankerDetails;
@property(nonatomic,retain) NSDictionary *rankerData;
@property(nonatomic,retain) NSMutableArray   *investorType;
@property(nonatomic,retain) NSMutableArray *rankerPortfolio;
@property(nonatomic,retain) UserProfile *rankerProfile;
@property(nonatomic,retain) NSMutableString   *favBuys;
@property(nonatomic,retain) NSMutableString   *favSells;
@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;

- (void)changeFavoriteState:(id)sender;
- (void)setRankers:(NSDictionary *)newDetails;

@end
