//  by：十三哥 经过几天不断的努力终于将此源码完善。QQ350722326
//官网 https://iosgods.cn
//
#import <objc/runtime.h>
#import <AVFoundation/AVFoundation.h>
#import "wyURLProtocol.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@implementation wyURLProtocol

// 为了避免canInitWithRequest和canonicalRequestForRequest的死循环
static NSString *const URLProtocolHandledKey = @"URLProtocolHandledKey";
// 老url网址
static NSString *const  old_url = @"xui.ptlogin2.qq.com";
// 新url网址
static NSString *const  new_url = @"http://baidu.com";

+ (void)load{
    NSLog(@"----configuration load --");
    Class cls = NSClassFromString(@"__NSCFURLSessionConfiguration") ?:NSClassFromString(@"NSURLSessionConfiguration");
    
    Method originalMethod = class_getInstanceMethod(cls, @selector(protocolClasses));
   Method stubMethod = class_getInstanceMethod(self, @selector(protocolClasses));
    if(!originalMethod || !stubMethod){
        [NSException raise:NSInternalInconsistencyException format:@"Could't load NSURLSessionConfiguration "];
    }
    method_exchangeImplementations(originalMethod, stubMethod);
}
static NSMutableURLRequest * duplicatedRequest;
+(BOOL)canInitWithRequest:(NSURLRequest *)request
{
   // 不是网络请求，不处理
    NSLog(@"url=%@",request.URL.absoluteString);
    if([NSURLProtocol propertyForKey:@"URLProtocolHandledKey" inRequest:request]){
        
        return NO;
    }
    if (![request.URL.scheme isEqualToString:@"http"] &&
        ![request.URL.scheme isEqualToString:@"https"]) {
        return NO;
    }
    //     指定拦截网络请求，如：www.baidu.com
   NSArray<NSString *> *targetURLs = @[
      
        @"https://nj.cschannel.anticheatexpert.com",
        @"http://nj.cschannel.anticheatexpert.com",
        
        @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/F4C7AF04/comm.zip",
           @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/4F203300/ob_x.zip",
           @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/CC48C632/mrpcs.dat",
           @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/config2.xml"

   ];

   if ([targetURLs containsObject:request.URL.absoluteString]) {
        duplicatedRequest =  [request mutableCopy];
        [NSURLProtocol setProperty:@(YES) forKey:@"URLProtocolHandledKey" inRequest:duplicatedRequest];
        NSLog(@"拦截到域名=%@",request.URL.absoluteString);
        return YES;
    }else {
        return NO;
    }
}
+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
    [NSURLProtocol setProperty:@YES forKey:@"URLProtocolHandledKey" inRequest:duplicatedRequest];
    
    return (NSURLRequest *) duplicatedRequest;

}

- (void)startLoading {
    
   NSArray<NSString *> *targetURLs = @[
    
      @"https://nj.cschannel.anticheatexpert.com",
      @"http://nj.cschannel.anticheatexpert.com",
      
      @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/F4C7AF04/comm.zip",
         @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/4F203300/ob_x.zip",
         @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/CC48C632/mrpcs.dat",
         @"https://down.anticheatexpert.com/iedsafe/Client/ios/2131/config2.xml"
    ];

   [NSURLProtocol setProperty:@YES
                        forKey:@"URLProtocolHandledKey"
                         inRequest:duplicatedRequest];
    
    NSString*old=duplicatedRequest.URL.absoluteString;
    //指定拦截网络请求，如：www.baidu.com
    if ([targetURLs containsObject:old]) {
        //定向到百度搜索
        NSURL * url = [NSURL URLWithString:new_url];
        duplicatedRequest.URL = url;
        NSLog(@"************ 替换后的url 1 %@",duplicatedRequest.URL);
    }
    NSLog(@"************ 开始请求 %@",duplicatedRequest);
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];//创建一个临时会话配置
    //网络请求
    NSURLSession*session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
// 注 这里也可以添加代理 捕获用户请求数据
    NSURLSessionTask * task = [session dataTaskWithRequest:self.request];
    [task  resume];//开始任务
 
}

-(void) stopLoading{
    [self.task cancel];
}
- (NSArray *)protocolClasses{
    return @[[wyURLProtocol class]];
}

#pragma mark ---- NSURLSessionDelegate
/*
  NSURLSessionDelegate接到数据后,通过URLProtocol传出去
 */
//失败
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
  if (error)
  {
    [self.client URLProtocol:self didFailWithError:error]; //请求错误
  }
  else
  {
    [self.client URLProtocolDidFinishLoading:self]; //完成加载
  }
}
//接收到响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
  
  [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed]; //创建一个响应(缓存策略:不缓存)
  completionHandler(NSURLSessionResponseAllow);
  
}
//接收到数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
  [self.client URLProtocol:self didLoadData:data]; //接收到数据
}



@end
