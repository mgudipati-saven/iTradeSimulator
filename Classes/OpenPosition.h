//
//  OpenPosition.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//  Abstract: Simple object that encapsulates an open position in a stock portfolio.
//  Version: 1.0

#import <Foundation/Foundation.h>


@interface OpenPosition : NSObject {
	NSString *symbol;
	NSString *desc;
	int quantity;
	double currentPrice;
	double purchasePrice;
	double netChange;
	double currentValue;
	double lossOrGain;
	double commission;
}

- (id)initWithDictionary:(NSDictionary *)aDictionary;
- (NSString *)description;

@property (nonatomic, retain) NSString *symbol;
@property (nonatomic, retain) NSString *desc;
@property int quantity;
@property double currentPrice;
@property double purchasePrice;
@property double netChange;
@property double currentValue;
@property double lossOrGain;
@property double commission;

@end

