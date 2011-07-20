//
//  PortfolioTableViewCell.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PortfolioTableViewCell : UITableViewCell {
	UILabel *symbol;
	UILabel *value;
	UILabel *gain;
}

@property (readonly, retain) UILabel *symbol;
@property (readonly, retain) UILabel *value;
@property (readonly, retain) UILabel *gain;

@end
