//
//  WMNetworking.m
//  WeatherMe
//
//  Created by Bibhut Bikram Thakuri on 21/2/2021.
//

#import <Foundation/Foundation.h>
#import "WMNetworking.h"
#import "AFNetworking.h"
#import "WebserviceConstants.h"
#import "Constants.h"

@implementation WMNetworking

// Get singleton instance of this class.
+ (WMNetworking *)sharedManager
{
    static dispatch_once_t once;
    static WMNetworking * sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void) GetRequest:(NSString *) stringURL andParameter:(NSDictionary *) parameter withCompletionBlock:(completionHandler)responseHandler{
   
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer = serializer;
    
    [manager GET:stringURL parameters:parameter headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSNumber *code = [responseObject objectForKey:@"cod"];
        if ([code isEqualToNumber:@200 ]){
            responseHandler(YES,responseObject);
        } else {
            NSLog(@"%@",responseObject);
            responseHandler(NO,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //failure response data converted to dictionary format in order to manage response handler.
        NSData *data= error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        NSString *failureResponse = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSData *responseData = [failureResponse dataUsingEncoding:NSUTF8StringEncoding];
        id failure = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
        responseHandler(NO,failure);
    }];
}



@end
