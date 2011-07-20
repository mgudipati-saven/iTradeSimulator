//
//  SimulatorXMLParser.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/11/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SimulatorXMLParser.h"
#import "OpenPosition.h"

@implementation SimulatorXMLParser
@synthesize contentOfCurrentProperty;
@synthesize userProfile,ranker_boolean,portfolio_boolean,favStocks,portfolioList,updated_rank,updated_cashBalance,updated_portfolio;

- (void)parseSimulatorData:(NSData *)data parseError:(NSError **)error
{
	NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    
	//init the boolean  to diff rank and  user profile
	self.ranker_boolean  = YES;
	self.portfolio_boolean = YES;
	self.portfolioList = [NSMutableArray array];
	
	// Set self as the delegate of the parser so that it will receive the parser delegate methods callbacks.
	[xmlParser setDelegate:self];

	// Depending on the XML document you're parsing, you may want to enable these features of NSXMLParser.
	[xmlParser setShouldProcessNamespaces:NO];
	[xmlParser setShouldReportNamespacePrefixes:NO];
	[xmlParser setShouldResolveExternalEntities:NO];
	[xmlParser parse];
	[xmlParser release];
}

/* A sample simulator xml data.
 
 <users status="ok">
	<userid>chethan</userid>
	<firstname>chethan</firstname>
	<lastname>reddy</lastname>
	<gender>M</gender>
	<city>hi</city>
	<country>AF </country>
	<description></description>
	<profileflag>true</profileflag>
	<investortype>0</investortype>
	<accounts>
		<account id="43" gameid="1" name="Stock Simulator Default Game" balance="60240.56" initialbalance="100000.0" portfolio="103136.722109375" marketlong="42896.16" buyingpower="103136.72" default="true" begindate="Tuesday, Nov 25 2008 EST" enddate="Monday, Apr 27 2009 EDT" tradelimit="100.0" trades="3" lasttrade="F" joindate="01/26/2009" resetcount="1" resetdate="04/03/2009 10:09:31 EDT" profileflag="true" />
		<account id="47" gameid="2" name="Simulator-II" balance="50000.0" initialbalance="50000.0" portfolio="50000.0" marketlong="0.0" buyingpower="50000.0" default="false" begindate="Monday, Mar 09 2009 EDT" enddate="Thursday, May 21 2009 EDT" tradelimit="1000.0" trades="0" lasttrade="" joindate="03/09/2009" resetcount="2" resetdate="04/03/2009 10:09:47 EDT" profileflag="true" />
	</accounts>
	<commissions>
		<commission name="market" value="10"/>
		<commission name="limit" value="20"/>
		<commission name="stop" value="20"/>
	</commissions>
	<portfolio status="ok" cashbalance="96867.48">
		<position symbol="S" quantity="4000" pricepaid="3.615" description="SPRINT NEXTEL CORP" price="4.19" commission="40.0" />
		<position symbol="RRR" quantity="4820" pricepaid="5.17935" description="RSC HOLDINGS INC" price="5.47" commission="20.0" />
		<position symbol="HP" quantity="1000" pricepaid="22.99" description="HELMERICH &amp; PAYNE INC" price="28.56" commission="10.0" />
		<position symbol="CMKG" quantity="25000" pricepaid="0.93" description="MKTG INC" price="1" commission="20.0" />
		<position symbol="GOOG" quantity="71" pricepaid="349.06" description="GOOGLE INC" price="369.78" commission="10.0" />
	</portfolio>
	<orders status="ok" userid="chethan" accountid="3232" cashbalance="96867.48" trades="63" count="63" from="1" to="20" filter="ALL" >
		<order>
			<orderid>7EBA813B-DF99-4810-B2CA-8074E53E9586</orderid>
			<orderdate>2009-04-01 09:56:42 EST</orderdate>
			<ordertype>BUY</ordertype>
			<symbol>RRR</symbol>
			<qty>4600.0</qty>
			<pricetype>Market</pricetype>
			<price>5.17</price>
			<pricepaid>5.1798</pricepaid>
			<status>EXECUTED</status>
			<message></message>
		</order>
		<...>
		<...>
	</orders>
	<ranks status="ok" count="250" from="1" to="20" >
		<userrank value="2" userid="chethan" portfoliovalue="219807.25329687502" cashbalance="96867.47400000002" lastsymbol="RRR" />
		<rank value="1" userid="rhinoforce" portfoliovalue="341750.7" cashbalance="3781.7000000000116" lastsymbol="ALLP" profileflag="true" isfav="false" />
		<rank value="2" userid="chethan" portfoliovalue="219807.25329687502" cashbalance="96867.47400000002" lastsymbol="RRR" profileflag="true" isfav="false" />
	</ranks>
	<watch status="ok" request="G">
		<symbol rating="0">C</symbol>
		<symbol rating="0">CBON</symbol>
	</watch>
	<favourites>
		<user id="ambatigan" rank="38" portfoliovalue="100978.0" profileflag="false" gender="M"/>
		<user id="niamathbasha" rank="171" portfoliovalue="100000.0" profileflag="true" gender="M"/>
	</favourites>
 </users>
 
 */

