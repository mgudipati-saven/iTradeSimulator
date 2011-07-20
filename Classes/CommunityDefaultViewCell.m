//
//  CommunityDefaultViewCell.m
//  StockSimulator
//
//  Created by Saven  on 06/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommunityDefaultViewCell.h"


@implementation CommunityDefaultViewCell
@synthesize  identifier,description;
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		self.backgroundColor = [UIColor blackColor];
		identifier = [[UILabel alloc] initWithFrame:CGRectZero];
		identifier.font = [UIFont boldSystemFontOfSize:13];
		identifier.backgroundColor = [UIColor clearColor];
		identifier.textColor = [UIColor whiteColor];
		identifier.textAlignment = UITextAlignmentLeft;
		identifier.opaque = YES;
		identifier.text = @"";
	    [self.contentView addSubview:identifier];
		
		
		description = [[UILabel alloc] initWithFrame:CGRectZero];
		description.font = [UIFont boldSystemFontOfSize:13];
		description.backgroundColor = [UIColor clearColor];
		description.textColor = [UIColor orangeColor];
		description.textAlignment = UITextAlignmentRight;
		description.opaque = YES;
		description.text = @"";
	    [self.contentView addSubview:description];
		
		
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
    CGRect baseRect = CGRectInset(self.contentView.bounds,10,0);
    CGRect rect = baseRect;
	
	rect.size.width =145;
	identifier.frame = rect;
	
	rect.origin.x = 165;
	description.frame = rect;
	
	
	
}	

- (void)dealloc {
	[identifier release];
	[description release];
    [super dealloc];
}
//existing

@end
