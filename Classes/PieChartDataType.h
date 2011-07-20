//
//  PieChartData.h
//  StockSimulator
//
//  Created by Saven  on 31/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PieChartDataType : NSObject {
  	double value;
 	NSString *desc;
}

@property double value;
@property (nonatomic, retain) NSString *desc;
@end
