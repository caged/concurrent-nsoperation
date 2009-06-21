//
//  ConcurrentOperationTestViewController.m
//  ConcurrentOperationTest
//
//  Created by Justin Palmer on 6/21/09.
//  Copyright Alternateidea 2009. All rights reserved.
//

#import "ConcurrentOperationTestViewController.h"

@implementation ConcurrentOperationTestViewController
@synthesize countLabel;



// The designated initializer. Override to perform setup that is required before the view is loaded.
// - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//     if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//         _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 300, 100)];
//         _countLabel.font = [UIFont boldSystemFontOfSize:14.0];
//         _countLabel.textColor = [UIColor darkGrayColor];
//         [self.view addSubview:_countLabel];
//     }
//     return self;
// }



// Implement loadView to create a view hierarchy programmatically, without using a nib.




/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [countLabel release];
    [super dealloc];
}

@end
