//
//  UDHNetworkHttpSessionManager.m
//  UDHNetworking
//
//  Created by hcy on 2019/6/24.
//  Copyright © 2019 yd. All rights reserved.
//

#import "UDHNetworkHttpSessionManager.h"
#import <AFNetworking.h>
@interface UDHNetworkHttpSessionManager()
@property(strong,nonatomic)AFHTTPSessionManager *af_sessionManager;

@end
@implementation UDHNetworkHttpSessionManager
- (instancetype)init
{
    return [self initWithSessionConfiguration:nil];
}
-(instancetype)initWithSessionConfiguration:(NSURLSessionConfiguration *)configuration{
    if (self=[super init]) {
        self.af_sessionManager=[[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    }
    return self;
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    return self.af_sessionManager;
}
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.af_sessionManager methodSignatureForSelector:aSelector];
}
@end
