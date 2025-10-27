//  by：十三哥 经过几天不断的努力终于将此源码完善。QQ350722326
//官网 https://iosgods.cn
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface wyURLProtocol : NSURLProtocol<NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) NSURLSessionDataTask *task;
@end

NS_ASSUME_NONNULL_END
