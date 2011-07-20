//
//  SplashViewController.h
//  StockSimulator
//
//  Created by Saven  on 28/07/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SplashViewController : UIActionSheet<UIActionSheetDelegate> {
   
	 UIImageView *imageView;
	 UIActivityIndicatorView *indicator;
	
}
@property(nonatomic,retain)  UIImageView *imageView;
@property(nonatomic,retain)  UIActivityIndicatorView *indicator;
- (id)initScreen;
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated;
@end
