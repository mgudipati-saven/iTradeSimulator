//
//  AccountViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StockSimulatorAppDelegate;
@interface AreaChartViewController : UIAlertView<UIActionSheetDelegate>{


	 UIView *view;
	 UISegmentedControl *segmentedControl;	
	 UIImageView *imageView;
	 UILabel *loader;
	NSString *symbol;
	NSString *range;
	int width;
	int height;
   StockSimulatorAppDelegate *appDelegate;

}



@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property (nonatomic, retain)  UIView *view;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;
@property (nonatomic, retain)  UIImageView *imageView;
@property (nonatomic, retain)  UILabel *loader;
@property (nonatomic, retain) NSString *symbol;
@property (nonatomic, retain) NSString *range;
@property int width;
@property int height;

- (void)show;

- (void)updateTicker:(NSString *)ticker;
- (void)onPeriodChange:(id)sender;
-(id)initWithdelegate:(id)delegate; 
@end
