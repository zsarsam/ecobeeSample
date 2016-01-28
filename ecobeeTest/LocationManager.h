//
//  LocationManager.h
//  ecobeeTest
//
//  Created by Zaid Sarsam on 1/27/16.
//  Copyright © 2016 sarsam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationManager : NSObject <CLLocationManagerDelegate>

+ (LocationManager *)sharedInstance;

@property (nonatomic, strong) CLLocationManager* locationManager;
- (CLLocationCoordinate2D) getLocation:(void (^)(BOOL success))locationBlock;
- (void) startUpdatingLocation;
- (void) stopUpdatingLocation;

@end