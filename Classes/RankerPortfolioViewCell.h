//
//  RankerPortfolioViewCell.h
//  StockSimulator
//
//  Created by Saven  on 30/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RankerPortfolioViewCell : UITableViewCell {

	UILabel *symbol;
	UILabel *quantity;
	UILabel *pricePaid;
	UILabel *currentPrice;

}

@property (nonatomic, retain) UILabel *symbol;
@property (nonatomic, retain) UILabel *quantity;
@property (nonatomic, retain) UILabel *pricePaid;
@property (nonatomic, retain) UILabel *currentPrice;
@end
