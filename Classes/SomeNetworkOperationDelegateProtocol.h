//
//  SomeNetworkOperationDelegateProtocol.h
//  ConcurrentOperationTest
//
//  Created by Justin Palmer on 6/21/09.
//  Copyright 2009 Alternateidea. All rights reserved.
//

@protocol SomeNetworkOperationDelegate <NSObject>
- (void)didFinishLoad:(NSDictionary *)info;
@end