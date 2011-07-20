//
//  DetailOrderViewController.h
//  StockSimulator
//  PAVAN
//  Created by Saven Technologies on 09/07/09.
//  Copyright 2009 SAVENTECH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderHistory.h"
@class StockSimulatorAppDelegate;
@interface DetailOrderViewController : UIViewController<UIActionSheetDelegate>{

	IBOutlet UITableView *tableView;
	
	IBOutlet UIButton *CancelButton;
	OrderHistory *data_deatail;
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
     
}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property(nonatomic,retain) OrderHistory *data_deatail;
@property(nonatomic,retain) IBOutlet UIButton *CancelButton;

- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error;
- (IBAction)CancelAction:(id)sender;
-(void)set_data_deatail:(OrderHistory *)newData;


@end
