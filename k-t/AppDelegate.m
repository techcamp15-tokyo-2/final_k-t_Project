//
//  AppDelegate.m
//  test
//
//  Created by 夛屋 早百合 on 2013/09/06.
//  Copyright (c) 2013年 夛屋 早百合. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//コピペ①始まり
    // ここから追加
    NSURL *theURL = [NSURL URLWithString:@"http://a1.zeroprm.com/b30_c9/json2.php"];
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    NSURLConnection *theConnection=[[NSURLConnection alloc]
                                    initWithRequest:theRequest delegate:self];
    if (theConnection) {
        NSLog(@"start loading");
        //receivedData = [[NSMutableData data] retain];
        receivedData = [NSMutableData data];
    }
    // ここまで追加
    
    [self.window makeKeyAndVisible];
//コピペ ①終わり
    
    
    
    // Override point for customization after application launch.
    return YES;
}



//コピペ②始まり

- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"receive response");
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{



    NSLog(@"receive data");
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    //[connection release];
    //[receivedData release];
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    NSLog(@"%@", [[NSString alloc]initWithData:receivedData
                                      encoding:NSUTF8StringEncoding]);
    
    
    //コピペ③始まり
    NSArray *array = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingAllowFragments error:nil];
    for (int i=0; i<[array count]; i++) {
        NSDictionary *jsonParser = [array objectAtIndex:i];        //resultを取得
        NSString* result1 = [jsonParser objectForKey:@"id"];
        NSString* result2 = [jsonParser objectForKey:@"receive_name"];
        NSString* result3 = [jsonParser objectForKey:@"send_name"];
        NSString* result4 = [jsonParser objectForKey:@"start_date"];
        NSString* result5 = [jsonParser objectForKey:@"end_date"];
        NSString* result6 = [jsonParser objectForKey:@"place"];
        NSString* result7 = [jsonParser objectForKey:@"message"];
        NSLog(@"id : %@", result1);
        NSLog(@"id : %@", result2);
        NSLog(@"id : %@", result3);
        NSLog(@"id : %@", result4);
        NSLog(@"id : %@", result5);
        NSLog(@"id : %@", result6);
        NSLog(@"id : %@", result7);
        
        
    }
    
    //コピペ③終わり
    //[connection release];
    //[receivedData release];
}
//コピペ②終わり




							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
