//
//  ConcurrentOperationTestAppDelegate.h
//  ConcurrentOperationTest
//
//  Created by Justin Palmer on 6/21/09.
//  Copyright Alternateidea 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SomeNetworkOperationDelegateProtocol.h"

@class ConcurrentOperationTestViewController;

@interface ConcurrentOperationTestAppDelegate : NSObject <SomeNetworkOperationDelegate, UIApplicationDelegate> {
    UIWindow *window;
    ConcurrentOperationTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ConcurrentOperationTestViewController *viewController;

@end

