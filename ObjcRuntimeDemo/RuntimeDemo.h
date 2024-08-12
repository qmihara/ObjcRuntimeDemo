//
//  RuntimeDemo.h
//  ObjcRuntimeDemo
//
//  Created by Kyusaku Mihara on 2024/08/12.
//

#ifndef RuntimeDemo_h
#define RuntimeDemo_h

#import <UIKit/UIKit.h>

void printViewControllerClass(void);

@interface UIViewController (Runtime)

+ (void)swizzleLifeCycleMethods;

@end

#endif /* RuntimeDemo_h */



