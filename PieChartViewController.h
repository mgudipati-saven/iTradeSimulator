//
//  PieChartView.h
//  StockSimulator
//
//  Created by Saven  on 26/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieChartDataType.h"
#import "LegendData.h"
@class PieChartDataType,LegendData;

@interface PieChartViewController : UIView {
	
	
	
	//to hold data
	NSMutableArray *data_array;	
	
	//to hold data
	NSMutableArray *fouth_legendDataArray;	
	
	//to hold data
	NSMutableArray *first_legendDataArray;	
	
	//to hold data
	NSMutableArray *third_legendDataArray;
	
	//to hold data
	NSMutableArray *second_legendDataArray;
	
	
}

@property (nonatomic, retain) NSMutableArray *data_array;
@property (nonatomic, retain) NSMutableArray *fouth_legendDataArray;
@property (nonatomic, retain) NSMutableArray *first_legendDataArray;
@property (nonatomic, retain) NSMutableArray *third_legendDataArray;
@property (nonatomic, retain) NSMutableArray *second_legendDataArray;


- (id)initChart:(CGRect)frame data:(NSMutableArray *)data;
- (UIColor *)randomcolor;
- (void)SetFourthQuadrantData;
- (void)SetFirstQuadrantData;
- (void)SetThirdQuadrantData;
- (void)SetSecondQuadrantData;
- (void)changeDataFuntion:(NSMutableArray *)newdata;

@end
