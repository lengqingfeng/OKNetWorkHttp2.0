//
//  OKNetWorkHttpSessionManager.m
//  OKNetWorkHttpDemo
//
//  Created by lengshengren on 16/4/10.
//  Copyright © 2016年 Lengshengren. All rights reserved.
//

#import "OKNetWorkHttpSessionManager.h"
#import "OKNetWorkHttpConfigure.h"

@interface OKNetWorkHttpSessionManager()
{
    OKNetWorkHttpConfigure *_config;
}
@end
@implementation OKNetWorkHttpSessionManager

+ (instancetype)sharedInstance {
    static OKNetWorkHttpSessionManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedInstance = [[OKNetWorkHttpSessionManager alloc] initWithBaseURL:[NSURL URLWithString:[OKNetWorkHttpConfigure sharedConfig].baseUrl]];
        
        _sharedInstance.securityPolicy = [OKNetWorkHttpConfigure sharedConfig].securityPolicy;

        NSDictionary *headValueDictionary = [OKNetWorkHttpConfigure sharedConfig].httpHeadDictionary;
        if (headValueDictionary.count > 0 && headValueDictionary != nil) {
            for (NSString  *headerField in  headValueDictionary) {
                  [_sharedInstance.requestSerializer setValue:[headValueDictionary objectForKey:headerField] forHTTPHeaderField:headerField];
            }

        }
    
    });
    
    return _sharedInstance;
}


@end
