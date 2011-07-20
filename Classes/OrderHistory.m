//
//  orderHistory.m
//  StockSimulator
//
//  Created by Saven Technologies on 22/07/09.
//  Copyright 2009 SAVENTECH. All rights reserved.
//

#import "OrderHistory.h"


@implementation OrderHistory
@synthesize orderID;
@synthesize orderDate;	
@synthesize ordertype;
@synthesize symbol;
@synthesize qty;
@synthesize pricetype;
@synthesize price;
@synthesize pricepaid;
@synthesize status;


- (void)dealloc 
{ 
	[orderID release];
	[orderDate release];
	[ordertype release];
	[symbol release];
	[qty release];
	[pricetype release];
	[price release];
	[pricepaid release];
	[status release];
    [super dealloc];
}
@end
