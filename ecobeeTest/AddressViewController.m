//
//  AddressViewController.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/28/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "AddressViewController.h"
#import "LocationManager.h"

@interface AddressViewController ()
@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;
@property (weak, nonatomic) IBOutlet UITextField *stateProvField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeField;
@property (nonatomic) UIActivityIndicatorView *activityView;

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateFieldsForLocation];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)]];
    
    self.activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.activityView.frame = CGRectMake(CGRectGetMidX(self.view.frame)-CGRectGetWidth(self.activityView.frame)/2, CGRectGetMidY(self.view.frame)+40, CGRectGetWidth(self.activityView.frame), CGRectGetHeight(self.activityView.frame));
    [self.activityView startAnimating];
    [self.view addSubview:self.activityView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateFieldsForLocation {
    CLLocationCoordinate2D location = [[LocationManager sharedInstance] getLocation:nil];
    
    CLGeocoder *ceo = [[CLGeocoder alloc]init];
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:location.latitude longitude:location.longitude];
    
    [ceo reverseGeocodeLocation:loc
              completionHandler:^(NSArray *placemarks, NSError *error) {
                  CLPlacemark *placemark = [placemarks objectAtIndex:0];
                  
                  self.addressField.text = placemark.addressDictionary[@"Name"];
                  self.cityField.text = placemark.addressDictionary[@"City"];
                  self.stateProvField.text = placemark.addressDictionary[@"State"];
                  self.zipcodeField.text = placemark.addressDictionary[@"ZIP"];
                  [self.activityView stopAnimating];
              }
     ];
}

- (IBAction)nextButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"CongratsID"];
    [self.navigationController pushViewController:vc animated:true];
}

// Dismiss Keyboard
- (void) viewTapped {
    [self.view resignFirstResponder];
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
