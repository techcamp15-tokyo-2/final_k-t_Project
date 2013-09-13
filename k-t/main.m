//
//  main.m
//  json
//
//  Created by 夛屋 早百合 on 2013/09/06.
//  Copyright (c) 2013年 夛屋 早百合. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    

  @autoreleasepool {
        
    //ここからコピペ
        
    - (BOOL)application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
      {
	// ここから追加
	NSURL *theURL = [NSURL URLWithString:@"http://www.yahoo.co.jp/"];
	NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
            NSURLConnection *theConnection=[[NSURLConnection alloc]
					     initWithRequest:theRequest delegate:self];
            if (theConnection) {
	      NSLog(@"start loading");
	      receivedData = [[NSMutableData data] retain];
            }
            // ここまで追加
            
            [self.window makeKeyAndVisible];
            return YES;
      }
        
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
    [connection release];
    [receivedData release];
    NSLog(@"Connection failed! Error - %@ %@",
	  [error localizedDescription],
	  [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
  }
        
    - (void)connectionDidFinishLoading:(NSURLConnection *)connection
  {
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    NSLog(@"%@", [[NSString alloc]initWithData:receivedData
				  encoding:NSUTF8StringEncoding]);
    [connection release];
    [receivedData release];
  }
        
    //ここまでコピペ
        
        
    // insert code here...
    NSLog(@"Hello, World!");
    NSLog(@"");
        
  }
  return 0;
}



