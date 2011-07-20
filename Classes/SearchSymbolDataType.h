//
//  SearchSymbolDataType.h
//  StockSimulator
//
//  Created by Saven  on 03/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SearchSymbolDataType : NSObject {
       
	NSString *symbol;
	NSString *name;
	NSString *exchange;
	NSString *type;
	NSString *cusip;
}

@property (nonatomic, retain) NSString *symbol;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *exchange;
@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *cusip;
@end
