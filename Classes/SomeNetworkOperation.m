//
//  SomeNetworkOperation.m
//  ConcurrentOperationTest
//
//  Created by Justin Palmer on 6/21/09.
//  Copyright 2009 Alternateidea. All rights reserved.
//

#import "SomeNetworkOperation.h"
@interface SomeNetworkOperation ()
- (void)finish;
@end

@implementation SomeNetworkOperation
@synthesize delegate = _delegate;
@synthesize urlToLoad = _urlToLoad;

- (id)init
{
   if(self = [super init]) {
       _isExecuting = NO;
       _isFinished = NO;
   }
   
   return self;
}

- (void)dealloc
{
    [_urlToLoad release];
    [super dealloc];
}

- (BOOL)isConcurrent {
    return YES;
}

- (void)start
{
    if (![NSThread isMainThread])
    {
        [self performSelectorOnMainThread:@selector(start) withObject:nil waitUntilDone:NO];
        return;
    }

    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.urlToLoad cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0];
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
    if(_connection) {
        _responseData = [[NSMutableData alloc] init];        
    } else {
        [self finish];
    }    
}

- (void)finish {
    [_connection release];
    _connection = nil;
    
    [_responseData release];
    _responseData = nil;

    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];

    _isExecuting = NO;
    _isFinished = YES;

    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isExecuting {
   return _isExecuting;
}

- (BOOL)isFinished {
   return _isFinished;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [_responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_responseData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
 
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
    
    [self finish];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    UIImage *img = [[UIImage alloc] initWithData:_responseData];
    NSDictionary *info = [NSDictionary dictionaryWithObjectsAndKeys:img, @"img", _urlToLoad, @"url", nil];
    
    if([_delegate respondsToSelector:@selector(didFinishLoad:)]) {
        [_delegate performSelector:@selector(didFinishLoad:) withObject:info];
    }
    
    [img release];
    [self finish];
}
@end
