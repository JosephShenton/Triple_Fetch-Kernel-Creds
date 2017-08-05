//
//  consoleAreaViewController.m
//  nsxpc2pc
//
//  Created by Joseph on 5/8/17.
//  Copyright © 2017 Ian Beer. All rights reserved.
//

#import "consoleAreaViewController.h"

@interface consoleAreaViewController ()

@end

@implementation consoleAreaViewController
@synthesize console;
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *console_output = [[NSUserDefaults standardUserDefaults] objectForKey:@"console"];
    if ([console_output  isEqual: @""]) {
        console_output = @"Please start the exploit to see console.";
        console.text = console_output;
    } else {
        console.text = console_output;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)emptyConsole:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Are you sure you want to clear console? This will remove all output!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Clear", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch(buttonIndex) {
        case 0: //"Cancel" pressed
            // Do Nothing.
            break;
        case 1: //"Clear" pressed
            // Clearing Console.
            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"console"];
            if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"running"]  isEqual: @"running"]) {
                console.text = @"Console emptied. Exploit is running.";
            } else {
                console.text = @"Console emptied. Please start the exploit to see console.";
            }
            break;
    }
}


@end
