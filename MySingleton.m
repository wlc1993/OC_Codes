#import "MySingleton.h"
@implementation MySingleton
static id instance = nil;
+ (id) instance 
{
	if(!instance){
		instance = [[MySingleton alloc] init];
	}
	return instance;
}
@end 


int main(int argc, char const *argv[])
{
	NSLog(@"%d", [MySingleton instance] == [MySingleton instance]);
	NSLog(@"%@", [MySingleton instance]);
	NSLog(@"%@", [MySingleton instance]);
	NSLog(@"%@", [[MySingleton alloc] init]);
} 