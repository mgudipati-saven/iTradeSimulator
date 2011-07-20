/*
 File: EditableCell.m
 Abstract: 
 Custom table cell used in the settings view's table. Contains a UITextField for in-place editing of content.
 */

#import "EditableCell.h"

@implementation EditableCell

@synthesize textField;

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier 
{
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) 
	{
        // Set the frame to CGRectZero as it will be reset in layoutSubviews
        textField = [[UITextField alloc] initWithFrame:CGRectZero];
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.font = [UIFont systemFontOfSize:32.0];
        textField.textColor = [UIColor orangeColor];
		//veeru for the changing the  keybord to Caps and  also removing the  correction
		textField.keyboardType = UIKeyboardTypeASCIICapable;	
		textField.autocorrectionType = UITextAutocorrectionTypeNo;
		textField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
		
		
		
        [self addSubview:textField];
    }
    
	return self;
}

- (void)dealloc 
{
    // Release allocated resources.
    [textField release];
    [super dealloc];
}

- (void)layoutSubviews 
{
    // Place the subviews appropriately.
    textField.frame = CGRectInset(self.contentView.bounds, 10, 0);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated 
{
    [super setSelected:selected animated:animated];
	
    // Update text color so that it matches expected selection behavior.
    if (selected) 
	{
        textField.textColor = [UIColor whiteColor];
    } 
	else 
	{
        textField.textColor = [UIColor darkGrayColor];
    }
}

@end
