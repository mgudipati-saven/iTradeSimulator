//
//  LoaderViewController.m
//  CustomizedAlertSheet 
//
//  Created by Saven  on 24/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LoaderViewController.h"

@implementation LoaderViewController
@synthesize loader;
-(id)initLoader
{
	//setting this for getting the  space and  correct  alignment of the loader 
	
	//self = [super initWithTitle:[NSString stringWithString:@""] delegate:delegate cancelButtonTitle:nil destructiveButtonTitle:nil
	//		  otherButtonTitles:nil];
	if([self init]){
		
		//the loader
		loader = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
		[loader setCenter:CGPointMake(0.0,-500.0)];	
		loader.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
		loader.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
								   UIViewAutoresizingFlexibleRightMargin |
								   UIViewAutoresizingFlexibleTopMargin |
								   UIViewAutoresizingFlexibleBottomMargin);
		
		//lopping the alert to place  it on the  above  of the label
		/*for( UIView *view in self.subviews){
		 
		 if([view isKindOfClass:[UILabel class]]){
		 [self insertSubview:loader aboveSubview:view];
		 
		 }
		 [self willRemoveSubview:view];
		 }
		 */
		[self addSubview:loader];
		//start animating
		[self.loader startAnimating];
		
	}
	return self;
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
	[self.loader stopAnimating];
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (void)dealloc {
	
	[loader release];
    [super dealloc];
}


@end
