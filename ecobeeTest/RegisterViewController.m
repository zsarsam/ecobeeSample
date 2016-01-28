//
//  RegisterViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/25/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *passCodeField;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.continueButton.enabled = false;
    self.passCodeField.textColor = [UIColor whiteColor];
    self.passCodeField.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.passCodeField.layer.borderWidth = 1.0;
    self.passCodeField.text = @"XXXX";
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    self.passCodeField.text = @"";
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    if ([textField.text length] == 0) {
        textField.text = @"XXXX";
    }
}

- (BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    // Check to make sure length of string is 4 to enable button
    if (textField.text.length + string.length == 4) {
        self.continueButton.enabled = true;
    }
    else {
        self.continueButton.enabled = false;
    }
    
    // Do not allow more than 4 characters to be entered
    if (textField.text.length + string.length > 4) {
        return NO;
    }
    
    return YES;
}

- (void) viewTapped {
    [self.passCodeField resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)continuePressed:(id)sender {
}

@end
