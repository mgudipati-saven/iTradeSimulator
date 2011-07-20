//
//  StockQuoteViewController.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditableCell.h"
#import "AreaChartViewController.h"
#import "NewsViewController.h"
#import "DetailQuoteView.h"
//veeru modified to nib file  for chart view 

@class NewsViewController,DetailQuoteView,StockSimulatorAppDelegate;
@interface EditSymbolViewController : UIViewController<UIActionSheetDelegate,UIScrollViewDelegate>{
    
	//initail data
	NSMutableDictionary *editingItem;
	NSMutableDictionary *quoteDetails;
	NSMutableString *contentOfCurrentProperty;
	
	IBOutlet UIScrollView *scrollView;
    IBOutlet UIPageControl *pageControl;
	
	//symbolView
	UIView *symbolView;
	//UITextField *symbolField;
	//UIButton *symbolButton;
	//veeru for  chart view
	UIImageView *chartView;
	//content
	DetailQuoteView *detailQuoteView;
	
	//new
	NewsViewController *newsViewController;
	
	
	//label
	IBOutlet UILabel *label;
	//mini chart loader
	UIActivityIndicatorView *minichartloader;
		
	//veeru bigChart
	AreaChartViewController *areaChartViewController;	
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
	
}

@property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
@property (nonatomic, retain) NSMutableDictionary *editingItem;
@property (nonatomic, retain)  UIView *symbolView;
@property (nonatomic, retain)  UILabel *label;
//@property (nonatomic, retain)  UITextField *symbolField;
//@property (nonatomic, retain)  UIButton *symbolButton;
@property (nonatomic, retain) DetailQuoteView *detailQuoteView;
@property (nonatomic, retain) UIImageView *chartView;
@property (nonatomic, retain)  UIActivityIndicatorView *minichartloader;

//scroll VIEW
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) NewsViewController *newsViewController;

@property (nonatomic, retain) NSMutableDictionary *quoteDetails;
@property (nonatomic, retain) NSMutableString *contentOfCurrentProperty;

@property (nonatomic, retain) AreaChartViewController *areaChartViewController;
//get quotes
- (void)getQuote; 
- (void)parseXMLQuote:(NSData *)data parseError:(NSError **)error;
- (IBAction)changePage:(id)sender;
- (void)getQuoteStatus;
- (void)hidingFunction;

@end
