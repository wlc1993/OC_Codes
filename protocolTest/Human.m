#import "Human.h"
@implementation Human

- (void) printSelfMethod
{
	NSLog(@"this is printSelfMethod");
}

- (Human*) initWithAge:(int) age
{
	if (self = [super init])
	{
		// two same sentense
		self->_age = age;
		self.age = age;
	}
	return self;
}
- (void) printSth
{
	NSLog(@"i am Human printSth %d", self.age);
}
@end 


int main(int argc, char const *argv[])
{
	Human* me = [[Human alloc] initWithAge:12];
	[me printSth];
	[me printSelfMethod];
	return 0;
}