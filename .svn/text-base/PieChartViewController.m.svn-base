//
//  PieChartView.m
//  StockSimulator
//
//  Created by Saven  on 26/05/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PieChartViewController.h"
#define PI 3.14159265358979323846
#define max_chart_radius 100
#define first 90.00
#define second 180.00
#define third 270.00

#define StartX  270.00
#define StartY  8.00
#define SecondStartY 190.00

#define FirstRow_Max_Points  22.00

#define SecondRow_Max_Points  13.00

//point =  sector/pointDifference * dirrence + y




static inline float radians(double degrees) { return degrees * PI / 180; }
@implementation PieChartViewController


@synthesize data_array,fouth_legendDataArray,first_legendDataArray,third_legendDataArray,second_legendDataArray;

- (id)initChart:(CGRect)frame data:(NSMutableArray *)data{
	
	self.data_array = data;
	self.fouth_legendDataArray = [NSMutableArray array];
	self.first_legendDataArray = [NSMutableArray array];
	self.third_legendDataArray = [NSMutableArray array];
	self.second_legendDataArray = [NSMutableArray array]; 
	
	return [self initWithFrame:frame];
}	

- (id)initWithFrame:(CGRect)frame{
  	if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
	
	//remove all objext in legend data
	[self.fouth_legendDataArray removeAllObjects];
	[self.first_legendDataArray removeAllObjects];
	[self.third_legendDataArray removeAllObjects];
	[self.second_legendDataArray removeAllObjects];
	
	
	//CGFloat boundsY = frame.origin.y;
	CGFloat oringX = rect.size.width/2;
	CGFloat oringY = rect.size.height/2 ;
    CGFloat raduis =max_chart_radius; 
	
	// Get the graphics context and clear it
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClearRect(context, rect);
	
	// Drawing with a white stroke color
  	CGContextSetLineWidth(context, 0.0);
	CGContextSelectFont(context,"Courier",8, kCGEncodingMacRoman);
	CGAffineTransform xform = CGAffineTransformMake(1, 0, 0, -1, 0, 0);
	CGContextSetTextMatrix(context, xform);
	//initalizing the  total
	double total = 0.0;
	float preValue = 0.0;
	for(int i = 0 ; i<[self.data_array count];i=i+1)
	{
		PieChartDataType *chartData =  [[self.data_array objectAtIndex:i] retain];
		total = total + chartData.value;
		[chartData release];
	    chartData = nil;
	}
	
    //collopser		
	//int coloapser = 0;
	
	
	//drawing the  chart
	for(int j = 0 ; j<[self.data_array count];j=j+1)
	{
		PieChartDataType *chartData = [self.data_array objectAtIndex:j] ;
	  	 
		CGContextMoveToPoint(context,oringX,oringY); 
		
		UIColor *store = [self randomcolor];
		
		CGContextSetFillColor(context, CGColorGetComponents([[store retain] CGColor]));
	
		[store release];
		
		CGContextAddArc(context,oringX,oringY,raduis,radians(preValue),radians(preValue) + radians(((chartData.value/total)*360)), false);
		CGContextFillPath(context); 
		
		//draw bummy circle
		CGContextAddArc(context,oringX,oringY,raduis,radians(preValue),radians(preValue) + radians(((chartData.value/total)*360)/2), false);
		
		CGPoint lineStarPoint = CGContextGetPathCurrentPoint(context);
		
		//draw bummy circle
		CGContextAddArc(context,oringX,oringY,raduis+5,radians(preValue),radians(preValue) + radians(((chartData.value/total)*360)/2), false);
		
		CGPoint lineEndPoint = CGContextGetPathCurrentPoint(context);
		
		CGContextBeginPath(context);
		
		//creating the legend  data
		LegendData	*legend =  [[LegendData alloc] init];
		
		legend.startLineX = lineStarPoint.x;
		legend.startLineY = lineStarPoint.y;
		
		legend.endLineX = lineEndPoint.x;
		legend.endLineY = lineEndPoint.y;
		
		legend.toolTip = [NSString stringWithFormat:@"%@:%.2f%%",chartData.desc,((chartData.value/total)*100)];
		
		
		
		if(preValue+((chartData.value/total)*360)/2>=0.0 && preValue+((chartData.value/total)*360)/2 <first)
		{
			if([self.first_legendDataArray count]<=FirstRow_Max_Points)
				[self.first_legendDataArray addObject:legend];
		}
		else if(preValue+((chartData.value/total)*360)/2>=first && preValue+((chartData.value/total)*360)/2 <=second)
		{
			if([self.second_legendDataArray count]<=FirstRow_Max_Points)
			    [self.second_legendDataArray  addObject:legend];
		}
		else if(preValue+((chartData.value/total)*360)/2>=second && preValue+((chartData.value/total)*360)/2 <=third)
		{
			if([self.third_legendDataArray count]<=FirstRow_Max_Points)
     			[self.third_legendDataArray  addObject:legend];
		}
		else
		{
			if([self.fouth_legendDataArray count]<=FirstRow_Max_Points)
				[self.fouth_legendDataArray addObject:legend];
		}
		
	
			
			//seconddummy circle
			//draw bummy circle
			//CGContextAddArc(context,oringX,oringY,raduis+5,radians(preValue),radians(preValue) + radians(((chartData.value/total)*360)/2), false);
			
			//NSLog(@"%f============%f",preValue,((chartData.value/total)*360)/2);
			
			
		
		
		
		
		preValue = preValue+chartData.value/total*360;
		
		[chartData release];
		chartData = nil; 			
	}
	
	
	
		
	//CGContextBeginPath(context);
	//CGContextMoveToPoint(context,presentPoint.x, presentPoint.y);
	
	//CGContextAddLineToPoint(context,270, rect.size.height/2+(preValue+(chartData.value/total)*360)/2*.
	//);	
	//CGContextStrokePath(context);
	
	/*for(int i=0;i<12;i++)
	{
		CGContextShowTextAtPoint (context,StartX-60,StartY*(i+1),string,strlen(string));
	}
	*/
	 //plot the forth quadriant tool tips
	[self SetFirstQuadrantData];
	[self SetSecondQuadrantData];
	[self SetThirdQuadrantData];
	[self SetFourthQuadrantData];
	
	
	//ploting the data tips in fourth quarderant
	
	CGContextSetLineWidth(context,0.5);
	CGContextSetStrokeColor(context,CGColorGetComponents([[UIColor orangeColor] CGColor]));
	CGContextSetFillColor(context,CGColorGetComponents([[UIColor orangeColor] CGColor]));
	
	for(int i=0 ;i<[self.first_legendDataArray count];i++)
	{
	    CGContextBeginPath(context);
		
		LegendData	*legend =  [self.first_legendDataArray objectAtIndex:i];
		
		
		CGContextMoveToPoint(context,legend.startLineX,legend.startLineY);
		CGContextAddLineToPoint(context, legend.endLineX, legend.endLineY);
		CGContextAddLineToPoint(context, legend.textStartX, legend.textStartY-1);
		
		//text
		const char *string  = [legend.toolTip UTF8String];
		CGContextShowTextAtPoint (context,legend.textStartX,legend.textStartY,string,strlen(string));
		
		CGContextStrokePath(context);
		
		
		[legend release];	
	}
	
	for(int i=0 ;i<[self.second_legendDataArray count];i++)
	{
	    CGContextBeginPath(context);
		
		LegendData	*legend =  [self.second_legendDataArray objectAtIndex:i];
		
		
		CGContextMoveToPoint(context,legend.startLineX,legend.startLineY);
		CGContextAddLineToPoint(context, legend.endLineX, legend.endLineY);
		const char *string  = [legend.toolTip UTF8String];
		
		if(strlen(string)<=7)
			CGContextAddLineToPoint(context, legend.textStartX+35, legend.textStartY-2);
		else
			CGContextAddLineToPoint(context,legend.textStartX+34+((strlen(string)-7)*5), legend.textStartY-2);
		
		//text

		CGContextShowTextAtPoint (context,legend.textStartX,legend.textStartY,string,strlen(string));
		
		CGContextStrokePath(context);
		
		
		[legend release];	
	}
	
	
	
	for(int i=0 ;i<[self.third_legendDataArray count];i++)
	{
	    CGContextBeginPath(context);
		
		LegendData	*legend =  [self.third_legendDataArray objectAtIndex:i];
		
		
		CGContextMoveToPoint(context,legend.startLineX,legend.startLineY);
		CGContextAddLineToPoint(context, legend.endLineX, legend.endLineY);
		
		const char *string  = [legend.toolTip UTF8String];
		if(strlen(string)<=7)
			CGContextAddLineToPoint(context, legend.textStartX+35, legend.textStartY-2);
		else
			CGContextAddLineToPoint(context,legend.textStartX+34+((strlen(string)-7)*5), legend.textStartY-2);
		//text
		
		CGContextShowTextAtPoint (context,legend.textStartX,legend.textStartY,string,strlen(string));
		
		CGContextStrokePath(context);
		
		
		[legend release];	
	}
	
	for(int i=0 ;i<[self.fouth_legendDataArray count];i++)
	{
	    CGContextBeginPath(context);
		
		LegendData	*legend =  [self.fouth_legendDataArray objectAtIndex:i];

		
		CGContextMoveToPoint(context,legend.startLineX,legend.startLineY);
		CGContextAddLineToPoint(context, legend.endLineX, legend.endLineY);
		CGContextAddLineToPoint(context, legend.textStartX, legend.textStartY-1);
		
		//text
		const char *string  = [legend.toolTip UTF8String];
		CGContextShowTextAtPoint (context,legend.textStartX,legend.textStartY,string,strlen(string));
		
		CGContextStrokePath(context);
		
				
		[legend release];	
	}
	
	/*
	NSString *descrption1 = [[NSString alloc] initWithString:@"%ibm12.34"];
	const char *string1  = [descrption1 UTF8String] ;
	CGContextShowTextAtPoint (context,5,365,string1,strlen(string1));  
	CGContextStrokePath(context);	
*/
	
	/*

	for(int j=0;j<22;j++)
	{
		NSString *descrption1 = [[NSString alloc] initWithString:@"%ibm12.34"];
		const char *string1  = [descrption1 UTF8String] ;
		CGContextShowTextAtPoint (context,5,365 - 8*(j+1),string1,strlen(string1));  
		CGContextStrokePath(context);	
	}
	
for(int i=0;i<12;i++)
	 {
		 NSString *descrption1 = [[NSString alloc] initWithString:@"%ibm12.34"];
		 const char *string1  = [descrption1 UTF8String] ;

		CGContextShowTextAtPoint (context,50,95 8*(i+1),string1,strlen(string1));  
		 CGContextStrokePath(context);	
	 }

*/	

	
	
}

