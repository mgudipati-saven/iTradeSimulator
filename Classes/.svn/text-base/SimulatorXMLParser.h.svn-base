//
//  SimulatorXMLParser.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAccount.h"
#import "UserProfile.h"

typedef enum {
	XMLParserStateNone,
	XMLParserStatePortfolio,
	XMLParserStateOrders
} XMLParserState;

@interface SimulatorXMLParser : NSObject 
{
	XMLParserState parserState;
	NSMutableString *contentOfCurrentProperty;
	UserProfile *userProfile;

	BOOL ranker_boolean;

	//portfolio are  comming 2 times in community so that setting the boolean
	BOOL portfolio_boolean;

	//favstocks
	NSMutableArray *favStocks;

	/* THIS ARE FOR REAL TIME UPDATES THESE WHEN PORTFOLIO IS UPDATING*/
	//rank
	 int updated_rank;

	//cashbalance
	 double updated_cashBalance;

	//updated portfoloio
	double updated_portfolio;
		
	//portfolio
	NSMutableArray *portfolioList;
}

@property (nonatomic, retain) NSMutableString *contentOfCurrentProperty;

@property (nonatomic, retain) UserProfile *userProfile;
@property (nonatomic, retain) NSMutableArray *portfolioList;
@property BOOL ranker_boolean;
@property BOOL portfolio_boolean;

@property int updated_rank;
@property double updated_cashBalance;
@property double updated_portfolio;

@property (nonatomic, retain) NSMutableArray *favStocks;

- (void)parseSimulatorData:(NSData *)data parseError:(NSError **)error;

@end

