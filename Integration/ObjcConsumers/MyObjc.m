#import <Foundation/Foundation.h>
#import "SwiftStructEnumSources-Swift.h"

@interface MyObjcClass : NSObject
@end

@implementation MyObjcClass

- (void)someMethod {
    Foo *foo = [[Foo alloc] initWithStr:@"xxx" optDouble:@(2.2) isValid:true];
    NSLog(@"Foo: %@", foo);
}

@end
