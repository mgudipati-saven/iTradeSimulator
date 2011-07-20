//
//  UserProfile.h
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/24/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserProfile : NSObject {
	/*NSString *userid;
	NSString *firstName;
	NSString *lastName;	
	NSString *gender;*/
	NSString  *userid;
    NSString  *firstName;
	NSString  *lastName;
	NSString  *joinedDate;
	int	   rank;
	double  portfolio;
	double  cashBalance;
	NSString  *lastTrade;
	double  profitOrLoss;
	double  ratio;
	NSString  *city;
	NSString  *description;
	NSString  *gender;
	NSString  *country;
	int  investorType;
	NSString  *profileFlag;
	int  trades;	
	NSData   *image;
}
/*
@property (nonatomic, retain) NSString *userid;
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) NSString *gender;
*/
 
@property (nonatomic, retain) NSData *image;
@property(nonatomic,retain) NSString  *userid;
@property(nonatomic,retain) NSString  *firstName;
@property(nonatomic,retain) NSString  *lastName;
@property(nonatomic,retain) NSString  *joinedDate;
@property double	   profitOrLoss;
@property int	   rank;
@property double  portfolio;
@property double  cashBalance;
@property(nonatomic,retain) NSString  *lastTrade;
@property double  ratio;
@property(nonatomic,retain) NSString  *city;
@property(nonatomic,retain) NSString  *description;
@property(nonatomic,retain) NSString  *gender;
@property(nonatomic,retain) NSString  *country;
@property int  investorType;
@property(nonatomic,retain) NSString  *profileFlag;
@property int  trades;

//- (NSString *)description;

	
@end
