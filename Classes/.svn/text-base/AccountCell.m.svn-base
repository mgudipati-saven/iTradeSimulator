//
//  AccountCell.m
//  StockSimulator
//
//  Created by Saven  on 06/08/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AccountCell.h"


@implementation AccountCell
@synthesize label,avatar;
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		
		// Initialize the labels, their fonts, colors, alignment, and background color.
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont boldSystemFontOfSize:20];
		label.textColor = [UIColor whiteColor]; // label.textColor = [UIColor darkGrayColor];
        label.textAlignment = UITextAlignmentLeft;
        [self.contentView addSubview:label];
		label.backgroundColor = [UIColor clearColor];
		avatar = [[UIImageView alloc] init];
		avatar.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:avatar];
		
		
		
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
    CGRect baseRect = CGRectInset(self.contentView.bounds,10,1);
    CGRect rect = baseRect;
    avatar.frame = CGRectMake(rect.origin.x,rect.origin.y+2,45.0,rect.size.height -4.0);
	label.frame = CGRectMake(rect.origin.x+70,rect.origin.y+2,230.0,rect.size.height -4.0);
	
}	


- (void)dealloc {
	[label release];
	[avatar release];
    [super dealloc];
}


@end
