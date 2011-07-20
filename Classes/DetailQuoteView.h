//
//  DetailQuoteView.h
//  StockSimulator
//
//  Created by Saven  on 15/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailQuoteView : UIView {
	UILabel *descrption;
	UILabel *exchange;
	UILabel *last_label;
    UILabel *change_label;
	UILabel *volume_label;
    UILabel *last;
	UILabel *change;
    UILabel *volume;
	
}

@property (nonatomic, retain) UILabel *last_label;
@property (nonatomic, retain) UILabel *exchange;
@property (nonatomic, retain) UILabel *descrption;
@property (nonatomic, retain)  UILabel *change_label;
@property (nonatomic, retain)  UILabel *volume_label;
@property (nonatomic, retain)  UILabel *last;
@property (nonatomic, retain) UILabel *change;
@property (nonatomic, retain)  UILabel *volume;

@end
