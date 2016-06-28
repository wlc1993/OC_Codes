#import <Foundation/Foundation.h>

@interface Human : NSObject
{
@public
	int 		_age;
	int 		_weight;
	NSString* 	_name;
}
- (void) initWithString:(NSString*) tName setAge:(int) tAge;
- (int) getAge;
- (NSString*) getName;
+ (void) saySth;

@end 

@implementation Human
- (void) initWithString:(NSString*) tName setAge:(int) tAge
{
	_name = tName;
	_age = tAge;
	self->_age = tAge;
}
- (int) getAge
{
	return _age;
}
- (NSString*) getName
{
	return _name;
}
+ (void) saySth
{
	printf(" i am saySth");
}
@end

int main(int argc, char const *argv[])
{
	id h = [[Human alloc] init];
	[h initWithString: @"yzj" setAge: 123];
	NSLog(@"%@", [h getName]);

	// 注意这里不能用点来访问 必须用箭头访问public成员属性
	NSLog(@"%d", ((Human*)h)->_age);
	[Human saySth];

}