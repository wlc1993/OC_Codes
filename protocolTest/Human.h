#import <Foundation/Foundation.h>
#import "PrintSelf.h"
@interface Human <PrintSelf> : NSObject
@property int age;
- (Human*) initWithAge:(int) age;
- (void) printSth;
@end 