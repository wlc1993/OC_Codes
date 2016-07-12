#import <Foundation/Foundation.h>
void sayHi();
void swap(int *a,int *b)
{
	int c;
	c = *a;

	*a = *b;
	*b = c;
}


// 接口
@interface SwapTest : NSObject
// 这里不能赋值 
@property int a;
@property int b;
@end 
// 接口实现
@implementation SwapTest
@end 

void swapObject(SwapTest *test)
{
	int temp = test.a;
	test.a = test.b;
	test.b = temp;
}

int global = 1;
int main(int argc, char const *argv[])
{
	// 复习一下基础知识
// date relation
	NSLog(@"today is %@", [NSDate date]);
	NSLog(@"tomorrow date is %@", [NSDate dateWithTimeInterval: 3600 * 24 sinceDate: [NSDate date] ]);
	NSLog(@"initWithTimeIntervalSinceNow date is %@", [[NSDate date] initWithTimeIntervalSinceNow: 3600 * 24 ]);
	NSLog(@"SinceReferenceDate : %@", [NSDate dateWithTimeIntervalSinceReferenceDate: 3600 * 24 ] );

	@autoreleasepool{
		char aChar = 'a';
		NSLog(@"%c", aChar);

		//枚举
		enum season {spring = 1, summer, fall, winter};
		enum season mySeason;
		mySeason = fall;
		NSLog(@" mySeason = %d",mySeason);
		
		// bool equals signed char
		NSLog(@" yes = %d",YES);
		BOOL unYes = true;
		NSLog(@" unYes = %d", unYes);

		//random
		int random = arc4random() % 100;
		NSLog(@"random = %d", random);

		//point test
		NSString *str1 = @"i am str1";
		NSString *str2 = str1;
		str1 = @"heheqwoqu";
		NSLog(@"%@",str2);

		//  101 & 1001 = 0001 = 1
		//  101 | 1001 = 1101 = 13
		//  101 ^ 1001 = 1100 = 12
		NSLog(@"%d", 5 & 9);   
		NSLog(@"%d", 5 | 9);   
		NSLog(@"%d", 5 ^ 9);   


		int arr1[6] = {11,22,33,44,};
		arr1[1] = 22222;
		for (int i = 0; i < sizeof(arr1)/sizeof(arr1[0]); ++i)
		{
			printf("%3d", arr1[i]);
		}

		sayHi();
		int a = 1;
		int b = 2;
		swap(&a, &b);
		printf("%d %d",a,b);

		//SwapTest for NSObject
		SwapTest *test = [[SwapTest alloc] init];
		test.a = 11;
		test.b = 22;
		swapObject(test);
		NSLog(@"test = %d %d", test.a, test.b);
		extern int global;
		global = 2;
		printf("global = %d", global);
	}
}

void sayHi()
{
	printf("hi");
}