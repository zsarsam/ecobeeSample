//
//  LoginViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/25/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImageView *email = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email"]];
    email.frame = CGRectMake(0.0, 0.0, email.image.size.width+20.0, email.image.size.height);
    email.contentMode = UIViewContentModeCenter;
    
    self.emailTextField.leftViewMode = UITextFieldViewModeAlways;
    self.emailTextField.leftView = email;
    self.emailTextField.layer.borderWidth = 1.0;
    self.emailTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"email" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.emailTextField.textColor = [UIColor whiteColor];
    
    
    UIImageView *password = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"secure"]];
    password.frame = CGRectMake(0.0, 0.0, password.image.size.width+20.0, password.image.size.height);
    password.contentMode = UIViewContentModeCenter;
    
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.leftView = password;
    self.passwordTextField.layer.borderWidth = 1.0;
    self.passwordTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.passwordTextField.textColor = [UIColor whiteColor];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
