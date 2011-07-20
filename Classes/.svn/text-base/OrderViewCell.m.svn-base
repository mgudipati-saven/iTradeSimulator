//
//  OrderViewCell.m
//  StockSimulator
//  PAVAN
//  Created by Saven Technologies on 09/07/09.
//  Copyright 2009 SAVENTECH. All rights reserved.
//

#import "OrderViewCell.h"


@implementation OrderViewCell
@synthesize m_labelleft,m_labelright,m_status; 

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        
		self.backgroundColor = [UIColor blackColor];
		// Initialization code
		self.m_labelleft = [[UILabel alloc] initWithFrame:CGRectZero];
		self.m_labelright = [[UILabel alloc] initWithFrame:CGRectZero];
		self.m_status = [[UILabel alloc] initWithFrame:CGRectZero];
		
		self.m_labelright.textAlignment = UITextAlignmentRight;
		self.m_status.textAlignment = UITextAlignmentRight;
		self.m_labelleft.textColor = [UIColor whiteColor];
		self.m_labelleft.backgroundColor = [UIColor clearColor];
		self.m_status.backgroundColor = [UIColor clearColor];
		self.m_labelright.backgroundColor = [UIColor clearColor];
		self.m_status.textColor = [UIColor orangeColor];
		self.m_labelright.textColor = [UIColor orangeColor];
		
		[self addSubview:m_labelleft];
		[self addSubview:m_labelright];
		[self addSubview:m_status];
		
	}
    return self;
}

- (void)layoutSubviews 
{
    [super layoutSubviews];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	
	[super setSelected:selected animated:NO];
	
	
	// Start with a rect that is inset from the content view by 10 pixels on all sides.
	CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
	CGRect rect = baseRect;
	CGRect srect = baseRect;
	
	rect.origin.y -= 4;
	rect.size.height = 15;
	// rect.origin.x -= 2;
	
	// Position each label with a modified version of the base rect.
	rect.origin.x += 4;
	rect.size.width = 220;
	m_labelleft.frame = rect;
	
	/*	srect.origin.x = 210;
	 srect.origin.y -= 5;
	 srect.size.width = 85;
	 srect.size.height = 30;
	 */
	srect.origin.x = 185;
	srect.origin.y +=11;
	srect.size.width = 68;
	srect.size.height = 12;
	m_status.frame = srect;
	
	rect.origin.y +=16 ;
	rect.size.width = 170;//baseRect.size.width - 75;
	rect.size.height = 12;
	m_labelright.frame = rect;
	
	
	
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{  
	[super setEditing:editing animated:NO];
}


- (void)dealloc {
	[m_labelleft release];
    [m_labelright release];
	[m_status release];
    [super dealloc];
}


@end
