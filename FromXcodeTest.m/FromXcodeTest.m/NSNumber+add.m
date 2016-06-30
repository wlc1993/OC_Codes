#import <Foundation/Foundation.h>
@implementation NSNumber (add)

- (NSNumber*) add: (double) num
{
	return [NSNumber numberWithDouble: ([self doubleValue] + num )];
}

@end

