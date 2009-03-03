
#import "Song.h"

@implementation Song

@synthesize title;

- (id)initWithTitle:(NSString *)theTitle {
	if (self = [super init]) {
		
		self.title = theTitle;
	}
	return self;
}

- (void)dealloc {
    [title release];
    [super dealloc];
}

@end
