//
//  AccountCell.h
//  StockSimulator
//
//  Created by Saven  on 06/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AccountCell : UITableViewCell {
	UIImageView *avatar;
	UILabel *label;
}

@property (nonatomic, retain) UIImageView *avatar;
@property (readonly, retain) UILabel *label;
@end
