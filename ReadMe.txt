 ### iSimulator  ###

===========================================================================
DESCRIPTION:
	The iSimulator application allows Quote.com users to play the 
Stock Simulator game from an iPhone. The user id and password are saved in
the standard settings bundle of the device. When the application is
launched, it loads the user credentials from the settings database and
tries to authenticate using Quote.com's login web service. If the
credentials are not found or if the authentication fails, a login dialog
is presented to the user. The information entered by the user is saved into
the settings database for future use. This allows the users to enter the
game without having to enter the username/password everytime they want
to use the application. If the user wishes to enter the game using a 
different login id, he/she can edit the settings for the application before
launching the application.

	After a successful login, the application downloads the uesr's account
details and portfolio for the default game. User can switch between the
games by using the settings area within the application. The settings area
is launched by clicking on the "information" icon at the bottom-right 
corner in "Account" tab.

===========================================================================
BUILD REQUIREMENTS

Mac OS X 10.5.3, Xcode 3.1, iPhone OS 2.0

===========================================================================
RUNTIME REQUIREMENTS

Mac OS X 10.5.3, iPhone OS 2.0

===========================================================================
PACKAGING LIST

appData.plist

	Chart URL is used for pulling gif charts from Quote.com.
	E.g = http://charts.quote.com/cis/qc
	
	Search URL is used for symbol search.
	E.g = http://216.23.226.111/SymbolSearch.jsp?key=2S89-A43F2!&user=chartdev&pwd=chartdev&exchange=NYSE,NASD,AMEX&sort=Company&rows=10&scc
	
	Mode is used to switch between production mode and development modes.
	E.g = Production.
	
	Base URL points to the online stock simulator game.
	E.g = http://202.53.70.20/simulator/simulator
	
	Login URL is used to authenticate the user against Quote.com server.
	E.g = http://www.quote.com/portfolios/xml/portfolios.action
	
	Login ID, Password is used to save and restore user id information.
	
	Order Type, Price Type, Term are used for default values.
	E.g = Buy, Market, Day respectively.
	
	Order Types, Price Types, Term Types are used to store the lists.
	E.g = Buy, Sell for Order Types.
	
AccountViewController.h
AccountViewController.m
AccountCell.h
AccountCell.m
UserAccount.h
UserAccount.m
	Shows user account details.
	Allows user to refresh the details by clicking on the refresh button.
	Shows last update time.
	Performs user login on a separate thread without blocking the UI.
	Manages login window.
	Uses application delegate (StockSimulatorAppDelegate) reference.

CommunityViewController.h
CommunityViewController.m
CustomHeaderViewController.h
CustomHeaderViewController.m
CommunityDefaultViewCell.h
CommunityDefaultViewCell.m
RatingViewController.h
RatingViewController.m
UserProfile.h
UserProfile.m
	Shows top performing portfolios.
	Shows most active users.
	Allows users to give buy/sell ratings to stocks.
	Shows top traders stocks.
	Shows most popular traders.

LoginScreenViewController.h
LoginScreenViewController.m
	Login screen.
	
OrderHistory.h
OrderHistory.m
OrderViewController.h
OrderViewController.m
OrderViewCell.h
OrderViewCell.m
DetailOrderViewController.h
DetailOrderViewController.m
	Shows pending orders.
	Allows users to cancel an order from the order detail view.
	
Reachability.h
Reachability.m
	Check if network connection is available.
	
AreaChartViewController.h
AreaChartViewController.m
PieChartDataType.h
PieChartDataType.m
PieChartViewController.h
PieChartViewController.m
LegendData.h
LegendData.m
	Pie charts with legends to show portfolio distribution.
	AreaChartViewController is used to show charts in landscape view.
	
GameSelectionViewController.h
GameSelectionViewController.m
SettingsViewController.h
SettingsViewController.m
	Launced from Account tab when clicked on 'i' icon.
	Allows user to switch between games.

SearchSymbolViewController.h
SearchSymbolViewController.m
SearchSymbolDataType.h
SearchSymbolDataType.m
	Sets up the text field to enter search text.
	Sets up the table to display matching results.
	Uses Quote.com's symbol lookup web service. Sends a request
	on every key stroke cancelling the previous request.
	
SimulatorXMLParser.h
SimulatorXMLParser.m
	All the xml parsing for account and portfolio is done here.
	Uses callbacks into application delegate so that UI is not blocked.

StockSimulatorAppDelegate.h
StockSimulatorAppDelegate.m
	The controller for the application.
	Sets up the settings database with user id, password information.
	Loads configuration details from appData.plist.
	Sets up Tabbar using nib files for various views.
	Implements the functions to show/hide loader, get user portfolio, 
	game data, account details, etc.
	
CustomTabBarController.h
CustomTabBarController.m
	Customized to allow landscape mode for charts.
	
DetailCell.h
DetailCell.m
	Customized table cell used in various views.
	
EditingViewController.h
EditingViewController.m
	Customized view to support generic editin for various views.
	
EditableCell.h
EditableCell.m
	Customized table cell that supports editing.
	
LoaderViewController.h
LoaderViewController.m
	View that indicates activity while user is waiting for a response.
	Blocks UI.
	
MakeTradeCell.h
MakeTradeCell.m
	Customized table cell for Make a trade view.
	
