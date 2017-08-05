//
//  consoleAreaViewController.h
//  nsxpc2pc
//
//  Created by Joseph on 5/8/17.
//  Copyright © 2017 Ian Beer. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface consoleAreaViewController : UIViewController <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *console;

@end
