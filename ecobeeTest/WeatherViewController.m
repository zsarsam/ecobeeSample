//
//  WeatherViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/27/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "WeatherViewController.h"
#import "LocationManager.h"

@interface WeatherViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *weatherSwitch;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchPressed:(id)sender {
    if (self.weatherSwitch.isOn) {
        // Initialize Location Services
        [[LocationManager sharedInstance] getLocation:^void(BOOL success) {
            if (success) {
                [[LocationManager sharedInstance] startUpdatingLocation];
                CLLocationCoordinate2D location = [[LocationManager sharedInstance] getLocation:nil];
                NSLog(@"success, get location %f", location.latitude);
                [self.weatherSwitch setOn:true];
            }
            else {
                NSLog(@"fail");
                [self.weatherSwitch setOn:false];
            }
        }];
    }
}

- (IBAction)nextButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = nil;
    
    if (self.weatherSwitch.isOn) {
        // Check if Location is on
        if ([[LocationManager sharedInstance] locationAllowed]) {
            // Show Details
            vc = [storyboard instantiateViewControllerWithIdentifier:@"AddressID"];
        }
        else {
            // Congrats Page
            vc = [storyboard instantiateViewControllerWithIdentifier:@"CongratsID"];
        }
    }
    else {
        // Go to Congrats page
        vc = [storyboard instantiateViewControllerWithIdentifier:@"CongratsID"];
    }
    
    [self.navigationController pushViewController:vc animated:true];
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
