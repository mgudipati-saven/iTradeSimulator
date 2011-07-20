//
//  PortfolioTableViewCell.m
//  StockSimulator
//
//  Created by Murthy Gudipati on 4/21/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PortfolioTableViewCell.h"


@implementation PortfolioTableViewCell

@synthesize symbol, value, gain;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
        // Initialize the labels, their fonts, colors, alignment, and background color.
        symbol = [[UILabel alloc] initWithFrame:CGRectZero];
        symbol.font = [UIFont boldSystemFontOfSize:14];
        symbol.textAlignment = UITextAlignmentLeft;
        symbol.backgroundColor = [UIColor clearColor];
		symbol.textColor = [UIColor whiteColor];
		
        value = [[UILabel alloc] initWithFrame:CGRectZero];
        value.font = [UIFont boldSystemFontOfSize:12];
		value.textColor = [UIColor orangeColor];
        value.textAlignment = UITextAlignmentRight;
        value.backgroundColor = [UIColor clearColor];
		
        gain = [[UILabel alloc] initWithFrame:CGRectZero];
        gain.font = [UIFont boldSystemFontOfSize:12];
		gain.textColor = [UIColor darkGrayColor];
        gain.textAlignment = UITextAlignmentRight;
        gain.backgroundColor = [UIColor clearColor];
        
        // Add the labels to the content view of the cell.
        
        // Important: although UITableViewCell inherits from UIView, you should add subviews to its content view
        // rather than directly to the cell so that they will be positioned appropriately as the cell transitions 
        // into and out of editing mode.
        
        [self.contentView addSubview:symbol];
        [self.contentView addSubview:value];
        [self.contentView addSubview:gain];
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
    rect.size.width = 75;
    symbol.frame = rect;
    
	rect.origin.x += 85;
    rect.size.width = 75;
    value.frame = rect;
	
	rect.origin.x += 105;
    rect.size.width = 79;
    gain.frame = rect;
}

/*
 - (void)setSelected:(BOOL)selected animated:(BOOL)animated 
 {
 
 [super setSelected:selected animated:animated];
 
 // Configure the view for the selected state
 if (selected) 
 {
 symbol.textColor = [UIColor whiteColor];
 value.textColor = [UIColor whiteColor];
 gain.textColor = [UIColor whiteColor];
 }
 else 
 {
 symbol.textColor = [UIColor blackColor];
 value.textColor = [UIColor darkGrayColor];
 gain.textColor = [UIColor darkGrayColor];
 }
 }
 */

- (void)dealloc 
{
    [super dealloc];
	[symbol release];
	[value release];
	[gain release];
}


@end
