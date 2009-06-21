//
//  SomeNetworkOperation.h
//  ConcurrentOperationTest
//
//  Created by Justin Palmer on 6/21/09.
//  Copyright 2009 Alternateidea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SomeNetworkOperationDelegateProtocol.h"

@interface SomeNetworkOperation : NSOperation {
    id <SomeNetworkOperationDelegate>_delegate;
    NSURL *_urlToLoad;
    
    NSURLConnection *_connection;
    NSMutableData   *_responseData;
    
    BOOL _isFinished;
    BOOL _isExecuting;
}

@property (nonatomic, assign) id <SomeNetworkOperationDelegate>delegate;
@property (nonatomic, retain) NSURL *urlToLoad;
@end
