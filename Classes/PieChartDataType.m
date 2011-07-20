//
//  PieChartData.m
//  StockSimulator
//
//  Created by Saven  on 31/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PieChartDataType.h"

@implementation PieChartDataType
@synthesize desc;
@synthesize value;

- (void)dealloc 
{
	[desc release];
	[super dealloc];
}


@end
