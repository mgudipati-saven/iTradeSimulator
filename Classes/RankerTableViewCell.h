//
//  RankerTableViewCell.h
//  StockSimulator
//
//  Created by Saven  on 28/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RankerTableViewCell : UITableViewCell {
	UIImageView *avatar;
	//labels
	UILabel *aboutMeLabel;
	UILabel *userLabel;
	UILabel *rankLabel;
	UILabel *genderLabel;
	UILabel *cityLabel;
	UILabel *countryLabel;
	
	//details
	UILabel *user;
	UILabel *rank;
	UILabel *gender;
	UILabel *city;
	UILabel *country;

	UILabel *desc;
	
	UIActivityIndicatorView *loader;
}
   @property (nonatomic, retain) UIImageView *avatar;
   @property (nonatomic, retain) UILabel *aboutMeLabel;
   @property (nonatomic, retain) UILabel *desc;
  
   @property (nonatomic, retain) UILabel *userLabel;
   @property (nonatomic, retain) UILabel *rankLabel;
   @property (nonatomic, retain) UILabel *cityLabel;
   @property (nonatomic, retain) UILabel *countryLabel;
   @property (nonatomic, retain) UILabel *genderLabel;

	@property (nonatomic, retain) UILabel *user;
	@property (nonatomic, retain) UILabel *rank;
	@property (nonatomic, retain) UILabel *gender;
	@property (nonatomic, retain) UILabel *city;
	@property (nonatomic, retain) UILabel *country;
 
    @property (nonatomic, retain) UIActivityIndicatorView *loader;


@end
