//
//  CongratViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/28/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "CongratViewController.h"

@interface CongratViewController ()

@end

@implementation CongratViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem setHidesBackButton:true animated:false];
}

- (IBAction)doneButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:false];
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
