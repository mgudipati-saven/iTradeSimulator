//
//  RankerTableViewCell.m
//  StockSimulator
//
//  Created by Saven  on 28/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RankerTableViewCell.h"

@implementation RankerTableViewCell 
@synthesize avatar,aboutMeLabel,desc,userLabel,rankLabel,genderLabel,cityLabel,countryLabel,user,rank,city,country,gender,loader;
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		
		//image
		avatar = [[UIImageView alloc] init];
		avatar.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:avatar];
		
		//userIDLbel
		userLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		userLabel.font = [UIFont boldSystemFontOfSize:12];
		userLabel.backgroundColor = [UIColor clearColor];
		userLabel.textColor = [UIColor whiteColor];
		userLabel.textAlignment = UITextAlignmentRight;
		userLabel.opaque = YES;
		userLabel.text = @"Name :";
		[self.contentView addSubview:userLabel];
		
		
		user = [[UILabel alloc] initWithFrame:CGRectZero];
		user.font = [UIFont systemFontOfSize:13];
		user.backgroundColor = [UIColor clearColor];
		user.textColor = [UIColor orangeColor];
		user.textAlignment = UITextAlignmentLeft;
		user.opaque = YES;
	    [self.contentView addSubview:user];
		
		
		
		//userIDLbel
		genderLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		genderLabel.font = [UIFont boldSystemFontOfSize:12];
		genderLabel.backgroundColor = [UIColor clearColor];
		genderLabel.textColor = [UIColor whiteColor];
		genderLabel.textAlignment = UITextAlignmentRight;
		genderLabel.opaque = YES;
		genderLabel.text = @"Gender :";
		[self.contentView addSubview:genderLabel];
		
		//gender
		gender = [[UILabel alloc] initWithFrame:CGRectZero];
		gender.font = [UIFont systemFontOfSize:13];
		gender.backgroundColor = [UIColor clearColor];
		gender.textColor = [UIColor orangeColor];
		gender.textAlignment = UITextAlignmentLeft;
		gender.opaque = YES;
	    [self.contentView addSubview:gender];
		
				
		
		rankLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		rankLabel.font = [UIFont boldSystemFontOfSize:12];
		rankLabel.backgroundColor = [UIColor clearColor];
		rankLabel.textColor = [UIColor whiteColor];
		rankLabel.textAlignment = UITextAlignmentRight;
		rankLabel.opaque = YES;
		rankLabel.text = @"Rank :";
		[self.contentView addSubview:rankLabel];
		
		
		//rank
		rank = [[UILabel alloc] initWithFrame:CGRectZero];
		rank.font = [UIFont systemFontOfSize:13];
		rank.backgroundColor = [UIColor clearColor];
		rank.textColor = [UIColor orangeColor];
		rank.textAlignment = UITextAlignmentLeft;
		rank.opaque = YES;
	    [self.contentView addSubview:rank];
		
		
		
		
		cityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		cityLabel.font = [UIFont boldSystemFontOfSize:12];
		cityLabel.backgroundColor = [UIColor clearColor];
		cityLabel.textColor = [UIColor whiteColor];
		cityLabel.textAlignment = UITextAlignmentRight;
		cityLabel.opaque = YES;
		cityLabel.text = @"City :";
		[self.contentView addSubview:cityLabel];
		
		
		
		//city
		city = [[UILabel alloc] initWithFrame:CGRectZero];
		city.font = [UIFont systemFontOfSize:13];
		city.backgroundColor = [UIColor clearColor];
		city.textColor = [UIColor orangeColor];
		city.textAlignment = UITextAlignmentLeft;
		city.opaque = YES;
	    [self.contentView addSubview:city];
		
		
		countryLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		countryLabel.font = [UIFont boldSystemFontOfSize:12];
		countryLabel.backgroundColor = [UIColor clearColor];
		countryLabel.textColor = [UIColor whiteColor];
		countryLabel.textAlignment = UITextAlignmentRight;
		countryLabel.opaque = YES;
		countryLabel.text = @"Country :";
		[self.contentView addSubview:countryLabel];
		
		
		
		//city
		country = [[UILabel alloc] initWithFrame:CGRectZero];
		country.font = [UIFont systemFontOfSize:13];
		country.backgroundColor = [UIColor clearColor];
		country.textColor = [UIColor orangeColor];
		country.textAlignment = UITextAlignmentLeft;
		country.opaque = YES;
	    [self.contentView addSubview:country];
				
		// Add the labels to the content view of the cell.
		aboutMeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		aboutMeLabel.font = [UIFont boldSystemFontOfSize:12];
		aboutMeLabel.backgroundColor = [UIColor clearColor];
		aboutMeLabel.textColor = [UIColor whiteColor];
		aboutMeLabel.textAlignment = UITextAlignmentLeft;
		aboutMeLabel.opaque = YES;
		aboutMeLabel.text = @"About Me :-";
		[self.contentView addSubview:aboutMeLabel];
		
		
		
		
		
		
		//desc
		// Add the labels to the content view of the cell.
		desc = [[UILabel alloc] initWithFrame:CGRectZero];
		desc.font = [UIFont systemFontOfSize:10];
		desc.backgroundColor = [UIColor clearColor];
		desc.textColor = [UIColor orangeColor];
		desc.textAlignment = UITextAlignmentLeft;
		desc.opaque = YES;
		desc.lineBreakMode = UILineBreakModeCharacterWrap;
		desc.numberOfLines =3;
	    [self.contentView addSubview:desc];
		
		
		//loader
		loader =[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		[self.contentView addSubview:loader];
		
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)layoutSubviews 
{
    [super layoutSubviews];
	
    // Start with a rect that is inset from the content view by 10 pixels on all sides.
    CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
    CGRect rect = baseRect;
    
	       
	rect.size.width =130;
	rect.size.height =110;
    avatar.frame = rect;
	//loader
	loader.frame =  CGRectMake(45,60,20,20); 
	//userlabel
	//about me  label
	rect.size.width = 55;
	rect.size.height =20;
	rect.origin.x = 143;
	rect.origin.y = 10;
    userLabel.frame = rect;
	
	//user
	rect.size.width = 94;
	rect.size.height =20;
	rect.origin.x = 201;
    user.frame = rect;
	
	
	
	//genderlabel
	rect.size.width = 55;
	rect.size.height =20;
	rect.origin.y = 32;
	rect.origin.x = 143;
    genderLabel.frame = rect;
	
	
	//gender
	rect.size.width = 94;
	rect.size.height =20;
	rect.origin.x = 201;
    gender.frame = rect;
	
	
	//ranklabel
	rect.size.width = 55;
	rect.size.height =20;
	rect.origin.y = 54;
	rect.origin.x = 143;
    rankLabel.frame = rect;
	
	
	//gender
	rect.size.width = 94;
	rect.size.height =20;
	rect.origin.x = 201;
    rank.frame = rect;
	
	//city
	rect.size.width = 55;
	rect.size.height =20;
	rect.origin.y = 76;
	rect.origin.x = 143;
    cityLabel.frame = rect;
	
	
	//gender
	rect.size.width = 94;
	rect.size.height =20;
	rect.origin.x = 201;
    city.frame = rect;
	
	//country 
	rect.size.width = 55;
	rect.size.height =20;
	rect.origin.y = 98;
	rect.origin.x = 143;
    countryLabel.frame = rect;
	
	
	//gender
	rect.size.width = 94;
	rect.size.height =20;
	rect.origin.x = 201;
    country.frame = rect;
	
	//about me  label
	rect.origin.y = 117;
	rect.origin.x = 10;
    rect.size.width = 90;
	rect.size.height =20;
    aboutMeLabel.frame = rect;
	
	//description
	rect.origin.y = 137;
    rect.size.width = 280;
	rect.size.height =36;
    desc.frame = rect;
	
	

}


- (void)dealloc {
	
	[userLabel release];
	[rankLabel release];
	[genderLabel release];
	[cityLabel release];
	[countryLabel release];
	[desc release];
	[aboutMeLabel release];
    [user release];
	[gender release];
	[rank release];
	[city release];
	[country release];
	[avatar release];
	[loader release];
	[super dealloc];
}


@end
