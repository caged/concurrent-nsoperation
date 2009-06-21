//
//  ConcurrentOperationTestViewController.h
//  ConcurrentOperationTest
//
//  Created by Justin Palmer on 6/21/09.
//  Copyright Alternateidea 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConcurrentOperationTestViewController : UIViewController {
    IBOutlet UILabel *countLabel;
}
@property (nonatomic, retain) UILabel *countLabel;
@end

