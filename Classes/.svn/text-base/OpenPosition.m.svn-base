//
//  OpenPosition.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/9/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "OpenPosition.h"

@implementation OpenPosition

@synthesize symbol;
@synthesize desc;
@synthesize quantity;
@synthesize currentPrice;
@synthesize purchasePrice;
@synthesize netChange;
@synthesize currentValue;
@synthesize lossOrGain;
@synthesize commission;
/* A sample portfolio listing open positions.
 
 <portfolio status="ok" cashbalance="5114.29">
 <order symbol="SIRI" quantity="70000" pricepaid="0.3306" description="SIRIUS XM RADIO INC" price="0.351" commission="10.0" />
 <...>
 <...>
 </portfolio>
 
 */

- (id)initWithDictionary:(NSDictionary *)aDictionary 
{
	if ([self init]) 
	{
		self.symbol = [aDictionary valueForKey:@"symbol"];
		self.desc = [aDictionary valueForKey:@"description"];
		
		NSString *localString = [aDictionary valueForKey:@"quantity"];
		if (localString) 
		{
			self.quantity = [localString intValue];
			//[localString release];
		}
		
		localString = [aDictionary valueForKey:@"price"];
		if (localString) 
		{
			self.currentPrice = [localString doubleValue];
			//[localString release];
		}
		
		localString = [aDictionary valueForKey:@"pricepaid"];
		if (localString) 
		{
			self.purchasePrice = [localString doubleValue];
			//[localString release];
		}
		
		//verendra for commission
		localString = [aDictionary valueForKey:@"commission"];
		if (localString) 
		{
			self.commission = [localString doubleValue];
			//[localString release];
			
		}
		
		
		// Calculate net change
		self.netChange = self.currentPrice - self.purchasePrice;
		
		// Calculate value of this position
		self.currentValue = self.currentPrice * self.quantity;
		
		// Calculate loss or gain
		self.lossOrGain = self.netChange * self.quantity;
	}
	
	return self;
}

- (NSString *)description
{
	return [NSString  stringWithFormat:@"Symbol=%@, Desc=%@, Qty=%d, Price Paid=%F, Cur. Price=%F, Chg=%F, Cur. Val=%F, Net=%F",
			self.symbol, self.desc, self.quantity, self.purchasePrice, self.currentPrice, self.netChange, self.currentValue, self.lossOrGain];
}

- (void)dealloc 
{
	[symbol release];
	[desc release];
	[super dealloc];
}

@end
