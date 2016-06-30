#import "Human.h"
@implementation Human


- (void) printRequired
{
    NSLog(@"i am printRequired");
}

//- (void) printSelfMethod
//{
//	NSLog(@"this is printSelfMethod");
//}

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


//int main(int argc, char const *argv[])
//{
////	Human* me = [[Human alloc] initWithAge:12];
////	[me printSth];
//////	[me printSelfMethod];
////    [me printRequired];
//////    NSObject<PrintSelf>* you = [[Human alloc] initWithAge:13];
//////    [you printSth];
//////    [you printSelfMethod];
////    
//////    only protocol can in <>
//////    NSObject<Human>* test = [[Human alloc] initWithAge:11];
//////    [test printSth];
//    
//    
//    
//    
//    NSString* className = @"Human";
//    Class clazz = NSClassFromString(className);
//    NSLog(@"%@", clazz);
//    NSLog(@"%@", Human.class);
//    NSLog(@"%@", NSDate.class);
//    NSLog(@"%@", [NSDate date].class);
//    
//    id yzj = [[clazz alloc] init];
//    [yzj printSth];
//    
//    
////    NSNumber 内部实现就是抽象工厂   cluster 类簇
//    NSLog(@"%@", [NSNumber numberWithDouble:12.34].class);
//    NSLog(@"%@", [NSNumber numberWithInt:1].class);
//    NSLog(@"%@", [NSNumber numberWithBool:YES].class);
//	return 0;
//}