-(void)SetFourthQuadrantData
{
	//if the points are less the 22 refresh the data
	float divider = 0;
	
	if([self.fouth_legendDataArray count] < FirstRow_Max_Points)
	{
		divider = FirstRow_Max_Points/[self.fouth_legendDataArray count];
	    if(divider==FirstRow_Max_Points)
			divider = FirstRow_Max_Points/2;
	}
	else 
	{
		divider =1.0;
	}
	for(int i=0;i<[self.fouth_legendDataArray count];i++)
	{
		
			LegendData	*legend =  [self.fouth_legendDataArray objectAtIndex:i];
		
		
			legend.textStartX = StartX;
			legend.textStartY = (i+1)*divider*StartY;
		
			//NSLog(@"%f======",((i+1)*divider*StartY));
			[self.fouth_legendDataArray replaceObjectAtIndex:i withObject:legend];
	}

}

-(void)SetFirstQuadrantData
{
	//if the points are less the 22 refresh the data
	float divider = 0;
	
	if([self.first_legendDataArray count] < FirstRow_Max_Points)
	{	
		divider = FirstRow_Max_Points/[self.first_legendDataArray count];
		if(divider==FirstRow_Max_Points)
			divider = FirstRow_Max_Points/2;
	    
	}
	else
	{
		divider =1.0;
	}
	for(int i=0;i<[self.first_legendDataArray count];i++)
	{
		LegendData	*legend =  [self.first_legendDataArray objectAtIndex:i];
		
		
	
			legend.textStartX = StartX;
			legend.textStartY = (i+1)*divider*StartY+SecondStartY;
		
		
				
		[self.first_legendDataArray replaceObjectAtIndex:i withObject:legend];
	}
	
}


