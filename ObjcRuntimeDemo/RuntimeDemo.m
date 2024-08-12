//
//  RuntimeDemo.m
//  ObjcRuntimeDemo
//
//  Created by Kyusaku Mihara on 2024/08/12.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "RuntimeDemo.h"

void printViewControllerClass(void) {
    const char *className = "ViewController";

    Class clazz = objc_getClass(className);
    if (clazz == NULL) {
        NSLog(@"%s not found.", className);
        return;
    }

    unsigned int numberOfProperties = 0;
    objc_property_t *properties = class_copyPropertyList(clazz, &numberOfProperties);
    NSLog(@"%s's properties(%d)", className, numberOfProperties);
    for (unsigned int i = 0; i < numberOfProperties; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        NSLog(@"- %s", propertyName);
    }
    free(properties);

    unsigned int numberOfMethods = 0;
    Method *methods = class_copyMethodList(clazz, &numberOfMethods);
    NSLog(@"%s's methods(%d)", className, numberOfMethods);
    for (unsigned int i = 0; i < numberOfMethods; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        const char *methodName = sel_getName(selector);
        NSLog(@"- %s", methodName);
    }
    free(methods);
}

@implementation UIViewController (Runtime)

+ (void)swizzleLifeCycleMethods {
    Method origin = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method demo = class_getInstanceMethod(self, @selector(demo_viewDidLoad));
    method_exchangeImplementations(origin, demo);
}

- (void)demo_viewDidLoad {
    NSLog(@"[%@(%@)] viewDidLoad", NSStringFromClass([self class]), self.navigationItem.title);
    [self demo_viewDidLoad];
}

@end
