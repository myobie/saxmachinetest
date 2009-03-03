
#import <UIKit/UIKit.h>
#import "XMLParser.h"

@class MainViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	MainViewController *viewController;
	NSMutableArray *songs;
	XMLParser *xmlParser;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *viewController;

@property (nonatomic, retain) NSMutableArray *songs;
@property (nonatomic, retain) XMLParser *xmlParser;

@end