// XML Parser callbacks
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (qName) 
	{
        elementName = qName;
    }
	
    if ([elementName isEqualToString:@"users"]) 
	{
		// Root element. Setup UserProfile object
		self.userProfile = [[UserProfile alloc] init];
		return;
	}
	if ([elementName isEqualToString:@"community"]) 
	{
		// Root element. Setup UserProfile object
		self.ranker_boolean = NO;
		self.userProfile = [[UserProfile alloc] init];
		return;
	}
	
	if ([elementName isEqualToString:@"position"]) 
	{
		if(self.ranker_boolean)	
		{	
			// Create an OpenPosition using the attribute dict
			OpenPosition *openPosition = [[OpenPosition alloc] initWithDictionary:attributeDict];
	  		
			// Add the new open position to the application's array of open positions.
			[(id)[[UIApplication sharedApplication] delegate] performSelectorOnMainThread:@selector(addToPortfolioList:) withObject:openPosition waitUntilDone:YES];
		
			//CalCulating the realtime portfolio 
			self.updated_portfolio += openPosition.currentValue;
	
			//dont do this  relase
			[openPosition  release];	
			//openPosition = nil;
		}
		else
		{
			[self.portfolioList addObject:attributeDict];		  
		}
	}
	if ([elementName isEqualToString:@"rank"]) 
	{
	     if(self.ranker_boolean)	
		 {	 
			 // Add the rank to the application's array of ranks.
			 [(id)[[UIApplication sharedApplication] delegate] performSelectorOnMainThread:@selector(addToRankList:) withObject:attributeDict waitUntilDone:YES];
         }
		 else{
		     self.contentOfCurrentProperty = [NSMutableString string];
		 }
	}
	else if ([elementName isEqualToString:@"userrank"]) 
	{
	}
	else if ([elementName isEqualToString:@"account"]) 
	{
		// Create a UserAccount using the attribute dict
		UserAccount *userAccount = [[UserAccount alloc] initWithDictionary:attributeDict] ;
		NSLog( @"xml parser user account = %@", userAccount);
		// Add the new user account to the application's array of user accounts.
		[(id)[[UIApplication sharedApplication] delegate] performSelectorOnMainThread:@selector(addToAccountList:) withObject:userAccount waitUntilDone:YES];
		[userAccount release];
	}
	else if ([elementName isEqualToString:@"userid"] || [elementName isEqualToString:@"firstname"] ||
		     [elementName isEqualToString:@"lastname"] || [elementName isEqualToString:@"gender"] ||
			 [elementName isEqualToString:@"fname"] || [elementName isEqualToString:@"lname"] ||
			 [elementName isEqualToString:@"joindate"] || [elementName isEqualToString:@"rank"] ||
		     [elementName isEqualToString:@"balance"] || 
			 [elementName isEqualToString:@"lasttrade"] || [elementName isEqualToString:@"profitloss"] ||
		     [elementName isEqualToString:@"ratio"] || [elementName isEqualToString:@"city"] ||
		     [elementName isEqualToString:@"description"] || [elementName isEqualToString:@"country"] ||
		     [elementName isEqualToString:@"investortype"] || [elementName isEqualToString:@"profileflag"] ||[elementName isEqualToString:@"trades"]) 
	{
	     self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if([elementName isEqualToString:@"portfolio"])
	{
		//getting the latest cashBalance when portfolio are comming
		if(self.ranker_boolean)
		{
			//calculating the realtime rank and  cash balance
			if([attributeDict valueForKey:@"cashbalance"])
			{	
				self.updated_cashBalance = [[attributeDict valueForKey:@"cashbalance"] doubleValue];
			    //self.updated_rank =   [[attributeDict valueForKey:@"rank"] intValue];
			}
		}
		if(!self.ranker_boolean && self.portfolio_boolean)	
		{	
		   self.contentOfCurrentProperty = [NSMutableString string];
	    }
	}
	else if([elementName isEqualToString:@"favstks"])
	{
	    self.favStocks  = [NSMutableArray array];
	}
	else if([elementName isEqualToString:@"symbol"])
	{
		//add the fav quotes
	    if(self.favStocks)
		{
			[self.favStocks addObject:attributeDict];
		}
	}
	else 
	{
	    self.contentOfCurrentProperty = nil;
	}
		
	/*
	 else if ([elementName isEqualToString:@"userid"]) 
	{
		// Create a mutable string to hold the contents of the 'userid' element.
		// The contents are collected in parser:foundCharacters:.
		self.contentOfCurrentProperty = [NSMutableString string];
    } 
	else if ([elementName isEqualToString:@"firstname"]) 
	{
		// Create a mutable string to hold the contents of the 'firstname' element.
		// The contents are collected in parser:foundCharacters:.
		self.contentOfCurrentProperty = [NSMutableString string];
	} 
	else if ([elementName isEqualToString:@"lastname"]) 
	{
		// Create a mutable string to hold the contents of the 'lastname' element.
		// The contents are collected in parser:foundCharacters:.
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if ([elementName isEqualToString:@"gender"]) 
	{
		// Create a mutable string to hold the contents of the 'lastname' element.
		// The contents are collected in parser:foundCharacters:.
		self.contentOfCurrentProperty = [NSMutableString string];
	}
	else if
	{
	
	}
	else 
	{
        // The element isn't one that we care about, so set the property that holds the 
        // character content of the current element to nil. That way, in the parser:foundCharacters:
        // callback, the string that the parser reports will be ignored.
        self.contentOfCurrentProperty = nil;
    }*/
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{     
    if (qName) 
	{
        elementName = qName;
    }
    
    if ([elementName isEqualToString:@"userid"]) 
	{
        self.userProfile.userid = contentOfCurrentProperty;        
    } 
	else if ([elementName isEqualToString:@"firstname"]) 
	{
        self.userProfile.firstName = contentOfCurrentProperty;        
    } 
	else if ([elementName isEqualToString:@"lastname"]) 
	{
        self.userProfile.lastName = contentOfCurrentProperty;        
    }
	else if ([elementName isEqualToString:@"gender"] ) 
	{
        self.userProfile.gender = contentOfCurrentProperty;        
    }
	else if ([elementName isEqualToString:@"fname"] ) 
	{
	    self.userProfile.firstName = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"lname"] ) 
	{
	    self.userProfile.lastName = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"joindate"] ) 	
	{
	    
		self.userProfile.joinedDate = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"rank"] ) 
	{
	    self.userProfile.rank = [contentOfCurrentProperty integerValue];
	}
	else if ([elementName isEqualToString:@"portfolio"] )
	{
		if(!self.ranker_boolean && self.portfolio_boolean)
		{   
			//setting to false  so that it will not take another  portfolio value  from comunity reques
			self.portfolio_boolean = NO;
			self.userProfile.portfolio = [contentOfCurrentProperty doubleValue];
	    }
	}
	else if ([elementName isEqualToString:@"balance"] ) 
	{
	    self.userProfile.cashBalance = [contentOfCurrentProperty doubleValue];
	}
    else if ([elementName isEqualToString:@"lasttrade"] ) 
	{
	    self.userProfile.lastTrade = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"profitloss"] )
	{
	    self.userProfile.profitOrLoss = [contentOfCurrentProperty doubleValue];
	}
	else if ([elementName isEqualToString:@"ratio"] ) 
	{
	    self.userProfile.ratio = [contentOfCurrentProperty doubleValue];
	}
    else if ([elementName isEqualToString:@"city"] ) 
	{
	    self.userProfile.city = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"description"] ) 
	{
	    self.userProfile.description = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"country"] ) 
	{
	    self.userProfile.country = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"investortype"] ) 
	{
	    self.userProfile.investorType = [contentOfCurrentProperty integerValue];
	}
	else if ([elementName isEqualToString:@"profileflag"] ) 
	{
	    self.userProfile.profileFlag = contentOfCurrentProperty;
	}
	else if ([elementName isEqualToString:@"trades"] ) 
	{
	    self.userProfile.trades = [contentOfCurrentProperty integerValue];
	}
	else if ([elementName isEqualToString:@"users"])
	{
		// End of xml data. Send the UserProfile to application.
		[(id)[[UIApplication sharedApplication] delegate] performSelectorOnMainThread:@selector(setProfile:) withObject:userProfile waitUntilDone:YES];
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (self.contentOfCurrentProperty) 
	{
        // If the current element is one whose content we care about, append 'string'
        // to the property that holds the content of the current element.
        [self.contentOfCurrentProperty appendString:string];
    }
}

- (void)dealloc
{   
	[portfolioList release];
	[favStocks release];
	[contentOfCurrentProperty release];
	[userProfile release];
	[super dealloc];
}

@end