SplashViewController.h
SplashViewController.m
	Customized view to show the initial splash screen while the application
	is loading.
	
TypeListViewController.h
TypeListViewController.m
	Customized view to allow user to select an option from mutliple options.
	
DetailQuoteView.h
DetailQuoteView.m
EditSymbolViewController.h
EditSymbolViewController.m
NewsViewController.h
NewsViewController.m
TradeViewController.h
TradeViewController.m
	View to show quote details.
	Allows user to edit the symbol to trade.
	Retrieves latest 5 news headlines from getNews.action web service.
	Allows user to setup trade details. Submits the trade to placeOrderAction web service.

DefaultViewCell.h
DefaultViewCell.m
DetailsOfRankerViewController.h
DetailsOfRankerViewController.m
RankerTableViewCell.h
RankerTableViewCell.m
RankerPortfolioViewCell.h
RankerPortfolioViewCell.m
RankingTableViewCell.m
RankingTableViewCell.h
RankingTableViewCell.m
RankingTableViewController.h
RankingTableViewController.m
	Show top 20 ranked users.
	Shows details of each user - his profile, favorite stocks, portfolio constituents.

PositionDetailViewController.h
PositionDetailViewController.m
PortfolioTableViewController.h
PortfolioTableViewController.m
PortfolioTableViewCell.h
PortfolioTableViewCell.m
	Shows user portfolio constituent list.
	Shows details on each open position.
	Allows user to sell an open position.
	Calculates gain/loss using latest prices.

TO DO LIST
===========================================================================
- Download url and other app settings from quote.com (appconfig.xml)

CHANGES FROM PREVIOUS VERSIONS
===========================================================================

Version 0.9.2
-Reading the  username and password from setting and swichoff the login view 
 if setting contain username  and  password
-Modify big chart
-Add new headers in Community tab
-Memory managment issues in community screen
-Memory managment issues in Top20 screen    
 
Version 0.9.1
-Show activity indicator at the center of the screen while fetching data.
-Disable 'submit' button until the order form is filled in 'Make a Trade'
 view.
-Add thumbnail chart to 'Get Quote' view. Show advanced charts when the
 device is rotated to horizontal position. Change the 'Quote' layout using
 smaller fonts.
-Turn off propmting while editing symbol to trade.
-Show uppercase letters for symbol field. 
-Show numeric keyboard while entering trade quantity and purchase price.
-Calculate cash balance and show as 'Approx. Cash Balance' in 'Make a Trade'
 view.
-Ranking should start from 1.
-Test network accessibility immediately after launching the app and throw
 a decent message to the user.
-Implement quote.com login. Show Login alert box and prompt the user to
 enter loginid and password as a modal dialog box. Save the information
 in user's settings and use it for further logins.
-Remove 'Settings' tab and move it into 'Account' tab. Use an icon at the
 bottom to flip to 'Settings' view.
-Add 'dev' and 'prod' modes to the settings. In the 'dev' mode allow base
 url to be edited. In 'prod' mode use quote.com url.
-Show user's actual avatar in 'Account' tab. 
-Swtich to first view while navigating using tab bar.
-Add more fields to 'Account' tab.
-Show portfolio pie chart as a flip view when user clicks on a button. The
 button is on the top left corner of 'Portfolio' view.
-Add 'Refresh' button to 'Account' tab and show last update time at the
 bottom.
-Update cash balance in real-time to help making trades.(completed)
-Show user's profile (if it is public) when clicked from ranking view.
 Allow that user to be added as a favorite.
-Allow user to modify order details when selling from Portfolio
-Added newScreen pending orders and order cancelling
-Added Community Tab
-Added Ranker Deatails in newscreen
-Added news in getquotes screen

Version 0.9
-Changed table styles to plain from grouped for portfolio and open position
 table views.
-Added Ranking Table.
-Replaced UITextField with UILabel in detail cell and portfolio table view cell.
-Customized Ranking Table cell.
-Reload Ranking Table while switching games.
-Changed bundle display name to iSimulator.

Version 0.8
-Show female icon if gender = F in Account tab.
-Reload Portfolio tab.

Version 0.7
-Added game selection view to switch between games or accounts.
-Updated settings view to use game selection view.
-Updated settings view to include login action button.

Version 0.6
-Supports mutliple games version.
-Modified UserAccount class to hold game details.
-Created UserProfile calls to hold user profile details.
-Updated parser to parse multiple accounts.
-Changed images.

Version 0.5
-Modified application icons.
-Added view controller to edit symbol
-Custom table view cell for portfolio table.

Version 0.4
-Added StockQuoteViewController to show current snapshot information.
-Added TypeListViewController to display any list with exclusive selection using checkbox.
-Updated TradeViewController to submit trades.

Version 0.3
-Added view to edit settings.
-Can sell an open position. (Market Order only)
-Added appData properties file to store user settings.
-Added Settings View to show login url, userid and game name selection
-Added male.png

Version 0.2
-Added UserAccount to encapsulate user account details.
-AccountView is a table view.
-Parser creates UserAccount object.
-Reloading Account view

Version 0.1
-Initial prototype
===========================================================================
Copyright (C) 2009 Saven Technologies Inc. All rights reserved.