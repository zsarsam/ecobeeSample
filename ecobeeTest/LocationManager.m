//
//  LocationManager.m
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/27/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import "LocationManager.h"
#import <UIKit/UIKit.h>

@interface LocationManager()

@property (nonatomic, copy) void (^locationBlock)(BOOL success);

@end

@implementation LocationManager

+ (LocationManager*)sharedInstance
{
    static LocationManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[LocationManager alloc] init];
    });
    
    return sharedInstance;
}

- (id) init
{
    self = [super init];
    if (self) {
        [self initLocationManager];
    }
    
    return self;
}

// Get CLLocation

- (void) initLocationManager
{
    if (self.locationManager == nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = 10;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
        
        if (systemVersion >= 8.0)
        {
            if (!self.locationAllowed)
                [self.locationManager requestWhenInUseAuthorization];
        }
    }
}

- (CLLocationCoordinate2D) getLocation:(void (^)(BOOL success))locationBlock
{
    if (self.locationBlock == nil) {
        self.locationBlock = locationBlock;
    }
    else {
        if (locationBlock != nil) {
            locationBlock(self.locationAllowed);
        }
    }
    return self.locationManager.location.coordinate;
}

- (void) startUpdatingLocation
{
    [self.locationManager startUpdatingLocation];
}

- (void) stopUpdatingLocation
{
    [self.locationManager stopUpdatingLocation];
    [self.locationManager stopMonitoringSignificantLocationChanges];
}

// CLLocationManager Delegate
- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self stopUpdatingLocation];
    //    if (UIApplication.sharedApplication.applicationState == UIApplicationStateActive)
    //    {
    //        //
    //    }
    //    else
    //    {
    //        NSLog(@"Locations in background %@", locations);
    //    }
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    // Error
    [self.locationManager stopUpdatingLocation];
}

- (void) locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
            self.locationAllowed = true;
            NSLog(@"auth");
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            self.locationAllowed = true;
            NSLog(@"auth inuse");
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"auth denied");
            self.locationAllowed = false;
            break;
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"auth not determined");
            self.locationAllowed = false;
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"auth restricted");
            self.locationAllowed = false;
            break;
        default:
            NSLog(@"auth allowed");
            self.locationAllowed = true;
            break;
    }
    
    if (self.locationAllowed) {
        if (self.locationBlock != nil) {
            [self getLocation:self.locationBlock];
        }
    }
    else {
        if (self.locationBlock != nil) {
            self.locationBlock(false);
        }
    }
}

@end
