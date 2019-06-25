//
//  UDHNetworkURLRequestSerialization.m
//  UDHNetworking
//
//  Created by hcy on 2019/6/24.
//  Copyright © 2019 yd. All rights reserved.
//

#import "UDHNetworkURLRequestSerialization.h"
#import <AFNetworking/AFURLRequestSerialization.h>
#pragma clang diagnostic ignored "-Wincomplete-implementation"
#pragma clang diagnostic ignored "-Wobjc-property-implementation"
#pragma clang diagnostic ignored "-Wprotocol"

@interface UDHNetworkURLRequestSerialization()
@property(strong,nonatomic)AFHTTPRequestSerializer *af_requestSerializer;
@end
@implementation UDHNetworkURLRequestSerialization

+(BOOL)resolveClassMethod:(SEL)sel{
    return [AFHTTPRequestSerializer resolveClassMethod:sel];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.af_requestSerializer=[AFHTTPRequestSerializer new];
    }
    return self;
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    return self.af_requestSerializer;
}

@end

@implementation UDHNetworkJSONRequestSerializer
+(BOOL)resolveClassMethod:(SEL)sel{
    return [AFJSONRequestSerializer resolveClassMethod:sel];
}
+(instancetype)serializerWithWritingOptions:(NSJSONWritingOptions)writingOptions{
    AFJSONRequestSerializer *json=[AFJSONRequestSerializer serializerWithWritingOptions:writingOptions];
    UDHNetworkJSONRequestSerializer *ser=[UDHNetworkJSONRequestSerializer new];
    ser.af_requestSerializer=json;
    return ser;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.af_requestSerializer=[AFJSONRequestSerializer new];
    }
    return self;
}

@end

@implementation UDHNetworkPropertyListRequestSerializer

+(instancetype)serializerWithFormat:(NSPropertyListFormat)format writeOptions:(NSPropertyListWriteOptions)writeOptions{
    AFPropertyListRequestSerializer *pl=[AFPropertyListRequestSerializer serializerWithFormat:format writeOptions:writeOptions];
    UDHNetworkPropertyListRequestSerializer *udhpl=[UDHNetworkPropertyListRequestSerializer new];
    udhpl.af_requestSerializer=pl;
    return udhpl;
}

@end


