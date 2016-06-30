#import <Foundation/Foundation.h>
#import "PrintSelf.h"
//protocol name always at tail
//u can't use protocol and not implementation it's method . if u use category to pretend a protocol , then u needn't implementation it's method
@interface Human  : NSObject <PrintSelf>
@property int age;
- (Human*) initWithAge:(int) age;
- (void) printSth;
@end