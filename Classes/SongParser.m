
#import "XMLParser.h"
#import "SongParser.h"

@implementation SongParser

- (void)startElementNamed:(NSString *)name withAtrributes:(NSDictionary *)attributes {
	
	// NSLog(self.hierarchyString);
	
	if ([name isEqualToString:@"item"]) {
		// NSLog(@"We are starting a new song...");
		
		Song *songObj = [[Song alloc] init];
		self.currentObject = songObj;
		[songObj release];
		
		self.parsingAnObject = YES;
	}
	
}

- (void)endElementNamed:(NSString *)name {
	
	if (self.parsingAnObject == NO) return;
	
	NSString *chars = [self currentString]; // calling currentString clears it out, so we gotta save it
	
	if ([self.hierarchyString isEqualToString:@"/rss/channel/item"]) {		
		[self finishedCurrentObject];
		self.parsingAnObject = NO;
		return;
	}
	
	if ([self.hierarchyString isEqualToString:@"/rss/channel/item/title"]) {
		[(Song *)self.currentObject setTitle:chars];
	}
}

- (NSArray *)recordCharactersIfNameOrPathIsIn {
	return [NSArray arrayWithObjects:@"/rss/channel/item/title", nil]; // could be category, itms, etc
}

@end
