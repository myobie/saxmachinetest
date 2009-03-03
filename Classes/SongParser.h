
#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "SAXMachine.h"
#import "Song.h"


@interface SongParser : XMLParser <SAXMachine> {
	NSInteger totalSongCount;
}

@end
