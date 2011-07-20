//
//  AreaChartViewController.m
//  StockSimulator
//
//  Created by Saven  on 20/06/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import "StockSimulatorAppDelegate.h"
#import "AreaChartViewController.h"


#define width_max 480
#define height_max 320

@implementation AreaChartViewController
@synthesize appDelegate,view,segmentedControl,imageView,loader,symbol,range,width,height;

-(id)initWithdelegate:(id)delegate 
{

	self = [super initWithTitle:nil message:nil delegate:delegate cancelButtonTitle:nil otherButtonTitles:nil];
   appDelegate = (StockSimulatorAppDelegate *)[[UIApplication sharedApplication] delegate];   
		
	
	if(self){
        
		
		self.width =width_max;  
		self.height = height_max;
		
		self.view = [[UIView alloc] initWithFrame:CGRectMake(0.0,0.0,480,320)];
		self.view.backgroundColor = [UIColor blackColor];
						
		self.segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"1D",@"5D",@"3M",@"6M",@"1Y",@"Max",nil]];
		self.segmentedControl.frame = CGRectMake(20,295.0,440,20);
	   	[self.segmentedControl addTarget:self action:@selector(onPeriodChange:) forControlEvents:UIControlEventValueChanged];
		[self.view addSubview:self.segmentedControl];
		
		self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0,0.0,480,290)];
		self.imageView.backgroundColor = [UIColor blackColor];
		 
	  		
		
		[self.view addSubview:self.imageView];
    	[self addSubview:self.view];
		
		
		self.loader = [[UILabel alloc] initWithFrame:CGRectMake(0.0,150.0,480,20)];
        self.loader.font = [UIFont systemFontOfSize:12];
        self.loader.textColor = [UIColor whiteColor];
		self.loader.textAlignment = UITextAlignmentCenter;
        self.loader.backgroundColor = [UIColor clearColor];
		self.loader.text = @"Please Wait , Chart Loading....";
		[self.view addSubview:self.loader];
		
		
		
		self.symbol =[[NSString alloc] init];
		self.range =[[NSString alloc] initWithString:@"1d"];
		
		
    }
	
	return self;
}


-(void)updateTicker:(NSString *)ticker
{   
	
	
	self.imageView.image = nil;
	[self.loader setHidden:NO];
	
	[self.symbol release];
	self.symbol = nil;
	[self.range release];
	self.range = nil;
	
    self.segmentedControl.selectedSegmentIndex = 0;	
	self.range =[[NSString alloc] initWithString:@"1d"];
	self.symbol =[[NSString alloc] initWithFormat:@"%@",ticker];
	
	[NSThread detachNewThreadSelector:@selector(LoadImage) toTarget:self withObject:nil];
	
	
}

-(void)LoadImage{
	
	//clearing the  image
	
	
	
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
	//veeru for orientation
	
	
	
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSMutableString *urlString=[[NSMutableString alloc] initWithFormat:@"%@?gradient=true&bordercolor=255,128,0&plotcolor=255,128,0&gridcolor=255,128,0&panebackground=black&scalecolor=255,128,0&cont=%@&size=%ix%i&bartype=AREA&range=%@&showheader=false&showprev=true&prevcolor=255,128,0&plotoutline=255,128,0",[appDelegate.gameSettings objectForKey:@"Chart URL"],self.symbol,self.width,self.height,self.range];
		
	NSURL *url=[[NSURL alloc] initWithString:urlString];
	[urlString release];
	
	NSData *data =   [[NSData alloc] initWithContentsOfURL:url];
	
	UIImage *image1 =[[UIImage alloc] initWithData:data];
	self.imageView.image = image1;
	[url release];
	[image1 release];
	[data release];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[self.loader setHidden:YES];
    [pool release];
}


-(void)onPeriodChange:(id)sender{
	//boolean=YES; 
	[self.range release];
	self.range = nil;
	self.imageView.image = nil;
	[self.loader setHidden:NO];
	switch([sender selectedSegmentIndex]) {
		case 0 :
			self.range = [NSString  stringWithFormat:@"1d"];
			break;	
		case 1 :
			self.range = [NSString  stringWithFormat:@"5d"];
			break;	
		case 2 :
			self.range = [NSString  stringWithFormat:@"3M"];
			break;	
		case 3 :
			self.range = [NSString  stringWithFormat:@"6M"];
			break;	
			
		case 4 :
			self.range = [NSString  stringWithFormat:@"1y"];
			break;	
		case 5 :
			self.range = [NSString  stringWithFormat:@"Max"];
			break;		
	}
	//self.segmentedControl.hidden = YES;
	[NSThread detachNewThreadSelector:@selector(LoadImage) toTarget:self withObject:nil];
	
	
}





/*
-(void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];

}
*/

- (void)show
{   
	
	[super show];
	
}



- (void)dealloc {
	[symbol release];
	[range release];
	[loader release];
	[imageView release];
	[segmentedControl release];
	[view release];
	[super dealloc];
}


@end
