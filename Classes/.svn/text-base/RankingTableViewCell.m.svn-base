//
//  RankingTableViewCell.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 5/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RankingTableViewCell.h"


@implementation RankingTableViewCell

@synthesize rank, avatar, userid, portfolioValue,favAvatar;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
        // Initialize the labels, their fonts, colors, alignment, and background color.
		// Add the labels to the content view of the cell.
		rank = [[UILabel alloc] initWithFrame:CGRectZero];
		rank.font = [UIFont boldSystemFontOfSize:16];
		rank.backgroundColor = [UIColor clearColor];
		rank.textColor = [UIColor whiteColor];
		rank.textAlignment = UITextAlignmentRight;
		rank.opaque = YES;
		[self.contentView addSubview:rank];
		
		userid = [[UILabel alloc] initWithFrame:CGRectZero];
		userid.font = [UIFont boldSystemFontOfSize:16];
		userid.backgroundColor = [UIColor clearColor];
		userid.textColor = [UIColor orangeColor];
		userid.textAlignment = UITextAlignmentLeft;
		userid.opaque = YES;
		[self.contentView addSubview:userid];
		
		portfolioValue = [[UILabel alloc] initWithFrame:CGRectZero];
		portfolioValue.font = [UIFont boldSystemFontOfSize:14];
		portfolioValue.backgroundColor = [UIColor clearColor];
		portfolioValue.textColor = [UIColor whiteColor];
		portfolioValue.textAlignment = UITextAlignmentRight;
		portfolioValue.opaque = YES;
		[self.contentView addSubview:portfolioValue];
		
		avatar = [[UIImageView alloc] init];
		favAvatar = [[UIImageView alloc] init];
	
		
		[self.contentView addSubview:avatar];
		[self.contentView addSubview:favAvatar];
	
		
		
	}
	
    return self;
}

- (void)layoutSubviews 
{
    [super layoutSubviews];

    // Start with a rect that is inset from the content view by 10 pixels on all sides.
    CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
    CGRect rect = baseRect;
     
	// Position each label with a modified version of the base rect.    
    rect.size.width = 23;
    rank.frame = rect;
	rect.origin.y +=2;
	rect.origin.x += 25;
    rect.size.width = 17;
	rect.size.height = 17;
    avatar.frame = rect;
	
	rect.origin.x += 21;
    rect.size.width = 17;
	rect.size.height = 17;
    favAvatar.frame = rect;
	
	rect.origin.x += 30;
	rect.size.height = 18;
    rect.size.width = 100;
    userid.frame = rect;
			
	rect.origin.x += 95;
    rect.size.width = 105;
	portfolioValue.frame = rect;
    
	/*rect.origin.x -= 15;
	rect.size.width = 17;
	rect.size.height = 17;
	rect.origin.y += 3;
    favAvatar.frame = rect;*/
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
    [super setSelected:selected animated:animated];
	
    // Configure the view for the selected state
}


- (void)dealloc {
	[favAvatar release];
   	[rank release];
	[avatar release];
	[userid release];
	[portfolioValue release];
	[super dealloc];
}


@end
