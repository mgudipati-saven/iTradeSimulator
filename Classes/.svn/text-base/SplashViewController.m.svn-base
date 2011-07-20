//
//  SplashViewController.m
//  StockSimulator
//
//  Created by Saven  on 28/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController
@synthesize imageView,indicator;

-(id)initScreen
{
	//setting this for getting the  space and  correct  alignment of the loader 
	
	//self = [super initWithTitle:[NSString stringWithString:@""] delegate:delegate cancelButtonTitle:nil destructiveButtonTitle:nil
	//		  otherButtonTitles:nil];
	if([self init]){
		
		imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0,-480,320.0,500+.0)];
		imageView.backgroundColor = [UIColor clearColor];
		imageView.image = [UIImage imageNamed:@"splashScreen.png"];
		
		
		//the loader
		indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		[indicator setCenter:CGPointMake(0.0,-400.0)];	
		indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
		indicator.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
								   UIViewAutoresizingFlexibleRightMargin |
								   UIViewAutoresizingFlexibleTopMargin |
								   UIViewAutoresizingFlexibleBottomMargin);
		[self addSubview:imageView];
		[self addSubview:indicator];
		//start animating
		[self.indicator startAnimating];
		
	
	}
	return self;
}		

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
	[self.indicator stopAnimating];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
	[indicator release];
	[imageView release];
    [super dealloc];
}


@end
