
#import "AppDelegate.h"
#import "MainViewController.h"
#import "XMLParser.h"

// Private interface for AppDelegate - internal only methods.
@interface AppDelegate (Private)
- (void)initializeArray;
@end

@implementation AppDelegate

@synthesize window, viewController, songs, xmlParser;

- (void)applicationDidFinishLaunching:(UIApplication *)application {   
    [self initializeArray];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)initializeArray {
	NSMutableArray *songsArray = [[NSMutableArray alloc] init];
	self.songs = songsArray;
	[songsArray release];
}

- (void)dealloc {
	[viewController release];
	[window release];
	[songs release];
	[super dealloc];
}

@end
