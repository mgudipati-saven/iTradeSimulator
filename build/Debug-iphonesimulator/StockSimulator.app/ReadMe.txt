 ### iSimulator  ###

===========================================================================
DESCRIPTION:

===========================================================================
BUILD REQUIREMENTS

Mac OS X 10.5.3, Xcode 3.1, iPhone OS 2.0

===========================================================================
RUNTIME REQUIREMENTS

Mac OS X 10.5.3, iPhone OS 2.0

===========================================================================
PACKAGING LIST

StockSimulatorAppDelegate.h
StockSimulatorAppDelegate.m
	The controller for the application.

TypeListViewController.h
TypeListViewController.m

DetailCell.h
DetailCell.m

EditingViewController.h
EditingViewController.m

EditableCell.h
EditableCell.m

OpenPosition.h
OpenPosition.m

UserAccount.h
UserAccount.m

UserProfile.h
UserProfile.m

GameSelectionViewController.h
GameSelectionViewController.m

SettingsViewController.h
SettingsViewController.m

EditSymbolViewController.h
EditSymbolViewController.m

TradeViewController.h
TradeViewController.m

RankingTableViewController.h
RankingTableViewController.m

RankingTableViewCell.h
RankingTableViewCell.m

PortfolioTableViewController.h
PortfolioTableViewController.m

PositionDetailViewController.h
PositionDetailViewController.m

PortfolioTableViewCell.h
PortfolioTableViewCell.m

AccountViewController.h
AccountViewController.m

SimlatorXMLParser.h
SimlatorXMLParser.m

appData.plist

TO DO LIST
===========================================================================
-Show activity indicator at the center of the screen while fetching data.(completed)
-Disable 'submit' button until the order form is filled in 'Make a Trade'
 view.(completed)
-Add thumbnail chart to 'Get Quote' view. Show advanced charts when the
 device is rotated to horizontal position. Change the 'Quote' layout using
 smaller fonts.(completed)
-Turn off propmting while editing symbol to trade.(completed but small dout)
-Show uppercase letters for symbol field. (completed)
-Show numeric keyboard while entering trade quantity and purchase price.(completed)
-Calculate cash balance and show as 'Approx. Cash Balance' in 'Make a Trade'
 view.(completed)
-Ranking should start from 1.(completed)
-Test network accessibility immediately after launching the app and throw
 a decent message to the user.(completed)
-Implement quote.com login. Show Login alert box and prompt the user to
 enter loginid and password as a modal dialog box. Save the information
 in user's settings and use it for further logins.
-Remove 'Settings' tab and move it into 'Account' tab. Use an icon at the
 bottom to flip to 'Settings' view.(completed)
-Add 'dev' and 'prod' modes to the settings. In the 'dev' mode allow base
 url to be edited. In 'prod' mode use quote.com url.(completed)
-Show user's actual avatar in 'Account' tab. (completed)
-Swtich to first view while navigating using tab bar.(completed small problem discuss)
-Add more fields to 'Account' tab.
-Show portfolio pie chart as a flip view when user clicks on a button. The
 button is on the top left corner of 'Portfolio' view.(pending the data tips )
-Add 'Refresh' button to 'Account' tab and show last update time at the
 bottom.(completed)
-Update cash balance in real-time to help making trades.(completed)
-Show user's profile (if it is public) when clicked from ranking view.
 Allow that user to be added as a favorite.
-Download url and other app settings from quote.com (appconfig.xml)
-Allow user to modify order details when selling from Portfolio

CHANGES FROM PREVIOUS VERSIONS
===========================================================================

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
-Ranking should start from 1.

-Swtich to first view while navigating using tab bar.



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