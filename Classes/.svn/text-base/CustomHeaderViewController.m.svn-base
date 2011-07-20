//
//  CustomHeaderViewController.m
//  StockSimulator
//
//  Created by Saven  on 06/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CustomHeaderViewController.h"


@implementation CustomHeaderViewController

@synthesize header;
@synthesize leftLable;
@synthesize rightLabel;
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		self.backgroundColor = [UIColor clearColor];
		header = [[UILabel alloc] initWithFrame:CGRectMake(13,-3,300,20)];
        header.font = [UIFont boldSystemFontOfSize:17];
        header.textColor = [UIColor orangeColor];
        header.textAlignment = UITextAlignmentLeft;
	    header.backgroundColor = [UIColor clearColor];
		
		leftLable = [[UILabel alloc] initWithFrame:CGRectMake(30,20,100,10)];
        leftLable.font = [UIFont boldSystemFontOfSize:9];
        leftLable.textColor = [UIColor orangeColor];
        leftLable.textAlignment = UITextAlignmentLeft;
        leftLable.backgroundColor = [UIColor clearColor];
		
		
		rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(200,20,100,10)];
        rightLabel.font = [UIFont boldSystemFontOfSize:9];
        rightLabel.textColor = [UIColor orangeColor];
        rightLabel.textAlignment = UITextAlignmentCenter;
        rightLabel.backgroundColor = [UIColor clearColor];
		
		[self addSubview:leftLable];
		[self addSubview:header];
		[self addSubview:rightLabel];
		
		
		
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}


@end
