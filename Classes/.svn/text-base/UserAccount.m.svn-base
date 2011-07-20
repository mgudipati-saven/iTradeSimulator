//
//  UserAccount.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UserAccount.h"


@implementation UserAccount

@synthesize rank;
@synthesize portfolioValue;
@synthesize initialBalance;
@synthesize cashBalance;
@synthesize percentGain;
@synthesize accountID, gameID;
@synthesize gameName;
@synthesize defaultGame;

//pavan
@synthesize beginDate;
@synthesize EndDate;
@synthesize MarketValue;
@synthesize Trades;
@synthesize TradeLimit;
//@synthesize dateAndTime;


/* A sample account details xml.
 
 <accounts>
 <account id="43" gameid="1" name="Stock Simulator Default Game" balance="60240.56" initialbalance="100000.0" portfolio="103136.722109375" marketlong="42896.16" buyingpower="103136.72" default="true" begindate="Tuesday, Nov 25 2008 EST" enddate="Monday, Apr 27 2009 EDT" tradelimit="100.0" trades="3" lasttrade="F" joindate="01/26/2009" resetcount="1" resetdate="04/03/2009 10:09:31 EDT" profileflag="true" />
 <account id="47" gameid="2" name="Simulator-II" balance="50000.0" initialbalance="50000.0" portfolio="50000.0" marketlong="0.0" buyingpower="50000.0" default="false" begindate="Monday, Mar 09 2009 EDT" enddate="Thursday, May 21 2009 EDT" tradelimit="1000.0" trades="0" lasttrade="" joindate="03/09/2009" resetcount="2" resetdate="04/03/2009 10:09:47 EDT" profileflag="true" />
 </accounts>
 <ranks status="ok" count="250" from="1" to="20" >
 <userrank value="2" userid="chethan" portfoliovalue="219807.25329687502" cashbalance="96867.47400000002" lastsymbol="RRR" />
 <rank value="1" userid="rhinoforce" portfoliovalue="341750.7" cashbalance="3781.7000000000116" lastsymbol="ALLP" profileflag="true" isfav="false" />
 <rank value="2" userid="chethan" portfoliovalue="219807.25329687502" cashbalance="96867.47400000002" lastsymbol="RRR" profileflag="true" isfav="false" />
 </ranks>
 
 */

- (id)initWithDictionary:(NSDictionary *)aDictionary 
{
	if ([self init]) 
	{
		NSString *idlocalString = [aDictionary valueForKey:@"id"];
		NSString *gameidlocalString = [aDictionary valueForKey:@"gameid"];
		self.gameName = [aDictionary valueForKey:@"name"];
		NSString *balancelocalString = [aDictionary valueForKey:@"balance"];
		NSString *initialbalancelocalString = [aDictionary valueForKey:@"initialbalance"];
		NSString *portfoliolocalString = [aDictionary valueForKey:@"portfolio"];
		NSString *defaultlocalString = [aDictionary valueForKey:@"default"];
		NSString *ranklocalString = [aDictionary valueForKey:@"rank"];
		
		//pavan
		self.beginDate = [aDictionary valueForKey:@"begindate"];
		self.EndDate = [aDictionary valueForKey:@"enddate"];
		NSString *MarketLonglocalString = [aDictionary valueForKey:@"marketlong"];
		NSString *TradeslocalString = [aDictionary valueForKey:@"trades"];
		NSString *TradeLimitlocalString = [aDictionary valueForKey:@"tradelimit"];
		
		if (idlocalString) 
		{
			self.accountID = [idlocalString intValue];
			//[localString release];
		}
		else
		{
			[idlocalString release];
			idlocalString =nil;
		}
		
		
		if (gameidlocalString) 
		{
			self.gameID = [gameidlocalString intValue];
			//[localString release];
		}
		else
		{
			[gameidlocalString release];
			gameidlocalString =nil;
		}
		
		
		if (balancelocalString) 
		{
			self.cashBalance = [balancelocalString doubleValue];
			//[localString release];
		}
		else
		{
			[balancelocalString release];
			balancelocalString =nil;
		}
		
		
		
		if (initialbalancelocalString) 
		{
			self.initialBalance = [initialbalancelocalString doubleValue];
			//[localString release];
		}
		else
		{
			[initialbalancelocalString release];
			initialbalancelocalString = nil;
		}
		
		
		if (portfoliolocalString) 
		{
			self.portfolioValue = [portfoliolocalString doubleValue];
			//[localString release];
		}
		else
		{
			[portfoliolocalString release];
			portfoliolocalString = nil;
		}
		
		
		
		if (defaultlocalString) 
		{
			self.defaultGame = [defaultlocalString boolValue];
			//[localString release];
		}
		else
		{
			[defaultlocalString release];
			defaultlocalString = nil;
		}
		
		if (ranklocalString) 
		{
			self.rank = [ranklocalString intValue];
			//[localString release];
		}
		else
		{
			[ranklocalString release];
			ranklocalString = nil;
		}
		
		//pavan
		if (MarketLonglocalString) 
		{
			self.MarketValue = [MarketLonglocalString doubleValue];
			//[localString release];
		}
		else
		{
			[MarketLonglocalString release];
			MarketLonglocalString = nil;
		}
		if (TradeslocalString) 
		{
			self.Trades = [TradeslocalString doubleValue];
			//[localString release];
		}
		else
		{
			[TradeslocalString release];
			TradeslocalString = nil;
		}
		
		if (TradeLimitlocalString) 
		{
			self.TradeLimit = [TradeLimitlocalString intValue];
			//[localString release];
		}
		else
		{
			[TradeLimitlocalString release];
			TradeLimitlocalString = nil;
		}
		
		
		
		// Calculate percent gain
		self.percentGain = (self.portfolioValue - self.initialBalance)/self.initialBalance * 100;
		
	    //time
		//NSDate *date = [NSDate date];
		
		//NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
		//[dateFormat setDateFormat:@" hh:mm:ss EE MMMM dd, YYYY"];
		
		//self.dateAndTime= [dateFormat stringFromDate:date];  
		
		//[dateFormat release];
		
	}
	
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Account ID=%d\nGame ID=%d\nGame Name=%@\nDefault=%d", self.accountID, self.gameID, self.gameName, self.defaultGame];
}

- (void)dealloc 
{
	[beginDate release];
	[EndDate release];
	[gameName release];
	//[dateAndTime release];
	[super dealloc];
	
}

@end
