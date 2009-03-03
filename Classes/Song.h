
#import <Foundation/Foundation.h>
#import "XMLParserObject.h"

@interface Song : XMLParserObject {
	
	NSString *title;
}

- (id)initWithTitle:(NSString *)theTitle;

@property (copy, nonatomic) NSString *title;

@end
