#import <Foundation/Foundation.h>
@implementation NSNumber (add)

- (NSNumber*) addDouble: (double) num 
{
	return [NSNumber numberWithDouble: ([self doubleValue] + num )];
}

@end

