//
//  ViewController.m
//  GeocodingSample-iOS5
//
//  Created by Yoshiki Komachi on 2013/09/05.
//  Copyright (c) 2013年 Yoshiki Komachi. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()
// 通信用
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
- (int)mainConnect;
@end

@implementation ViewController
@synthesize locationManager;

/*********************************************GPSから緯度経度を取得・場所を推定*********************************************/
- (void)viewDidLoad {
  [super viewDidLoad];
  [self mainConnect];
  locationManager = [[CLLocationManager alloc] init];
    
  // 位置情報サービスが利用できるかどうかをチェック
  if ([CLLocationManager locationServicesEnabled]) {
    locationManager.delegate = self; // ……【1】
    // 測位開始
    [locationManager startUpdatingLocation];
  } else {
    NSLog(@"Location services not available.");
  }
}

// 位置情報更新時
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {

  CLGeocoder *geocoder = [[[CLGeocoder alloc] init] autorelease];
  CLLocation *location = [[[CLLocation alloc] initWithLatitude:[newLocation coordinate].latitude longitude:[newLocation coordinate].longitude] autorelease];
  [geocoder reverseGeocodeLocation:location
	    completionHandler:^(NSArray* placemarks, NSError* error) {
      // 経度、緯度から逆ジオコーディングを行った結果（場所）の数
      //                       NSLog(@"found : %d", [placemarks count]);
                       
      for (CLPlacemark *placemark in placemarks) {
	// それぞれの結果（場所）の情報
	//                           NSLog(@"addressDictionary : %@", [placemark.addressDictionary description]);
	//                           
	//                           NSLog(@"name : %@", placemark.name);
	//                           NSLog(@"thoroughfare : %@", placemark.thoroughfare);
	//                           NSLog(@"subThoroughfare : %@", placemark.subThoroughfare);
	//                           NSLog(@"locality : %@", placemark.locality);
	//                           NSLog(@"subLocality : %@", placemark.subLocality);
	//                           NSLog(@"administrativeArea : %@", placemark.administrativeArea);
	//                           NSLog(@"subAdministrativeArea : %@", placemark.subAdministrativeArea);
	//                           NSLog(@"postalCode : %@", placemark.postalCode);
	//                           NSLog(@"ISOcountryCode : %@", placemark.ISOcountryCode);
	//                           NSLog(@"country : %@", placemark.country);
	//                           NSLog(@"inlandWater : %@", placemark.inlandWater);
	//                           NSLog(@"ocean : %@", placemark.ocean);
	//                           NSLog(@"areasOfInterest : %@", placemark.areasOfInterest);
      }
    }];
}

// 測位失敗時や、5位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
  NSLog(@"didFailWithError");
}

- (void)dealloc {
  [locationManager release];
  [super dealloc];
}


/*********************************************緯度経度からだいたいの場所を推測する*********************************************/

- (void)viewDidUnload
{
  [super viewDidUnload];
  [self mainConnect];
    
  // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



/*********************************************ここから通信開始*********************************************/


// レスポンスを受け取った時点で呼び出される。データ受信よりも前なので注意
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
  NSLog(@"didReceiveResponse");
}

// データを受け取る度に呼び出される
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
  NSLog(@"didReceiveData");
}

// データを全て受け取ると呼び出される
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
  NSLog(@"connectionDidFinishLoading");
}



- (int)mainConnect
{
  NSURL *theURL = [NSURL URLWithString:@"http://www.yahoo.co.jp/"];
  NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    NSURLConnection *theConnection=[[NSURLConnection alloc]
				     initWithRequest:theRequest delegate:self];
    if (theConnection) {
      NSLog(@"start loading");
      //        receivedData = [[NSMutableData data] retain];
    }
    // ここまで追加
    
    //    [self.window makeKeyAndVisible];
    return YES;
}


// ---------------


// NSDATAとNSURL
// バイナリに変換
// 


// ---------------




// 通信のメイン処理
//- (int)mainOfConnect
//{
//    id pool = [[NSAutoreleasePool alloc] init];
//    
//    NSLog(@"main");
//    
//    NSURLRequest *req;
//    
//    // URLやtimeoutIntervalを必要に応じて変更して下さい
//    req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.example.com/"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
//    
//    // エラーなのでとりあえずコメントアウト
//    // 呼び出しを受け取るためのオブジェクトを生成
////    *self = [[ViewController alloc] init];
//    
//    // myUrlConnDelegateへdelegateしながら初期化
//    NSURLConnection *conn;
//    conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
//    
//    if (conn) {
//        NSLog(@"main : NSURLConnection create success");
//    } else {
//        NSLog(@"main : conn is nil");
//        return 1;
//    }
//    
//    // 実際の動作はNSRunLoopで行われます
//    NSLog(@"main : Before NSRunLoop");
//    [[NSRunLoop currentRunLoop] run];
//    
//    // このサンプルコードはここへ到達しません
//    
//    [pool release];
//}

@end
