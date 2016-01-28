//
//  TermsConditionsViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/25/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "TermsConditionsViewController.h"

@interface TermsConditionsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *termsSwitch;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

@end

@implementation TermsConditionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Terms & Conditions";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchToggled:(id)sender {
    if (self.termsSwitch.isOn) {
        self.nextButton.enabled = true;
    }
    else {
        self.nextButton.enabled = false;
    }
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
