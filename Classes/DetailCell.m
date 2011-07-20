/*
 File: DetailCell.m
 Abstract: 
 Custom table cell used in the settings view's table. Capable of displaying in two modes - a "label:name" mode for existing
 data and a "prompt" mode when used as a placeholder for data creation.
 
 
 */

#import "DetailCell.h"

@implementation DetailCell

@synthesize label, value, prompt, promptMode;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
        // Initialize the labels, their fonts, colors, alignment, and background color.
		self.backgroundColor = [UIColor blackColor];
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont boldSystemFontOfSize:12];
		label.textColor = [UIColor whiteColor]; // label.textColor = [UIColor darkGrayColor];
        label.textAlignment = UITextAlignmentLeft;
        label.backgroundColor = [UIColor clearColor];
        value = [[UILabel alloc] initWithFrame:CGRectZero];
        value.font = [UIFont boldSystemFontOfSize:14];
        value.backgroundColor = [UIColor clearColor];
		value.textColor = [UIColor orangeColor]; // pavan
        value.textAlignment = UITextAlignmentRight;
        prompt = [[UILabel alloc] initWithFrame:CGRectZero];
        prompt.font = [UIFont boldSystemFontOfSize:12];
        prompt.textColor = [UIColor darkGrayColor];
        prompt.backgroundColor = [UIColor clearColor];
        
        // Add the labels to the content view of the cell.
        
        // Important: although UITableViewCell inherits from UIView, you should add subviews to its content view
        // rather than directly to the cell so that they will be positioned appropriately as the cell transitions 
        // into and out of editing mode.
        
        [self.contentView addSubview:label];
        [self.contentView addSubview:value];
        [self.contentView addSubview:prompt];
		//self.autoresizesSubviews = YES;
    }
    return self;
}

- (void)dealloc 
{
    [label release];
    [value release];
    [prompt release];
    [super dealloc];
}

// Setting the prompt mode to YES hides the label/name labels and shows the prompt label.
- (void)setPromptMode:(BOOL)flag 
{
    if (flag) 
	{
        label.hidden = YES;
        value.hidden = YES;
        prompt.hidden = NO;
    } 
	else 
	{
        label.hidden = NO;
        value.hidden = NO;
        prompt.hidden = YES;
    }
}

- (void)layoutSubviews 
{
    [super layoutSubviews];
	
    // Start with a rect that is inset from the content view by 10 pixels on all sides.
    CGRect baseRect = CGRectInset(self.contentView.bounds, 10, 10);
    CGRect rect = baseRect;
    rect.origin.x += 15;
    
	// Position each label with a modified version of the base rect.
    prompt.frame = rect;
    
	rect.origin.x -= 15;
    rect.size.width = 85;
    label.frame = rect;
    
	rect.origin.x += 75;
    rect.size.width = baseRect.size.width - 75;
    value.frame = rect;
}

// Update the text color of each label when entering and exiting selected mode.
- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
    [super setSelected:selected animated:animated];
	
    if (selected) 
	{
        label.textColor = [UIColor whiteColor];
        value.textColor = [UIColor whiteColor];
        prompt.textColor = [UIColor whiteColor];
    }
	else 
	{
        label.textColor = [UIColor whiteColor];
        value.textColor = [UIColor orangeColor];
        prompt.textColor = [UIColor orangeColor];
    }
}

@end
