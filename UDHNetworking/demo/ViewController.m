//
//  ViewController.m
//  demo
//
//  Created by hcy on 2019/6/24.
//  Copyright © 2019 yd. All rights reserved.
//

#import "ViewController.h"
#import <UDHNetworking/UDHNetworking.h>
@interface ViewController ()
@property(strong,nonatomic)UDHNetworkHttpSessionManager *sessionManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sessionManager=[UDHNetworkHttpSessionManager new];
   NSURLSessionDataTask *task= [self.sessionManager dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]] completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
       NSLog(@"resp:%@,obj:%@,error:%@",response,responseObject,error);
    }];
    [task resume];
  
    // Do any additional setup after loading the view.
}


@end
