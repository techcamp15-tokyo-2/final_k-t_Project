//
//  ViewController.h
//  GeocodingSample-iOS5
//
//  Created by Yoshiki Komachi on 2013/09/05.
//  Copyright (c) 2013年 Yoshiki Komachi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
  CLLocationManager *locationManager;
}

@property (nonatomic, retain) CLLocationManager *locationManager;
  @property (retain, nonatomic) IBOutlet UITextField *textFieldLatitude;
							    @property (retain, nonatomic) IBOutlet UITextField *textFieldLongitude;
											  @property (retain, nonatomic) IBOutlet UITextField *textFieldAddressString;
															- (IBAction)handleReverseGeocode:(id)sender;
																			     - (IBAction)handleGeocode:(id)sender;
@end
