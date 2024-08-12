//
//  ViewController.h
//  ObjcRuntimeDemo
//
//  Created by Kyusaku Mihara on 2024/08/12.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, copy) NSString *foo;
@property(nonatomic, copy) NSString *bar;
@property(nonatomic, copy) NSString *baz;

- (void)methodFoo;
- (void)methodBar:(NSString *)param;
- (void)methodBaz:(NSString *)param1 withParam2:(NSString *)param2;

@end

