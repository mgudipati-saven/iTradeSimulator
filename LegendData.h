//
//  LegendData.h
//  StockSimulator
//
//  Created by Saven  on 08/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LegendData : NSObject {
   
	float startLineX;
	float startLineY;
	
	float endLineX;
	float endLineY;
	
	float textStartX;
	float textStartY;
	
	NSString *toolTip;
	
}

@property float startLineX;
@property float startLineY;

@property float endLineX;
@property float endLineY;

@property float textStartX;
@property float textStartY;

@property (nonatomic,retain) NSString *toolTip;

@end
