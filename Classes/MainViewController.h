
#import <UIKit/UIKit.h>
#import "XMLParserDelegate.h"
#import "SongParser.h"

@interface MainViewController : UIViewController <XMLParserDelegate> {
	IBOutlet UITableView *tableView;
	IBOutlet UILabel *label;
	
	SongParser *parser;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) SongParser *parser;

- (IBAction)startParser;

@end

