//
//  RanketPortfolioViewCell.m
//  StockSimulator
//
//  Created by Saven  on 30/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "RankerPortfolioViewCell.h"

@implementation RankerPortfolioViewCell
@synthesize symbol,pricePaid,quantity,currentPrice;
- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        
		// Initialization code
		
		symbol = [[UILabel alloc] initWithFrame:CGRectZero];
		symbol.font = [UIFont boldSystemFontOfSize:13];
		symbol.backgroundColor = [UIColor clearColor];
		symbol.textColor = [UIColor whiteColor];
		symbol.textAlignment = UITextAlignmentCenter;
		symbol.opaque = YES;
		symbol.text = @"";
	    [self.contentView addSubview:symbol];
		
		pricePaid = [[UILabel alloc] initWithFrame:CGRectZero];
		pricePaid.font = [UIFont boldSystemFontOfSize:13];
		pricePaid.backgroundColor = [UIColor clearColor];
		pricePaid.textColor = [UIColor orangeColor];
		pricePaid.textAlignment = UITextAlignmentCenter;
		pricePaid.opaque = YES;
		pricePaid.text = @"";
	    [self.contentView addSubview:pricePaid];
		
		quantity = [[UILabel alloc] initWithFrame:CGRectZero];
		quantity.font = [UIFont boldSystemFontOfSize:13];
		quantity.backgroundColor = [UIColor clearColor];
		quantity.textColor = [UIColor orangeColor];
		quantity.textAlignment = UITextAlignmentCenter;
		quantity.opaque = YES;
		quantity.text = @"";
	    [self.contentView addSubview:quantity];
		
		currentPrice = [[UILabel alloc] initWithFrame:CGRectZero];
		currentPrice.font = [UIFont boldSystemFontOfSize:13];
		currentPrice.backgroundColor = [UIColor clearColor];
		currentPrice.textColor = [UIColor orangeColor];
		currentPrice.textAlignment = UITextAlignmentCenter;
		currentPrice.opaque = YES;
		currentPrice.text = @"";
	    [self.contentView addSubview:currentPrice];
		
		
		
		
    }
    return self;
}
- (void)layoutSubviews 
{
    [super layoutSubviews];
	
    // Start with a rect that is inset from the content view by 10 pixels on all sides.
    CGRect baseRect = CGRectInset(self.contentView.bounds,10,0);
    CGRect rect = baseRect;
	
	rect.size.width =70;
	symbol.frame = rect;
	
	rect.origin.x =82;
	quantity.frame = rect;
	
	rect.origin.x =154;
	pricePaid.frame = rect;
	
	rect.origin.x =226;
	currentPrice.frame = rect;
	
	

	
}	


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[symbol release];
	[pricePaid release];
	[currentPrice release];
	[quantity release];
    [super dealloc];
}


@end
