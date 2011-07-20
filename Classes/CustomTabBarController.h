

@class StockSimulatorAppDelegate;
@interface CustomTabBarController : UITabBarController<UITabBarDelegate,UITabBarControllerDelegate>{
	
	//apdelagate
	StockSimulatorAppDelegate *appDelegate;
}

  @property (nonatomic, assign) StockSimulatorAppDelegate *appDelegate;
//veeru  for the instance
- (id)initWithCustomView;

@end
