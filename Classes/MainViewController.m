
#import "MainViewController.h"
#import "AppDelegate.h"
#import "Song.h"
#import "SongParser.h"

@implementation MainViewController

@synthesize tableView, parser;

- (IBAction)startParser {
	// NSLog(@"Starting the parser...");
	// Create the parser, set its delegate, and start it.
    self.parser = [[[SongParser alloc] init] autorelease];
    parser.delegate = self;
    [parser parseFromRemoteUrl:@"http://ax.phobos.apple.com.edgesuite.net/WebObjects/MZStore.woa/wpa/MRSS/newreleases/limit=300/rss.xml"];
}

// Update the table before the view displays.
- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

// This table will always only have one section.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv {
    return 1;
}

// One row per song, the number of songs is the number of rows.
- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return appDelegate.songs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if (cell == nil) {
        // Create a new cell. CGRectZero allows the cell to determine the appropriate size.
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyCell"] autorelease];
    }
    // Retrieve the book object matching the row from the application delegate's array.
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Song *song = (Song *)[appDelegate.songs objectAtIndex:indexPath.row];
    cell.text = song.title;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[tableView release];
	[parser release];
    [super dealloc];
}

#pragma mark <XMLParserDelegate> Implementation

- (void)parserDidEndParsingData:(XMLParser *)parser {
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	
	// NSNumber *songCount = [NSNumber numberWithUnsignedInteger:[appDelegate.songs count]];
	
	// NSLog(@"Song count: %@", songCount);
	// NSLog(@"End parsing data...");
	
    label.text = [NSString stringWithFormat:@"Top %u Songs", [appDelegate.songs count]];
    [tableView reloadData];
    self.parser = nil; 
}

- (void)parser:(XMLParser *)parser didParseObjects:(NSArray *)parsedObjects {
	
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate.songs addObjectsFromArray:parsedObjects];
	
	// NSLog(@"Adding objects...");
	
    if (!tableView.dragging && !tableView.tracking && !tableView.decelerating) {
        label.text = [NSString stringWithFormat:@"Top %u Songs", [appDelegate.songs count]];
        [tableView reloadData];
    }
}

- (void)parser:(XMLParser *)parser didFailWithError:(NSError *)error {
    // handle errors as appropriate to your application...
}

@end
