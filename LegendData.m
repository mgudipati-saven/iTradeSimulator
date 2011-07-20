//
//  LegendData.m
//  StockSimulator
//
//  Created by Saven  on 08/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LegendData.h"


@implementation LegendData
@synthesize startLineX,startLineY,endLineX,endLineY,textStartX,textStartY,toolTip;

- (void)dealloc 
{
	[toolTip release];  
	[super dealloc];
}
@end
