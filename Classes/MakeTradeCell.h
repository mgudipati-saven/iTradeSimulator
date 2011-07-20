//
//  DefaultViewCell.h
//  StockSimulator
//
//  Created by Saven  on 29/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MakeTradeCell : UITableViewCell {
	
	//details
	UILabel *identifier;
	UILabel *description;
	
}



@property (nonatomic, retain) UILabel *identifier;
@property (nonatomic, retain) UILabel *description;

@end