-(void)SetThirdQuadrantData
{
	//if the points are less the 22 refresh the data
	float divider = 0;
	
	
	if([self.third_legendDataArray count] < FirstRow_Max_Points)
	{
		divider = FirstRow_Max_Points/[self.third_legendDataArray count];
	    
		if(divider==FirstRow_Max_Points)
			divider = FirstRow_Max_Points/2;
	}
	else
	{
		divider =1.0;
	}
		
	for(int i=0;i<[self.third_legendDataArray count];i++)
	{
		LegendData	*legend =  [self.third_legendDataArray objectAtIndex:i];
		
			legend.textStartX = 5;
			legend.textStartY = (SecondStartY-5) - (i+1)*divider*StartY;
		
		
		[self.third_legendDataArray replaceObjectAtIndex:i withObject:legend];
	}
	
}

-(void)SetSecondQuadrantData
{
	//if the points are less the 22 refresh the data
	float divider = 0;
	
	
	if([self.second_legendDataArray count] < FirstRow_Max_Points)
	{	
		divider = FirstRow_Max_Points/[self.second_legendDataArray count];
	   
	
		
		if(divider==FirstRow_Max_Points)
			divider = FirstRow_Max_Points/2;
	}
	else
	{
		divider =1.0;
	}
		
	for(int i=0;i<[self.second_legendDataArray count];i++)
	{
		LegendData	*legend =  [self.second_legendDataArray objectAtIndex:i];
		
		
		
			legend.textStartX = 5;
			legend.textStartY = (SecondStartY+166) - (i+1)*divider*StartY;
				
		[self.second_legendDataArray replaceObjectAtIndex:i withObject:legend];
	}
	
}



//random color generator
- (UIColor *)randomcolor{
	
	static BOOL seeded = NO;	if(!seeded){
	    seeded = YES;
		srandom(time(NULL));
	}
	CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
	CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    
	return [UIColor colorWithRed:red  green:green blue:blue alpha:1.0f];
	
}

-(void)changeDataFuntion:(NSMutableArray *)newdata
{
	//[self.data_array removeAllObjects];
	self.data_array = newdata;	
	
}

- (void)dealloc {
	[second_legendDataArray release];
	[third_legendDataArray release];
	[first_legendDataArray release];
	[fouth_legendDataArray release];
	[data_array release];
    [super dealloc];
}


@end
