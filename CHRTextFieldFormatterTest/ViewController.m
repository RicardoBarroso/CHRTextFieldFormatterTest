//
//  ViewController.m
//  CHRTextFieldFormatterTest
//
//  Created by Ricardo Barroso on 30/09/2016.
//  Copyright © 2016 Ricardo Barroso. All rights reserved.
//

#import "ViewController.h"
#import "CHRBusinessEINNumberMask.h"
#import "CHRCardNumberMask.h"
#import "CHRPhoneNumberMask.h"
#import "CHRTextFieldFormatter.h"
#import "CHRTextFieldFormatter.h"

@interface ViewController ()
@property (nonatomic, strong) IBOutlet UITextField *originalPhoneNumberTextField;
@property (nonatomic, strong) IBOutlet UITextField *originalCardNumberTextField;
@property (nonatomic, strong) IBOutlet UITextField *phoneNumberTextField;
@property (nonatomic, strong) IBOutlet UITextField *ssnNumberTextField;
@property (nonatomic, strong) IBOutlet UITextField *businessEINNumberTextField;

@property (nonatomic, strong) CHRTextFieldFormatter *originalPhoneNumberFormatter;
@property (nonatomic, strong) CHRTextFieldFormatter *originalCardNumberFormatter;
@property (nonatomic, strong) CHRTextFieldFormatter *businessEINNumberFormatter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originalPhoneNumberFormatter = [[CHRTextFieldFormatter alloc] initWithTextField:self.originalPhoneNumberTextField mask:[CHRPhoneNumberMask new]];
    self.originalCardNumberFormatter = [[CHRTextFieldFormatter alloc] initWithTextField:self.originalCardNumberTextField mask:[CHRCardNumberMask new]];
    self.businessEINNumberFormatter = [[CHRTextFieldFormatter alloc] initWithTextField:self.businessEINNumberTextField mask:[CHRBusinessEINNumberMask new]];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.businessEINNumberTextField) {
        return [self.businessEINNumberFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    } else if (textField == self.phoneNumberTextField) {
        return [self.originalPhoneNumberFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    } else if (textField == self.originalCardNumberTextField) {
        return [self.originalCardNumberFormatter textField:textField shouldChangeCharactersInRange:range replacementString:string];
    } else {
        return YES;
    }
}

@end
