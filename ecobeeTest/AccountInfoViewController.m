//
//  AccountInfoViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/25/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "AccountInfoViewController.h"

@interface AccountInfoViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *repeatPasswordField;

@end

@implementation AccountInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.firstNameField.layer.borderWidth = 2.0;
//    self.firstNameField.layer.borderColor = [UIColor clearColor].CGColor;
//    self.lastNameField.layer.borderWidth = 2.0;
//    self.lastNameField.layer.borderColor = [UIColor clearColor].CGColor;
//    self.emailField.layer.borderWidth = 2.0;
//    self.emailField.layer.borderColor = [UIColor clearColor].CGColor;
//    self.passwordField.layer.borderWidth = 2.0;
//    self.passwordField.layer.borderColor = [UIColor clearColor].CGColor;
//    self.repeatPasswordField.layer.borderWidth = 2.0;
//    self.repeatPasswordField.layer.borderColor = [UIColor clearColor].CGColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Do validation checking on when next button pressed.
// [Can fix for all valid together to enable, but no direction for user]
- (IBAction)nextButtonPressed:(id)sender {
    
    // First name field (3-20)
    if (![self checkFirstNameValid]) {
        [self showAlert:@"First Name Field must be between 3-20 characters"];
        return;
    }
    
    // Last name field (3-20)
    if (![self checkLastNameValid]) {
        [self showAlert:@"Last Name Field must be between 3-20 characters"];
        return;
    }
    
    // Email Field (valid email)
    if (![self checkEmailValid]) {
        [self showAlert:@"Must enter a valid Email"];
        return;
    }
    
    // Password Field (no spaces)
    if (![self checkPassswordValid]) {
        [self showAlert:@"Password cannot contain any spaces"];
        return;
    }
    
    // Repeat Password Field (same as password)
    if (![self checkRepeatPasswordValid]) {
        [self showAlert:@"Passwords must match!"];
        return;
    }
}

// Validation
- (BOOL) checkFirstNameValid {
    // First name field (3-20)
    if (self.firstNameField.text.length < 3 || self.firstNameField.text.length > 20) {
        self.firstNameField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    return true;
}

- (BOOL) checkLastNameValid {
    // Last name field (3-20)
    if (self.lastNameField.text.length < 3 || self.lastNameField.text.length > 20) {
        self.lastNameField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    return true;
}

- (BOOL) checkEmailValid {
    // Email Field (valid email)
    if (![self NSStringIsValidEmail:self.emailField.text]) {
        self.emailField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    return true;
}

- (BOOL) checkPassswordValid {
    // Password Field (no spaces)
    if ([self.passwordField.text containsString:@" "]) {
        self.passwordField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    return true;
}

- (BOOL) checkRepeatPasswordValid {
    // Repeat Password Field (same as password)
    if (![self.passwordField.text isEqualToString:self.repeatPasswordField.text]) {
        self.passwordField.layer.borderColor = [[UIColor redColor] CGColor];
        self.repeatPasswordField.layer.borderColor = [[UIColor redColor] CGColor];
        return false;
    }
    return true;
}

// TextField Delegate
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    textField.layer.borderColor = [UIColor clearColor].CGColor;
}

// Error handling
- (void) showAlert:(NSString*)text {
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"Error" message:text preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [vc addAction:okBtn];
    [self.navigationController presentViewController:vc animated:true completion:nil];
}

// Code copied from Online StackOverflow to determine valid email checking
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
