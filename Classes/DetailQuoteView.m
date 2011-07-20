//
//  DetailQuoteView.m
//  StockSimulator
//
//  Created by Saven  on 15/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "DetailQuoteView.h"


@implementation DetailQuoteView
@synthesize last_label,change_label,volume_label,last,change,volume,descrption,exchange;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		
		descrption = [[UILabel alloc] initWithFrame:CGRectMake(10.0,0,300,15)];
        descrption.font = [UIFont boldSystemFontOfSize:15];
        descrption.textColor = [UIColor orangeColor];
		descrption.textAlignment = UITextAlignmentLeft;
        descrption.backgroundColor = [UIColor clearColor];
		[self addSubview:descrption];
		
		exchange = [[UILabel alloc] initWithFrame:CGRectMake(10.0,16.0,300,10)];
        exchange.font = [UIFont systemFontOfSize:9];
        exchange.textColor = [UIColor whiteColor];
		exchange.textAlignment = UITextAlignmentLeft;
        exchange.backgroundColor = [UIColor clearColor];
		[self addSubview:exchange];
		
		
		last_label = [[UILabel alloc] initWithFrame:CGRectMake(10.0,26.0,90,13)];
        last_label.font = [UIFont boldSystemFontOfSize:11];
        last_label.textColor = [UIColor whiteColor];
		last_label.textAlignment = UITextAlignmentCenter;
        last_label.backgroundColor = [UIColor clearColor];
		last_label.text = @"Last";
		[self addSubview:last_label];
		
		last = [[UILabel alloc] initWithFrame:CGRectMake(10.0,39.0,90,13)];
        last.font = [UIFont boldSystemFontOfSize:11];
        last.textColor = [UIColor orangeColor];
		last.textAlignment = UITextAlignmentCenter;
        last.backgroundColor = [UIColor clearColor];
		[self addSubview:last];
		
		
		change_label = [[UILabel alloc] initWithFrame:CGRectMake(115.0,26.0,90,13)];
        change_label.font = [UIFont boldSystemFontOfSize:11];
        change_label.textColor = [UIColor whiteColor];
		change_label.textAlignment = UITextAlignmentCenter;
        change_label.backgroundColor = [UIColor clearColor];
		change_label.text = @"Change";
		[self addSubview:change_label];
		
		change = [[UILabel alloc] initWithFrame:CGRectMake(115.0,39.0,90,13)];
        change.font = [UIFont boldSystemFontOfSize:11];
        change.textColor = [UIColor blueColor];
		change.textAlignment = UITextAlignmentCenter;
        change.backgroundColor = [UIColor clearColor];
		[self addSubview:change];
		
		
		volume_label = [[UILabel alloc] initWithFrame:CGRectMake(220.0,26.0,90,13)];
        volume_label.font = [UIFont boldSystemFontOfSize:11];
        volume_label.textColor = [UIColor whiteColor];
		volume_label.textAlignment = UITextAlignmentCenter;
        volume_label.backgroundColor = [UIColor clearColor];
		volume_label.text = @"Volume";
		[self addSubview:volume_label];
		
		volume = [[UILabel alloc] initWithFrame:CGRectMake(220.0,39.0,90,13)];
        volume.font = [UIFont boldSystemFontOfSize:11];
        volume.textColor = [UIColor orangeColor];
		volume.textAlignment = UITextAlignmentCenter;
        volume.backgroundColor = [UIColor clearColor];
		[self addSubview:volume];
		
		
		
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[exchange release];
	[descrption release];
	[last_label release];
	[change_label release];
	[volume_label release];
	[last release];
	[change release];
	[volume release];
    [super dealloc];
 
}


@end
