//
//  UserAccount.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserAccount : NSObject {
	int rank;
	int accountID;
	int gameID;
	BOOL defaultGame;
	double portfolioValue;
	double initialBalance;
	double cashBalance;
	double percentGain;
	NSString *gameName;
	
	//pavan
	NSString *beginDate;
	NSString *EndDate;
	double MarketValue;
	int TradeLimit;
	int Trades;
	
	//veeru date
	//NSString *dateAndTime;
    
}

@property int rank;
@property int accountID;
@property int gameID;
@property BOOL defaultGame;
@property double portfolioValue;
@property double initialBalance;
@property double cashBalance;
@property double percentGain;

@property (nonatomic, retain) NSString *gameName;

//pavan
@property (nonatomic, retain) NSString *beginDate;
@property (nonatomic, retain) NSString *EndDate;
@property double MarketValue;
@property int Trades;
@property int TradeLimit;

//@property (nonatomic, retain) NSString *dateAndTime;

- (id)initWithDictionary:(NSDictionary *)aDictionary;
- (NSString *)description;

@end
