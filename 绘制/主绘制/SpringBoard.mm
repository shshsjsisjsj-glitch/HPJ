#import "Base64.h"
#import "HUDRootViewController.h"
#import "MGPGLabel.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "PUBGDataModel.h"
#import "SpringBoard.h"
#import "string.h"
#import "InfoView.h"
#include <stdio.h>
#include <string>
#import "image_base64.h"
#include <mach/mach.h>
#include <sys/sysctl.h>
#import "utf.h"
#import "JJJ.h"
#import "ZXZY.h"
#import "tttt.h"
#import "TFJGVGLGKFTVCSV.h"
#import <dlfcn.h>
#import <mach-o/dyld.h>

#import "VMTool.h"
#import "tttt.h"
#import <sys/mman.h>

#define CurrentViewSize self.view.frame.size
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale
#define kuandu  [UIScreen mainScreen].bounds.size.width
#define gaodu [UIScreen mainScreen].bounds.size.height
#pragma mark - 内存读写====================================
/*extern "C" kern_return_t mach_vm_region_recurse(
vm_map_t                 map,
mach_vm_address_t        *address,
mach_vm_size_t           *size,
uint32_t                 *depth,
vm_region_recurse_info_t info,
mach_msg_type_number_t   *infoCnt);
extern kern_return_t
mach_vm_region(
               vm_map_t                 map,
               mach_vm_offset_t         *address,
               mach_vm_size_t           *size,
               vm_region_flavor_t       flavor,
               vm_region_info_t         info,
               mach_msg_type_number_t   *count,
               mach_port_t              *object_name);

extern "C" kern_return_t mach_vm_protect
(
 vm_map_t target_task,
 mach_vm_address_t address,
 mach_vm_size_t size,
 boolean_t set_maximum,
 vm_prot_t new_protection
 );

mach_port_t task;
static BOOL JCJC;
static int get_processes_pid() {
    static int PID;
    size_t length = 0;
    static const int name[] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    int err = sysctl((int *)name, (sizeof(name) / sizeof(*name)) - 1, NULL, &length, NULL, 0);
    if (err == -1) err = errno;
    if (err == 0) {
        struct kinfo_proc *procBuffer = (struct kinfo_proc *)malloc(length);
        if(procBuffer == NULL) return -1;
        sysctl((int *)name, (sizeof(name) / sizeof(*name)) - 1, procBuffer, &length, NULL, 0);
        int count = (int)length / sizeof(struct kinfo_proc);
        for (int i = 0; i < count; ++i) {
            const char *procname = procBuffer[i].kp_proc.p_comm;
            NSString *进程名字=[NSString stringWithFormat:@"%s",procname];
            pid_t pid = procBuffer[i].kp_proc.p_pid;
          
            //自己写判断进程名 和平精英
            if([进程名字 containsString:@"ShadowTrackerExt"])
            {
             

                kern_return_t kret = task_for_pid(mach_task_self(), pid, &task);
                if (kret == KERN_SUCCESS) {
                    PID = pid;
                }
            }
            
        }
        
        
    }
    
    return  PID;
}
static bool 地址泄露(uintptr_t address) {
    return address && address > 0x100000000 && address < 0x160000000;
}

static long MOD;
static BOOL get_base_address() {
   kern_return_t krc = KERN_SUCCESS;

   vm_map_offset_t vmoffset = 0;
    vm_map_size_t vmsize = 0;
    uint32_t nesting_depth = 0;
    struct vm_region_submap_info_64 vbr;
    mach_msg_type_number_t vbrcount = 16;
    pid_t pid =get_processes_pid();;
    kern_return_t kret = task_for_pid(mach_task_self(), pid, &task);
    if (kret == KERN_SUCCESS) {
        krc=mach_vm_region_recurse(task, &vmoffset, &vmsize, &nesting_depth, (vm_region_recurse_info_t)&vbr, &vbrcount);
        MOD= vmoffset;
       if (krc == KERN_INVALID_ADDRESS) return 0;
        return YES;
    }
   
    return NO;
}

static bool Read(long address, void *buffer, int length)
{
   if (!地址泄露(address)) return false;

   vm_size_t size = 0;
    
    kern_return_t error = vm_read_overwrite(task, (vm_address_t)address, length, (vm_address_t)buffer, &size);
 
   if(error != KERN_SUCCESS || size != length) {
        return false;
    }
    return true;
}


template<typename T> T 读取数据(long address) {
    T data;
  
 // vm_protect(task, (vm_address_t) address, sizeof(T), NO, VM_PROT_READ | VM_PROT_WRITE | VM_PROT_COPY);
  //    vm_protect(task, (vm_address_t)address, sizeof(T), NO, VM_PROT_READ | VM_PROT_EXECUTE);
  

   Read(address, reinterpret_cast<void *>(&data), sizeof(T));
    return data;
}*/
//MSDuQu
static mach_port_t get_task;
static pid_t Processpid;
static long MOD;
extern "C" kern_return_t mach_vm_region_recurse(
                                                vm_map_t                 map,
                                                mach_vm_address_t        *address,
                                                mach_vm_size_t           *size,
                                                uint32_t                 *depth,
                                                vm_region_recurse_info_t info,
                                                mach_msg_type_number_t   *infoCnt);

static pid_t MsdnGetGameProcesspid(char* GameProcessName) {
    size_t length = 0;
    static const int name[] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    int err = sysctl((int *)name, (sizeof(name) / sizeof(*name)) - 1, NULL, &length, NULL, 0);
    if (err == -1) err = errno;
    if (err == 0) {
        struct kinfo_proc *procBuffer = (struct kinfo_proc *)malloc(length);
        if(procBuffer == NULL) return -1;
        sysctl((int *)name, (sizeof(name) / sizeof(*name)) - 1, procBuffer, &length, NULL, 0);
        int count = (int)length / sizeof(struct kinfo_proc);
        for (int i = 0; i < count; ++i) {
            const char *procname = procBuffer[i].kp_proc.p_comm;
            Processpid = procBuffer[i].kp_proc.p_pid;
            if(strstr(procname,GameProcessName)){
                return Processpid;
            }
        }
    }
    return  -1;
}

static vm_map_offset_t MsdnGetGameModule_Base(char* GameProcessName) {
    vm_map_offset_t vmoffset = 0;
    vm_map_size_t vmsize = 0;
    uint32_t nesting_depth = 0;
    struct vm_region_submap_info_64 vbr;
    mach_msg_type_number_t vbrcount = 16;
    pid_t pid = MsdnGetGameProcesspid(GameProcessName);
    kern_return_t kret = task_for_pid(mach_task_self(), pid, &get_task);
    if (kret == KERN_SUCCESS) {
        mach_vm_region_recurse(get_task, &vmoffset, &vmsize, &nesting_depth, (vm_region_recurse_info_t)&vbr, &vbrcount);
    }
   MOD=vmoffset;
    return vmoffset;
}

static bool Read(long ptr, void *buffer, int length){
    if(ptr <= 0 || ptr > 100000000000 || isnan(ptr))return false;
    vm_size_t size = 0;
    kern_return_t error = vm_read_overwrite(get_task, (vm_address_t)ptr, length, (vm_address_t)buffer, &size);
    if(error != KERN_SUCCESS || size != length) {
        return false;
    }
    return true;
}
template<typename T> T 读取数据(long address) {
    T data;
    Read(address, reinterpret_cast<void *>(&data), sizeof(T));
    return data;
}


@interface ReadMV()
@property (nonatomic,strong) NSMutableArray * baseDict;
@property (strong, nonatomic) NSMutableDictionary*配置;
@property (strong, nonatomic) NSString*路径;
@property (nonatomic,  strong) NSArray *infoArray;
@property (nonatomic,  strong) NSArray *wuziArray;
@property (nonatomic,  assign) FVector2D canvas;
@property (nonatomic,  strong) NSMutableArray *labels;

@property (nonatomic,  strong) NSMutableDictionary *imageInfo;
@property (nonatomic,  strong) NSMutableArray *wuziViews;



@end
static CAShapeLayer * zhuizongquan[100];
NSNumber *mode;
NSNumber *mode1;
NSNumber *mode2;
NSNumber *mode3;
NSNumber *mode4;
NSNumber *mode5;
NSNumber *mode6;
NSNumber *mode7;


static NSString *掩体识别;
static NSString*物资数据;
static CAShapeLayer * yq[100];
static NSString *自瞄开关;


static NSString *追踪开关;
static CAShapeLayer * shexian[100];
static CAShapeLayer * guge[100];
static CAShapeLayer * xuetiao[100];
static CAShapeLayer * zhuizongxian[100];

static CAShapeLayer * xtbk[100];

static float drx,dry,drz;
static float zjx,zjy,zjz;
static UIWindow*window;
static ReadMV*view;
FVector3D worldlocation;
static MGPGLabel *fujin;
static UILabel *名字[100];
static UILabel *距离[100];
static UILabel *血量[100];
static UILabel *队标[100];
VV3 fkzb1;
VV3 zb;
float dx;
float toux;
float touy;
NSMutableArray *infoArray;
float shexianweizhi;
float dy;
float originX;
float originY;
CGRect rect;
float width;
float height;
矩阵 tempMatrix;
int Radius2;
static InfoView *infoView[100];
矩阵 tempMatrixa;
static UILabel *手持武器[100];
static BOOL 物资开关;
VV3 头部;
float Radius;
static NSMutableArray *ArrData;
static NSTimer *绘制定时器;
static NSTimer *读取GW定时器;
static NSTimer *读取base定时器;
static NSTimer *读取配置定时器;
static BOOL 绘制开关;
static TFJGVGLGKFTVCSV*GGB;
float juli;

static float 绘制频率;
static NSString*UDID;
int bvisible;
最小视图信息 POV;
最小视图信息 POVa;
//队伍不同颜色
UIBezierPath* Path_Line_绿色;
UIBezierPath* Path_Line_绿色填充;
CAShapeLayer* Draw_Line_绿色;

static CATextLayer *mingzi[100];
static UIColor * randomColor[100];
//=========图片手持=======//
NSString *name;
NSURL *url;
static UIImageView *imageView[100];
NSData *sb ;
NSString *ji;
int 自瞄位置=6;
NSMutableDictionary *userDefaults;
@implementation ReadMV

+ (void)load
{
   
 
      绘制频率=1.0/90;
      view =[[ReadMV alloc] init];
      [view 定时器];
      
  
}
#pragma mark 定时器===================================


-(void)定时器
{
   
   // 人物骨骼
   userDefaults = [[NSDictionary dictionaryWithContentsOfFile:USER_DEFAULTS_PATH] mutableCopy] ?: [NSMutableDictionary dictionary];
   mode = [userDefaults objectForKey: @"DrawLine"];
   mode1 = [userDefaults objectForKey: @"DrawBone"];
   mode2 = [userDefaults objectForKey: @"DrawInfo"];
   mode3 = [userDefaults objectForKey: @"DrawChiQiang"];
   mode4 = [userDefaults objectForKey: @"DrawBack"];
   mode5 = [userDefaults objectForKey: @"HideESP"];
   mode6 = [userDefaults objectForKey: @"NoRecoil"];
   mode7 = [userDefaults objectForKey: @"JuDian"];

 
      
          
   NSLog(@"和平 游戏进程加载成功");
   //内存修改例子

    //绘制定时器
    绘制定时器 = [NSTimer scheduledTimerWithTimeInterval:绘制频率 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self 清除];
    
       
     
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [view 读取和绘制];
        });
        
    }];
    [[NSRunLoop currentRunLoop] addTimer:绘制定时器 forMode:NSRunLoopCommonModes];
    
  
       读取GW定时器 = [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
           dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
              MsdnGetGameModule_Base((char*)"ShadowTrackerExt");
               
           });
           
       }];
       [[NSRunLoop currentRunLoop] addTimer:读取GW定时器 forMode:NSRunLoopCommonModes];
       


    
    //1
    读取base定时器 = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [view getbaseDict];
        });
        
    }];
    //3
    [[NSRunLoop currentRunLoop] addTimer:读取base定时器 forMode:NSRunLoopCommonModes];
    
    读取配置定时器 = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
  
        
      //  view.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
        view.backgroundColor=[UIColor colorWithRed:0 green:1 blue:0 alpha:0];
        view.center = CGPointMake(gaodu/2, kuandu/2);
        view.frame=CGRectMake(0, 0, gaodu, kuandu);
      
      // NSLog(@"打印 开关数据->过直播 %@",[mode5 stringValue]);
 
      
          if ([mode5 boolValue]) {
             [GGB addSubview:view];
             [[HUDRootViewController ESPViewa] addSubview:GGB];
          }else {
             [[HUDRootViewController ESPViewa] addSubview:view];
          }
       
        
    }];
    [[NSRunLoop currentRunLoop] addTimer:读取配置定时器 forMode:NSRunLoopCommonModes];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
        self = [super initWithFrame:frame];
        if (self) {
            self.frame=[UIScreen mainScreen].bounds;
            self.userInteractionEnabled = NO;
            for (NSInteger i = 0; i < 100; i++) {
                randomColor[i]= [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:0.75];
                shexian[i] = [CAShapeLayer layer];
                [self.layer addSublayer:shexian[i]];
                     
                
                zhuizongxian[i] = [CAShapeLayer layer];
                [self.layer addSublayer:zhuizongxian[i]];
               
                
                
                yq[i] = [CAShapeLayer layer];
                           
                           
                           [self.layer addSublayer:yq[i]];
              
                xtbk[i] = [CAShapeLayer layer];
                               [self.layer addSublayer:xtbk[i]];
                infoView[i] = [[InfoView alloc] init];
                infoView[i].hidden = YES;
                [self addSubview:infoView[i]];
               // 绘制轨迹
               
                                   
               guge[i] = [CAShapeLayer layer];
         
               [self.layer addSublayer:guge[i]];
                xuetiao[i] = [CAShapeLayer layer];
                [self.layer addSublayer:xuetiao[i]];
                [self addSubview:fujin];
                队标[i] = [[UILabel alloc] init];
                [self addSubview:队标[i]];
                名字[i] = [[UILabel alloc] init];
                [self addSubview:名字[i]];
                距离[i] = [[UILabel alloc] init];
                [self addSubview:距离[i]];
                    血量[i] = [[UILabel alloc] init];
                            [self addSubview:血量[i]];
                
                imageView[i]=[[UIImageView alloc]init];
                [self addSubview:imageView[i]];
//                      imageView.image=[UIImage imageNamed:sb];
//                      imageView.center=(CGPoint){xd,yd};
//                      [self insertSubview:imageView atIndex:0];
                
               Path_Line_绿色 = [[UIBezierPath alloc] init];
             
               Path_Line_绿色填充 = [[UIBezierPath alloc] init];
               
               
                手持武器[i]=[[UILabel alloc] init];
                [self addSubview:手持武器[i]];
            }
            
          //  fujin = [[UILabel alloc] init];
            fujin =[[MGPGLabel alloc]init];
            
            fujin.backgroundColor=[UIColor clearColor];
            fujin.font = [UIFont systemFontOfSize:30];
            fujin.textColor=[UIColor redColor];
        
          
            
            [self addSubview:fujin];
            GGB=[[TFJGVGLGKFTVCSV alloc] init];
            GGB.userInteractionEnabled = YES;
            
            
        }
        return self;
}

#pragma mark 读取字典===================================


-(void)getbaseDict
{
    @autoreleasepool {
       
        self.baseDict=NULL;
        self.baseDict = @[].mutableCopy;
  
        
        
    //PUBG 0x8FCED60+0x10 和平 0xB5F2CA8
       auto GWorld = 读取数据<long>(MOD+0xB8C3358);

       NSLog(@"和平数据 GWorld %ld",GWorld);
       NSLog(@"和平数据 主程序 %ld",MOD);
       
       auto ULevel = 读取数据<long>(GWorld + 0x90);
        auto ActorArray = 读取数据<long>(ULevel + 0xA0);
        auto ActorCount = 读取数据<int>(ULevel + 0xA8);
        for (int i = 0; i < ActorCount; i++) {
 
            long base = 读取数据<long>(ActorArray + i * 8);

                [self.baseDict addObject:@(base)];
            
        }
    }
}
#pragma mark 读取数据===================================


void DrawLine(VVV2 startPoint, VVV2 endPoint, UIBezierPath *path) {
    [path moveToPoint:CGPointMake(startPoint.X, startPoint.Y)];
    [path addLineToPoint:CGPointMake(endPoint.X, endPoint.Y)];
}

static int 自己队标;
- (void)读取和绘制
{
   if(MOD==0){
      
      [self 附近人数:@"数据获取失败"];
   }

   if(self.baseDict==NULL || self.baseDict.count==0){
      NSLog(@"和平数据 baseDict获取失败");
      
     
 
        return;
    }
    int AI数量=0;
    int 真人数量=0;
 
    long count=self.baseDict.count;
    if (count>100) {
        count=100;
    }
  
    for (int i = 0; i < count; i++) {
        @autoreleasepool {
            long base=[self.baseDict[i] longLongValue];
            
       
            
          //排除死亡
            int bDead = 读取数据<int>(base+0xE40);
            if (bDead != 2) continue;
           
            float 血量 = 读取数据<float>(base + 0xDD8);
            int 人机 = 读取数据<int>(base + 0xA8C);
           auto GWorld = 读取数据<long>(MOD+0xB8C3358);
           
            auto NetDriver = 读取数据<long>(GWorld + 0x98);
            auto ServerConnection = 读取数据<long>(NetDriver + 0x88);
          long localPlayerController = 读取数据<long>(ServerConnection + 0x30);
            long playerCameraManager = 读取数据<long>(localPlayerController + 0x5D0);
     
            int duibiao = 读取数据<int>(base+0xA70);
         if (duibiao == -1) continue;
            
            long mySelf = 读取数据<long>(localPlayerController + 0x548);
            
        /*    long weaponManagerComponent = 读取数据<long>(mySelf + 0x29D0);
            long cachedCurUseWeapon  = 读取数据<long>(weaponManagerComponent + 0x308);
            long shootWeaponComponent = 读取数据<long>(cachedCurUseWeapon + 0x1098);
            long ownerShootWeapon = 读取数据<long>(shootWeaponComponent + 0x290);
            long shootWeaponEntityComp = 读取数据<long>(ownerShootWeapon + 0x12E0);*/
            
         
          int myTeam =  读取数据<int>(mySelf+0xA70);
            //排除自己
            if (mySelf == base){
              continue;
            }
            //排除队友
            if (duibiao == myTeam)continue;
            
       
         
                真人数量++;
      
            
           POV = 读取数据<最小视图信息>(playerCameraManager + 0x1130 + 0x10);
           POV.FOV = 读取数据<float>(playerCameraManager + 0x1130 + 0x10 +0x30);
           //骨骼
         
            
            
          
            if ([mode1 boolValue]) {
               
               auto mesh = 读取数据<long>(base + 0x5C8);
               FTransform meshTrans = [self getMatrixConversion:mesh+0x1A0];
         
              int Bone[18] = {6,5,4,3,2,1,12,13,14,33,34,35,53,54,55,57,58,59};
              int Bone1[18] = {6,5,4,3,2,1,12,13,14,34,35,53,56,57,58,60,61,62};
             int playmax=读取数据<int>(mesh+0x5c8+0x8);
              
              VVV2 Bones_Pos[18];
              VV3 Hitpart[18];

              VVV2 打击点屏幕坐标;
              for (int i = 0; i < 18; i++) {
                  int bones= (playmax == 65)?Bone[i]:Bone1[i];
                 VV3 pos =[self getBoneWithRotation:mesh ID:bones publicObj:meshTrans];
               
                  Hitpart[i] = pos;
               
                  Bones_Pos[i] = 世界坐标转屏幕坐标(pos);
                
                 
              }

           
              toux=Bones_Pos[0].X;
              touy= Bones_Pos[0].Y;
               
            height = Bones_Pos[0].Y - Bones_Pos[0].Y;
                       width  = height / 2;
                         
                         originX = Bones_Pos[0].X;
                         originY = Bones_Pos[0].Y;
               //骨骼
                          
                      
               
               UIBezierPath *ggPath = [UIBezierPath bezierPath];
               
          
               
        
               DrawLine(VVV2(Bones_Pos[1].X, Bones_Pos[1].Y), VVV2(Bones_Pos[2].X, Bones_Pos[2].Y), ggPath);
               
               DrawLine(VVV2(Bones_Pos[2].X, Bones_Pos[2].Y), VVV2(Bones_Pos[3].X, Bones_Pos[3].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[3].X, Bones_Pos[3].Y), VVV2(Bones_Pos[4].X, Bones_Pos[4].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[4].X, Bones_Pos[4].Y), VVV2(Bones_Pos[5].X, Bones_Pos[5].Y), ggPath);
               
               DrawLine(VVV2(Bones_Pos[2].X, Bones_Pos[2].Y), VVV2(Bones_Pos[6].X, Bones_Pos[6].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[6].X, Bones_Pos[6].Y), VVV2(Bones_Pos[7].X, Bones_Pos[7].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[7].X, Bones_Pos[7].Y), VVV2(Bones_Pos[8].X, Bones_Pos[8].Y), ggPath);
               
               DrawLine(VVV2(Bones_Pos[2].X, Bones_Pos[2].Y), VVV2(Bones_Pos[9].X, Bones_Pos[9].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[9].X, Bones_Pos[9].Y), VVV2(Bones_Pos[10].X, Bones_Pos[10].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[10].X, Bones_Pos[10].Y), VVV2(Bones_Pos[11].X, Bones_Pos[11].Y), ggPath);
               
               DrawLine(VVV2(Bones_Pos[5].X, Bones_Pos[5].Y), VVV2(Bones_Pos[12].X, Bones_Pos[12].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[12].X, Bones_Pos[12].Y), VVV2(Bones_Pos[13].X, Bones_Pos[13].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[13].X, Bones_Pos[13].Y), VVV2(Bones_Pos[14].X, Bones_Pos[14].Y), ggPath);
               
               DrawLine(VVV2(Bones_Pos[5].X, Bones_Pos[5].Y), VVV2(Bones_Pos[15].X, Bones_Pos[15].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[15].X, Bones_Pos[15].Y), VVV2(Bones_Pos[16].X, Bones_Pos[16].Y), ggPath);
               DrawLine(VVV2(Bones_Pos[16].X, Bones_Pos[16].Y), VVV2(Bones_Pos[17].X, Bones_Pos[17].Y), ggPath);
               
                   guge[i].fillColor = [UIColor clearColor].CGColor;
                   guge[i].strokeColor = [UIColor colorWithRed:0 green:2 blue:2 alpha:2].CGColor;
               guge[i].strokeStart = 0;
               guge[i].strokeEnd = 1;
               guge[i].zPosition = 1;
               guge[i].lineWidth = 0.4;
               guge[i].path  = ggPath.CGPath;

           
               
            }
            
           
           if ([mode2 boolValue]) {
              rect = CGRectMake(originX, originY, width, height);
              float xd = rect.origin.x+rect.size.width/2;//人物X坐标
              float yd = rect.origin.y;//人物Y坐标
              infoView[i].ai = 人机;
              infoView[i].center = CGPointMake(xd-50, yd-47);
              infoView[i].hidden = NO;
              long 名称指针 = 读取数据<long>(base + 0x9F0);
              UTF8 玩家名字[32] = "";
              UTF16 buf16[16] = {0};
              Read(名称指针, buf16, 28);
              Utf16_To_Utf8(buf16, 玩家名字, 28, strictConversion);
              NSString*MingZhi = [NSString stringWithUTF8String:(const char *)玩家名字];
              if (人机 == 1) {
                 MingZhi=@"Robot";
              }
              infoView[i].name = MingZhi;
              infoView[i].team = duibiao;
              infoView[i].xue = 血量;
              long povAddr =(playerCameraManager + 0x1130 + 0x10);
             
              zjx=读取数据<float>(povAddr);
              zjy=读取数据<float>(povAddr +4);
              zjz=读取数据<float>(povAddr +4+4);
              
              auto rootComponent = 读取数据<long>(base + 0x268);
               drx=读取数据<float>(rootComponent + 0x1b0);
               dry=读取数据<float>(rootComponent + 0x1b0+4);
               drz=读取数据<float>(rootComponent + 0x1b0+4+4);
              
              float distX = (drx - zjx) / 100;
              float distY = (dry - zjy) / 100;
              float distance = (distX * distX) + (distY * distY);
              float distZ = (drz - zjz) / 100;
               juli = sqrt((distZ * distZ) + distance);
             
             
             
                      
              
         infoView[i].dis =juli;
           
      
             [self 距离判断:i 距离:juli ai:人机];
              
              
           }else{
              infoView[i].hidden=YES;
              
           }
        
         
           if ([mode6 boolValue]) {
             
               
          //    [[VMTool alloc] 内存修改:shootWeaponEntityComp+0x1728 value:@"0.0001" type:SearchResultValueTypeFloat g_task:task];
           }
          
                      if ([mode7 boolValue]) {
                       
                 
                          
                          
           //               [[VMTool alloc] 内存修改:shootWeaponEntityComp+0x178c value:@"0.0001" type:SearchResultValueTypeFloat g_task:task];
        //                   [[VMTool alloc] 内存修改:shootWeaponEntityComp+0x1790 value:@"0.0001" type:SearchResultValueTypeFloat g_task:task];
          //                 [[VMTool alloc] 内存修改:shootWeaponEntityComp+0x1794 value:@"0.0001" type:SearchResultValueTypeFloat g_task:task];
                          
                       
                      }
            if ([mode boolValue]) {
                
                CGPoint a=CGPointMake(gaodu/2,0);
                CGPoint b=CGPointMake(toux, touy-shexianweizhi);
                [self 射线:i 起点:a 终点:b ai:人机];
            }

      
        
            if ([mode3 boolValue]) {
                shexianweizhi=110-30-30+15;
              
                            
            
            }else{
               
                shexianweizhi=70-30;
                            
            
            }
             
            if ([mode3 boolValue]) {
             
                @autoreleasepool {
                    //手持
                    long lastUpdateStatusKeyListOffset = 0x2C38;
                    long equipWeaponOffset = 0x20;
                    long weaponOffset = lastUpdateStatusKeyListOffset + equipWeaponOffset;
                    long weaponIDOffset = 0xA90;
                    auto my_weapon = 读取数据<long>(base + weaponOffset);
                    int weaponid = 读取数据<int>(my_weapon + weaponIDOffset);
                  
                   // if (图片手持) {
                                            
                 //       [self 手持武器转换图片:weaponid];
         //    NSData *qwe=[[NSData alloc] initWithBase64EncodedString:ji options:NSDataBase64DecodingIgnoreUnknownCharacters];
         //     CGPoint wzzb=CGPointMake(toux-30,touy-110+30+30-15);
           // [self 手持武器:i 坐标:wzzb Name:qwe];
                //   }
                 
                    
                 
                                            
                        [self 手持武器转换文字:weaponid];
                        NSString*wzzh=[NSString stringWithFormat:@"%@",[self 手持武器转换文字:weaponid]];
                        CGPoint wzzb=CGPointMake(toux-30,touy-110+30+30-15);
                        [self 持枪文字:i 坐标:wzzb Name:wzzh];
                      
          
        
                    
                
                    
                    
                }
            }else{
             
                
            }
        }
    }
 
   if (真人数量!=0 ) {
           
            NSString*str=[NSString stringWithFormat:@"%d",真人数量];
            [self 附近人数:str];
        }else{
            
            fujin.textColor=[UIColor greenColor];
            [self 附近人数:@"0"];
           
         
           
           
        }
    }



- (FRotator)calcAngle:(FVector3D)aimPos
{
    FRotator rot;
    rot.Yaw = ((float)(atan2f(aimPos.Y, aimPos.X)) * (float)(180.f / M_PI));
    rot.Pitch = ((float)(atan2f(aimPos.Z,
                                sqrtf(aimPos.X * aimPos.X +
                                      aimPos.Y * aimPos.Y +
                                      aimPos.Z * aimPos.Z))) * (float)(180.f / M_PI));
    rot.Roll = 0.f;
    return rot;
}





-(void)清除
{
    
    for (int i=0; i<100; i++) {
        shexian[i].path=nil;
        xuetiao[i].path=nil;
          yq[i].path=nil;
          xtbk[i].path=nil;
        ji =@"";
    zhuizongxian[i].path=nil;
//        imageView[i].hidden=YES;
        infoView[i].hidden = YES;
        血量[i].frame=CGRectMake(0, 0, 0, 0);
        guge[i].path=nil;
        队标[i].frame=CGRectMake(0, 0, 0, 0);
        名字[i].frame=CGRectMake(0, 0, 0, 0);
        距离[i].frame=CGRectMake(0, 0, 0, 0);
        手持武器[i].frame=CGRectMake(0, 0, 0, 0);
        imageView[i].center=(CGPoint){0,0};
        fujin.frame=CGRectMake(0, 0, 0, 0);

        imageView[i].frame =CGRectMake(0, 0, 0, 0);
     
       
    
    }
}




//手持武器名字优化
-(NSString*)手持武器转换文字:(int)手持武器id{
    static NSString*wzsr;

    if (手持武器id == 0) {
        wzsr = @"拳头";
    } else if (手持武器id == 101001) {
      
        wzsr = @"AKM";
        
    } else if (手持武器id == 101012) {

        wzsr = @"蜜罐";
    } else if (手持武器id == 101002) {
      
        wzsr = @"M16";
    } else if (手持武器id == 101003) {
       
        wzsr = @"SCAR-L";
    } else if (手持武器id == 101004) {
        wzsr = @"M416";
    } else if (手持武器id == 101005) {
      
        wzsr = @"GROZA";
    } else if (手持武器id == 101006) {
       
        wzsr = @"AUG";
    } else if (手持武器id == 101007) {

        wzsr = @"QBZ";
    } else if (手持武器id == 101008) {
   
        wzsr = @"M762";
    } else if (手持武器id == 101009) {
      
        wzsr = @"Mk47";
    } else if (手持武器id == 101010) {
      
        wzsr = @"G36C";
    } else if (手持武器id == 101011) {
        
  wzsr = @"AC-VAL";
    } else if (手持武器id == 102001) {
        
   
        wzsr = @"UZI";
    } else if (手持武器id == 102003) {
      
        wzsr = @"Vector";
    } else if (手持武器id == 102004) {
       
        wzsr = @"汤姆逊";
    } else if (手持武器id == 102005) {
     
        wzsr = @"野牛";
    } else if (手持武器id == 102007) {
     
        wzsr = @"MP5K";
    } else if (手持武器id == 102105) {
    
        wzsr = @"P90";
    } else if (手持武器id == 103013) {
     
        wzsr = @"M417";
    } else if (手持武器id == 103004) {
        
    
        
        wzsr = @"SKS";
    } else if (手持武器id == 103006) {
        
   
        
        wzsr = @"Mini14";
    } else if (手持武器id == 103009) {
        
    
        
        wzsr = @"SLR";
    } else if (手持武器id == 103005) {
        
     
        wzsr = @"VSS";
    } else if (手持武器id == 103010) {
       
        wzsr = @"QBU";
    } else if (手持武器id == 103007) {
       
        wzsr = @"Mk14";
    } else if (手持武器id == 103003) {
        
        wzsr = @"AWM";
    } else if (手持武器id == 103002) {
        
        wzsr = @"M24";
    } else if (手持武器id == 103011) {
       
        wzsr = @"莫辛纳甘";
    } else if (手持武器id == 103001) {
        
        wzsr = @"98K";
    } else if (手持武器id == 103008) {
        
        wzsr = @"Win94";
    } else if (手持武器id == 103012) {
        
        wzsr = @"AMR";
    } else if (手持武器id == 102002) {
        
       
        wzsr = @"UNP45";
    } else if (手持武器id == 104002) {
      
        wzsr = @"S1897";
    } else if (手持武器id == 104001) {
    
        wzsr = @"S686";
    } else if (手持武器id == 104100) {
     
        wzsr = @"SPAS";
    } else if (手持武器id == 104004) {
      
        wzsr = @"DBS";
    } else if (手持武器id == 104003) {
       
        wzsr = @"S12K";
    } else if (手持武器id == 105002) {
        
     
        wzsr = @"DP-28";
    } else if (手持武器id == 107001) {
       
        wzsr = @"十字弩";
    } else if (手持武器id == 105010) {
    
        wzsr = @"MG3";
    } else if (手持武器id == 105001) {
     
        wzsr = @"M249";
    } else if (手持武器id == 107007) {
   
        wzsr = @"爆炸猎弓";
    } else if (手持武器id == 108004) {
      
        wzsr = @"平底锅";
        
    } else if ( 手持武器id == 108003) {
    
        wzsr = @"镰刀";
        
    } else if (手持武器id == 108002 ) {
        wzsr = @"撬棍";
      
    } else if ( 手持武器id == 108001) {
     
       
        wzsr = @"砍刀";
        
    } else if (手持武器id == 106001 ) {
        
        wzsr = @"P92";
        
    } else if (手持武器id == 106002) {
     
        wzsr = @"P19";
        
    } else if (手持武器id == 106003 ) {
    
        wzsr = @"左轮";
        
    } else if (手持武器id == 106004) {
        wzsr = @"P18C";
    } else if (手持武器id == 106005 ) {
    
        wzsr = @"R45";
        
    } else if ( 手持武器id == 106006 ) {
            ji=duanguanBase64;
        wzsr = @"短管散弹枪";
        
    } else if (手持武器id == 106008 ) {
        ji=xieshiBase64;
        wzsr = @"蝎式手枪";
        
    } else if ( 手持武器id == 106010) {
     
        wzsr = @"沙漠之鹰";
        
    } else if (手持武器id == 602001) {
     
        wzsr = @"闪光弹";

        
        
        
    } else if (手持武器id == 602002) {
     
        wzsr = @"烟雾弹";

        
    } else if (手持武器id == 602003) {
    
        wzsr = @"燃烧瓶";

    } else if (手持武器id == 602004) {

        wzsr = @"手雷";
    }


    return wzsr;
    
    
}
-(NSData*)手持武器转换图片:(int)手持武器id{
    static NSString*wzsr;

    if (手持武器id == 0) {
        ji =quanBase64;
     
    } else if (手持武器id == 101001) {
        ji=akmBase64;
      
    } else if (手持武器id == 101012) {
        ji =mihuanBase64;
        wzsr = @"蜜罐";
    } else if (手持武器id == 101002) {
        ji=m16Base64;
      
        wzsr = @"M16";
    } else if (手持武器id == 101003) {
        ji=sigaBase64;
        
        wzsr = @"SCAR-L";
    } else if (手持武器id == 101004) {
       ji=m4Base64;
       
        wzsr = @"M416";
    } else if (手持武器id == 101005) {
        ji =gouzaBase64;
        wzsr = @"GROZA";
    } else if (手持武器id == 101006) {
        ji=augBase64;
        wzsr = @"AUG";
    } else if (手持武器id == 101007) {
        
        ji=qbzBase64;
        wzsr = @"QBZ";
    } else if (手持武器id == 101008) {
        ji=m762Base64;
        wzsr = @"M762";
    } else if (手持武器id == 101009) {
        ji=mk47Base64;
        wzsr = @"Mk47";
    } else if (手持武器id == 101010) {
        ji =c36cBase64;
 
        wzsr = @"G36C";
    } else if (手持武器id == 101011) {
        
        ji=VALBase64;
        wzsr = @"AC-VAL";
    } else if (手持武器id == 102001) {
        
        ji=uziBase64;
        wzsr = @"UZI";
    } else if (手持武器id == 102003) {
        ji =VectorBase64;
        
        wzsr = @"Vector";
    } else if (手持武器id == 102004) {
        ji =TommyGunBase64;
        wzsr = @"汤姆逊";
    } else if (手持武器id == 102005) {
        ji =yeniuBase64;
        wzsr = @"野牛";
    } else if (手持武器id == 102007) {
        ji =mp5kBase64;
        wzsr = @"MP5K";
    } else if (手持武器id == 102105) {
        ji =p90Base64;
        wzsr = @"P90";
    } else if (手持武器id == 103013) {
        ji=m417Base64;
        wzsr = @"M417";
    } else if (手持武器id == 103004) {
        
        ji=sksBase64;
        
        wzsr = @"SKS";
    } else if (手持武器id == 103006) {
        
        ji=miniBase64;
        
        wzsr = @"Mini14";
    } else if (手持武器id == 103009) {
        
        ji=dapaoBase64;
        
        
        wzsr = @"SLR";
    } else if (手持武器id == 103005) {
        
        ji=vssBase64;
        wzsr = @"VSS";
    } else if (手持武器id == 103010) {
        ji=qbuBase64;
        wzsr = @"QBU";
    } else if (手持武器id == 103007) {
        ji=mk14Base64;
        wzsr = @"Mk14";
    } else if (手持武器id == 103003) {
        ji=awmBase64;
        wzsr = @"AWM";
    } else if (手持武器id == 103002) {
        ji=m24Base64;
        wzsr = @"M24";
    } else if (手持武器id == 103011) {
        ji=moxingnaganBase64;
        wzsr = @"莫辛纳甘";
    } else if (手持武器id == 103001) {
        ji=kar98kBase64;
        wzsr = @"98K";
    } else if (手持武器id == 103008) {
        ji=wen94Base64;
        wzsr = @"Win94";
    } else if (手持武器id == 103012) {
        ji=amrBase64;
        wzsr = @"AMR";
    } else if (手持武器id == 102002) {
        
        ji=ump45Base64;
        wzsr = @"UNP45";
    } else if (手持武器id == 104002) {
        ji=s1897Base64;
        wzsr = @"S1897";
    } else if (手持武器id == 104001) {
        ji=s686Base64;
        wzsr = @"S686";
    } else if (手持武器id == 104100) {
        ji=spasBase64;
        wzsr = @"SPAS";
    } else if (手持武器id == 104004) {
        ji=dbsBase64;
        wzsr = @"DBS";
    } else if (手持武器id == 104003) {
        ji=s12kBase64;
        wzsr = @"S12K";
    } else if (手持武器id == 105002) {
        
        ji=dapanjiBase64;
        wzsr = @"DP-28";
    } else if (手持武器id == 107001) {
        ji =shizinuBase64;
        wzsr = @"十字弩";
    } else if (手持武器id == 105010) {
        ji =mg3Base64;
        wzsr = @"MG3";
    } else if (手持武器id == 105001) {
        ji =m249Base64;
        wzsr = @"M249";
    } else if (手持武器id == 107007) {
        ji=gongjianBase64;
        wzsr = @"爆炸猎弓";
    } else if (手持武器id == 108004) {
        ji =pingdiguoBase64;
        
        
        
    } else if ( 手持武器id == 108003) {
        ji=liandaoBase64;
        
    } else if (手持武器id == 108002 ) {
        ji=qiaogunBase64;
    } else if ( 手持武器id == 108001) {
     
        ji=kandaoBase64;
        
        
        
    } else if (手持武器id == 106001 ) {
        ji=p92Base64;
        wzsr = @"手枪";
        
    } else if (手持武器id == 106002) {
        ji=p1911Base64;
    } else if (手持武器id == 106003 ) {
        ji=zuolongBase64;
        
        
    } else if (手持武器id == 106004) {
        ji=p18cBase64;
        
    } else if (手持武器id == 106005 ) {
        ji=r45Base64;
        
    } else if ( 手持武器id == 106006 ) {
            ji=duanguanBase64;
    } else if (手持武器id == 106008 ) {
        ji=xieshiBase64;
        
    } else if ( 手持武器id == 106010) {
        ji=shamozhiyingBase64;

    } else if (手持武器id == 602001) {
        ji =shanguangBase64;
        wzsr = @"手雷";

        
        
        
    } else if (手持武器id == 602002) {
        ji =yanwuBase64;
        wzsr = @"手雷";

        
    } else if (手持武器id == 602003) {
        ji =ranshaoBase64;
        wzsr = @"手雷";

    } else if (手持武器id == 602004) {
        ji =shouleiBase64;
        wzsr = @"手雷";
    }


    return sb;
    
    
}

#pragma mark 绘制颜色样式相关===================================
- (void)射线:(int)i 起点:(CGPoint)起点 终点:(CGPoint)终点 ai:(int)ai{
    @autoreleasepool {
        // 绘制轨迹
      

        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointMake(起点.x, 起点.y)];
        [bezierPath addLineToPoint:CGPointMake(终点.x, 终点.y)];
        //  轨迹渲染
        
        if (ai==1) {
            shexian[i].fillColor = [UIColor greenColor].CGColor;
            shexian[i].strokeColor = [UIColor greenColor].CGColor;
        } else {
            shexian[i].fillColor = [UIColor redColor].CGColor;
            shexian[i].strokeColor = [UIColor redColor].CGColor;
        }
        
        shexian[i].strokeStart = 0;
        shexian[i].strokeEnd = 1;
        shexian[i].zPosition = 1;
        shexian[i].lineWidth = 0.7;
        shexian[i].path  = bezierPath.CGPath;
    }
    
}




- (void)队标:(int)i 坐标:(CGPoint)坐标 ai:(int)ai dui:(int)dui{
    @autoreleasepool {
        队标[i].text=[NSString stringWithFormat:@"%d",dui];
        队标[i].frame = CGRectMake(坐标.x, 坐标.y, 14, 20);
        队标[i].textAlignment =NSTextAlignmentCenter;
        队标[i].textColor = [UIColor yellowColor];
        队标[i].backgroundColor = [UIColor clearColor];
        队标[i].font = [UIFont systemFontOfSize:10];
        //队标[i].shadowColor = [UIColor whiteColor];
        //队标[i].shadowOffset = CGSizeMake(0.5,1.1);
    }
}
- (void)名字:(int)i 坐标:(CGPoint)坐标 ai:(int)ai Name:(NSString*)Name 队标:(int)队标{
    @autoreleasepool {
        名字[i].text=Name;
        名字[i].frame =CGRectMake(坐标.x-5, 坐标.y, 100, 20);
        名字[i].textAlignment =NSTextAlignmentCenter;
        if (ai==1) {
            名字[i].textColor = [UIColor whiteColor];
            名字[i].backgroundColor=[UIColor clearColor];
        }else{
            名字[i].textColor = [UIColor yellowColor];
            名字[i].backgroundColor=[UIColor clearColor];
        }
        名字[i].font = [UIFont systemFontOfSize:10];
        //名字[i].shadowColor = [UIColor whiteColor];//投影颜色
        //名字[i].shadowOffset = CGSizeMake(0.5,1.1);//投影方向
    }
}
- (void)距离:(int)i 坐标:(CGPoint)坐标 ai:(int)ai dis:(float)dis{
    @autoreleasepool {
       
        距离[i].text=[NSString stringWithFormat:@"[%.0f M]",dis];
        距离[i].frame = CGRectMake(坐标.x, 坐标.y, 30, 10);
        距离[i].backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.00];
       
        
        距离[i].textAlignment =NSTextAlignmentCenter;
        距离[i].textColor = [UIColor whiteColor];
        距离[i].font = [UIFont systemFontOfSize:10];
        //        距离[i].shadowColor = [UIColor whiteColor];
        //        距离[i].shadowOffset = CGSizeMake(0.5,1.1);
    }
    
    
}
- (void)血量数字:(int)i 坐标:(CGPoint)坐标 ai:(int)ai xuel:(float)xue{
    @autoreleasepool {
       
        血量[i].text=[NSString stringWithFormat:@"HP:%.0f",xue];
        血量[i].frame = CGRectMake(坐标.x, 坐标.y, 40, 10);
        血量[i].backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.35];
        
        
        
        血量[i].textAlignment =NSTextAlignmentCenter;
        血量[i].textColor = [UIColor redColor];
        血量[i].font = [UIFont systemFontOfSize:10];
        //        距离[i].shadowColor = [UIColor whiteColor];
        //        距离[i].shadowOffset = CGSizeMake(0.5,1.1);
    }
    
    
}





- (void)附近人数:(NSString*)str{
    @autoreleasepool {

        
     
        fujin.text=str;
        fujin.layer.cornerRadius=20;
        fujin.backgroundColor=[UIColor clearColor];
        fujin.font = [UIFont systemFontOfSize:30];
        fujin.textColor=[UIColor redColor];
        fujin.borderColor=[UIColor whiteColor];
        fujin.borderWidth=4;
            fujin.textAlignment = NSTextAlignmentCenter;
        fujin.shadowOffset = CGSizeMake(0, 0);//原15
        fujin.frame = CGRectMake(gaodu/2-40, 40, 80, 30);
    }
    
}

- (void)持枪文字:(int)i 坐标:(CGPoint)坐标 Name:(NSString*)Name{
    @autoreleasepool {
        手持武器[i].text=Name;
        手持武器[i].frame =CGRectMake(坐标.x, 坐标.y, 60, 20);
        手持武器[i].textAlignment =NSTextAlignmentCenter;
        手持武器[i].textColor = [UIColor whiteColor];
        手持武器[i].backgroundColor=[UIColor clearColor];
        手持武器[i].font = [UIFont boldSystemFontOfSize:12];
    }
}


- (void)手持武器:(int)i 坐标:(CGPoint)坐标 Name:(NSData*)Name{
    @autoreleasepool {
   
      
      
        imageView[i].image=[UIImage imageWithData:Name];

        imageView[i].frame =CGRectMake(坐标.x, 坐标.y, 60, 20.2);
//        imageView[i].backgroundColor=[UIColor redColor];
      //                      imageView.center=(CGPoint){xd,yd};
      //                      [self insertSubview:imageView atIndex:0];
    }
}
- (void)距离判断:(int)i 距离:(float)juli ai:(int)人机{
    
    
    
  if ((人机 = juli<= 500)) {
       
        shexian[i].strokeColor = [UIColor whiteColor].CGColor;//白色
    }
    if(juli<=50){
       
        shexian[i].strokeColor = [UIColor orangeColor].CGColor;//蓝色
    }
    if(juli>50 && juli<=100){
      
        shexian[i].strokeColor = [UIColor redColor].CGColor;//红色
    }
    if(juli>100 && juli<=200){
      
        shexian[i].strokeColor = [UIColor yellowColor].CGColor;//黄色
    }
    if(juli>200){
       
        shexian[i].strokeColor = [UIColor greenColor].CGColor;//绿色
    }
}
- (float)getDistance:(FVector3D)a b:(VV3)b
{
    FVector3D ret;
    ret.X = a.X - b.X;
    ret.Y = a.Y - b.Y;
    ret.Z = a.Z - b.Z;
    return sqrt(ret.X * ret.X + ret.Y * ret.Y + ret.Z * ret.Z);
}

- (FRotator)clamp:(FRotator)Rotation
{
    if (Rotation.Yaw > 180.f) {
        Rotation.Yaw -= 360.f;
    } else if (Rotation.Yaw < -180.f) {
        Rotation.Yaw += 360.f;
    }
    
    if (Rotation.Pitch > 180.f) {
        Rotation.Pitch -= 360.f;
    } else if (Rotation.Pitch < -180.f) {
        Rotation.Pitch += 360.f;
    }
    
    if (Rotation.Pitch < -89.f) {
        Rotation.Pitch = -89.f;
    } else if (Rotation.Pitch > 89.f) {
        Rotation.Pitch = 89.f;
    }
    
    Rotation.Roll = 0.f;
    
    return Rotation;
}
- (FVector3D)readFVector:(uintptr_t)address
{
    FVector3D value;
    Read(address, &value, sizeof(FVector3D));
   // [self readMemory:address size:sizeof(FVector3D) buffer:&value];
    return value;
}

- (VV3)getBoneWithRotation:(uintptr_t)mesh ID:(int)Id publicObj:(FTransform)publicObj
{
    FTransform BoneMatrix;
    VV3 output = {0, 0, 0};
    
    uintptr_t addr;
    if (!Read(mesh+0x6D8, &addr, sizeof(uintptr_t))) {
        return output;
    }
    BoneMatrix = [self getMatrixConversion:addr + Id * 0x30];
    
    D3DXMATRIX LocalSkeletonMatrix = [self toMatrixWithScale:BoneMatrix.Rotation
                                                        translation:BoneMatrix.Translation
                                                            scale3D:BoneMatrix.Scale3D];
    
    D3DXMATRIX PartTotheWorld = [self toMatrixWithScale:publicObj.Rotation
                                                   translation:publicObj.Translation
                                                       scale3D:publicObj.Scale3D];
    
    D3DXMATRIX NewMatrix = [self matrixMultiplication:LocalSkeletonMatrix
                                                          M2:PartTotheWorld];
    
    VV3 BoneCoordinates;
    BoneCoordinates.X = NewMatrix._41;
    BoneCoordinates.Y = NewMatrix._42;
    BoneCoordinates.Z = NewMatrix._43;
    
    return BoneCoordinates;
}
- (FTransform)getMatrixConversion:(uintptr_t)address
{
    FTransform ret;
    Read(address, &ret.Rotation.X, sizeof(float));
    Read(address+4, &ret.Rotation.Y, sizeof(float));
    Read(address+8, &ret.Rotation.Z, sizeof(float));
    Read(address+12, &ret.Rotation.W, sizeof(float));

    Read(address+16, &ret.Translation.X, sizeof(float));
    Read(address+20,&ret.Translation.Y, sizeof(float));
    Read(address+24, &ret.Translation.Z, sizeof(float));
    
    
    
    Read(address+32,&ret.Scale3D.X, sizeof(float));
    Read(address+36,&ret.Scale3D.Y, sizeof(float));
    Read(address+40, &ret.Scale3D.Z, sizeof(float));
    
    
  
    return ret;
}
- (D3DXMATRIX)toMatrixWithScale:(FVector4D)rotation
                           translation:(FVector3D)translation
                               scale3D:(FVector3D)scale3D
{
    D3DXMATRIX ret;
    
    float x2, y2, z2, xx2, yy2, zz2, yz2, wx2, xy2, wz2, xz2, wy2 = 0.f;
    ret._41 = translation.X;
    ret._42 = translation.Y;
    ret._43 = translation.Z;
    
    x2 = rotation.X * 2;
    y2 = rotation.Y * 2;
    z2 = rotation.Z * 2;
    
    xx2 = rotation.X * x2;
    yy2 = rotation.Y * y2;
    zz2 = rotation.Z * z2;
    
    ret._11 = (1 - (yy2 + zz2)) * scale3D.X;
    ret._22 = (1 - (xx2 + zz2)) * scale3D.Y;
    ret._33 = (1 - (xx2 + yy2)) * scale3D.Z;
    
    yz2 = rotation.Y * z2;
    wx2 = rotation.W * x2;
    ret._32 = (yz2 - wx2) * scale3D.Z;
    ret._23 = (yz2 + wx2) * scale3D.Y;
    
    xy2 = rotation.X * y2;
    wz2 = rotation.W * z2;
    ret._21 = (xy2 - wz2) * scale3D.Y;
    ret._12 = (xy2 + wz2) * scale3D.X;
    
    xz2 = rotation.X * z2;
    wy2 = rotation.W * y2;
    ret._31 = (xz2 + wy2) * scale3D.Z;
    ret._13 = (xz2 - wy2) * scale3D.X;
    
    ret._14 = 0.f;
    ret._24 = 0.f;
    ret._34 = 0.f;
    ret._44 = 1.f;
    
    return ret;
}
- (struct D3DXMATRIX)matrixMultiplication:(struct D3DXMATRIX)M1 M2:(struct D3DXMATRIX)M2
{
    struct D3DXMATRIX ret;
    ret._11 = M1._11 * M2._11 + M1._12 * M2._21 + M1._13 * M2._31 + M1._14 * M2._41;
    ret._12 = M1._11 * M2._12 + M1._12 * M2._22 + M1._13 * M2._32 + M1._14 * M2._42;
    ret._13 = M1._11 * M2._13 + M1._12 * M2._23 + M1._13 * M2._33 + M1._14 * M2._43;
    ret._14 = M1._11 * M2._14 + M1._12 * M2._24 + M1._13 * M2._34 + M1._14 * M2._44;
    ret._21 = M1._21 * M2._11 + M1._22 * M2._21 + M1._23 * M2._31 + M1._24 * M2._41;
    ret._22 = M1._21 * M2._12 + M1._22 * M2._22 + M1._23 * M2._32 + M1._24 * M2._42;
    ret._23 = M1._21 * M2._13 + M1._22 * M2._23 + M1._23 * M2._33 + M1._24 * M2._43;
    ret._24 = M1._21 * M2._14 + M1._22 * M2._24 + M1._23 * M2._34 + M1._24 * M2._44;
    ret._31 = M1._31 * M2._11 + M1._32 * M2._21 + M1._33 * M2._31 + M1._34 * M2._41;
    ret._32 = M1._31 * M2._12 + M1._32 * M2._22 + M1._33 * M2._32 + M1._34 * M2._42;
    ret._33 = M1._31 * M2._13 + M1._32 * M2._23 + M1._33 * M2._33 + M1._34 * M2._43;
    ret._34 = M1._31 * M2._14 + M1._32 * M2._24 + M1._33 * M2._34 + M1._34 * M2._44;
    ret._41 = M1._41 * M2._11 + M1._42 * M2._21 + M1._43 * M2._31 + M1._44 * M2._41;
    ret._42 = M1._41 * M2._12 + M1._42 * M2._22 + M1._43 * M2._32 + M1._44 * M2._42;
    ret._43 = M1._41 * M2._13 + M1._42 * M2._23 + M1._43 * M2._33 + M1._44 * M2._43;
    ret._44 = M1._41 * M2._14 + M1._42 * M2._24 + M1._43 * M2._34 + M1._44 * M2._44;
//    ret._32=M1._42;
    return ret;
}
- (int)getCenterOffsetForVector:(FVector2D)point
{
    return sqrt(pow(point.X - self.canvas.X/2, 2.0) + pow(point.Y - self.canvas.Y/2, 2.0));
}

#pragma mark 获取骨骼世界位置============================
- (VV3)gsjs:(long)boneTransAddr c2wMatrix:(矩阵)c2wMatrix{
    @autoreleasepool {
        转换 boneTrans = 读取数据<转换>(boneTransAddr);
        矩阵 boneMatrix = TransformToMatrix(boneTrans);
        return MatrixToVector(MatrixMulti(boneMatrix, c2wMatrix));
    }
    
}
- (float)theDot:(FVector3D)v1 v2:(FVector3D)v2
{
    return v1.X * v2.X + v1.Y * v2.Y + v1.Z * v2.Z;
}
- (D3DXMATRIX)toMATRIX:(FRotator)rot
{
    float RadPitch, RadYaw, RadRoll, SP, CP, SY, CY, SR, CR;
    D3DXMATRIX M;
    
    RadPitch = rot.Pitch * M_PI / 180;
    RadYaw = rot.Yaw * M_PI / 180;
    RadRoll = rot.Roll * M_PI / 180;
    
    SP = sin(RadPitch);
    CP = cos(RadPitch);
    SY = sin(RadYaw);
    CY = cos(RadYaw);
    SR = sin(RadRoll);
    CR = cos(RadRoll);
    
    M._11 = CP * CY;
    M._12 = CP * SY;
    M._13 = SP;
    M._14 = 0.f;
    
    M._21 = SR * SP * CY - CR * SY;
    M._22 = SR * SP * SY + CR * CY;
    M._23 = -SR * CP;
    M._24 = 0.f;
    
    M._31 = -(CR * SP * CY + SR * SY);
    M._32 = CY * SR - CR * SP * SY;
    M._33 = CR * CP;
    M._34 = 0.f;
    
    M._41 = 0.f;
    M._42 = 0.f;
    M._43 = 0.f;
    M._44 = 1.f;
    
    return M;
}

- (void)getTheAxes:(FRotator)rot x:(FVector3D *)x y:(FVector3D *)y z:(FVector3D *)z
{
    D3DXMATRIX M = [self toMATRIX:rot];
    
    x->X = M._11;
    x->Y = M._12;
    x->Z = M._13;

    y->X = M._21;
    y->Y = M._22;
    y->Z = M._23;

    z->X = M._31;
    z->Y = M._32;
    z->Z = M._33;
}
- (FVector3D)minusTheVector:(FVector3D)first second:(VV3)second
{
    FVector3D ret;
    ret.X = first.X - second.X;
    ret.Y = first.Y - second.Y;
    ret.Z = first.Z - second.Z;
    return ret;
}

- (FVector2D)worldToScreen:(FVector3D)worldlocation camViewInfo:(最小视图信息)POV canvas:(FVector2D)canvas
{
    FVector2D Screenlocation;
    
    FVector3D vAxisX, vAxisY, vAxisZ;
    [self getTheAxes:POV.Rotation x:&vAxisX y:&vAxisY z:&vAxisZ];
    
    FVector3D vDelta = [self minusTheVector:worldlocation second:POV.Location];
    FVector3D vTransformed;
    vTransformed.X = [self theDot:vDelta v2:vAxisY];
    vTransformed.Y = [self theDot:vDelta v2:vAxisZ];
    vTransformed.Z = [self theDot:vDelta v2:vAxisX];
    
    if (vTransformed.Z < 1.0f) {
        vTransformed.Z = 1.0f;
    }
    
    float FOV = POV.FOV;
    float ScreenCenterX = canvas.X / 2;
    float ScreenCenterY = canvas.Y / 2;
    
    Screenlocation.X = ScreenCenterX + vTransformed.X * (ScreenCenterX / tanf(FOV * (float)M_PI / 360.f)) / vTransformed.Z;
    Screenlocation.Y = ScreenCenterY - vTransformed.Y * (ScreenCenterX / tanf(FOV * (float)M_PI / 360.f)) / vTransformed.Z;

    return Screenlocation;
}


- (BOOL)worldToScreenForRect:(FVector3D)Pos camViewInfo:(最小视图信息)camViewInfo canvas:(FVector2D)canvas outRect:(FVectorRect *)outRect
{
    FVector3D Pos2 = Pos;
    Pos2.Z += 90.f;
    FVector2D CalcPos = [self worldToScreen:Pos camViewInfo:camViewInfo canvas:canvas];
    FVector2D CalcPos2 = [self worldToScreen:Pos2 camViewInfo:camViewInfo canvas:canvas];

  
    outRect->H = CalcPos.Y - CalcPos2.Y;
    outRect->W = outRect->H / 2.5;
    outRect->X = CalcPos.X - outRect->W;
    outRect->Y = CalcPos2.Y;
    outRect->W = outRect->W * 2;
    outRect->H = outRect->H * 2;
    
    return YES;
}
- (BOOL)getInsideFov:(FVector2D)bone radius:(float)radius
{
  
   FVector2D Cenpoint;
    Cenpoint.X = bone.X - (self.canvas.X / 2);
    Cenpoint.Y = bone.Y - (self.canvas.Y / 2);
    if (Cenpoint.X * Cenpoint.X + Cenpoint.Y * Cenpoint.Y <= radius * radius) {
        return YES;
    }
    return NO;
}
- (NSString *)getFNameFromID:(int)classId
{
    NSString *FName;
    if (classId > 0 && classId < 2000000) {
        char *buf = (char *)malloc(64);
        int page = classId / 16384;
        int index = classId % 16384;
        uintptr_t pageAddr = [self readPtr:MOD + 0xB24A0F8 + page * sizeof(uintptr_t)];
        uintptr_t nameAddr = [self readPtr:pageAddr + index * sizeof(uintptr_t)] + 0xE;
        Read(nameAddr, buf, 64);
        FName = [NSString stringWithUTF8String:buf];
        free(buf);
    }
    return FName;
}
- (uintptr_t)readPtr:(uintptr_t)address
{
    uintptr_t value = 0;
    Read(address, &value, 8);
    return value;
}




#pragma mark 矩阵到向量
bool _write(long addr, void *buffer, int len)
{
   
    kern_return_t error = vm_write(mach_task_self(), (vm_address_t)addr, (vm_offset_t)buffer, (mach_msg_type_number_t)len);
    if(error != KERN_SUCCESS)
    {
        return false;
    }
    return true;
}




template<typename T> void Write(long address, T data) {
    _write(address, reinterpret_cast<void *>(&data), sizeof(T));
}




static VV3 MatrixToVector(矩阵 matrix) {
    @autoreleasepool {
        
        return VV3(matrix[3][0], matrix[3][1], matrix[3][2]);
    }
    
}
#pragma mark 矩阵
static 矩阵 MatrixMulti(矩阵 m1, 矩阵 m2) {
    @autoreleasepool {
        矩阵 matrix = 矩阵();
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                for (int k = 0; k < 4; k++) {
                    matrix[i][j] += m1[i][k] * m2[k][j];
                }
            }
        }
        return matrix;
    }
    
}
#pragma mark 变换矩阵
static 矩阵 TransformToMatrix(转换 transform) {
    @autoreleasepool {
        矩阵 matrix;
        
        matrix[3][0] = transform.Translation.X;
        matrix[3][1] = transform.Translation.Y;
        matrix[3][2] = transform.Translation.Z;
        
        float x2 = transform.Rotation.x + transform.Rotation.x;
        float y2 = transform.Rotation.y + transform.Rotation.y;
        float z2 = transform.Rotation.z + transform.Rotation.z;
        
        float xx2 = transform.Rotation.x * x2;
        float yy2 = transform.Rotation.y * y2;
        float zz2 = transform.Rotation.z * z2;
        
        matrix[0][0] = (1.0f - (yy2 + zz2)) * transform.Scale3D.X;
        matrix[1][1] = (1.0f - (xx2 + zz2)) * transform.Scale3D.Y;
        matrix[2][2] = (1.0f - (xx2 + yy2)) * transform.Scale3D.Z;
        
        float yz2 = transform.Rotation.y * z2;
        float wx2 = transform.Rotation.w * x2;
        matrix[2][1] = (yz2 - wx2) * transform.Scale3D.Z;
        matrix[1][2] = (yz2 + wx2) * transform.Scale3D.Y;
        
        float xy2 = transform.Rotation.x * y2;
        float wz2 = transform.Rotation.w * z2;
        matrix[1][0] = (xy2 - wz2) * transform.Scale3D.Y;
        matrix[0][1] = (xy2 + wz2) * transform.Scale3D.X;
        
        float xz2 = transform.Rotation.x * z2;
        float wy2 = transform.Rotation.w * y2;
        matrix[2][0] = (xz2 + wy2) * transform.Scale3D.Z;
        matrix[0][2] = (xz2 - wy2) * transform.Scale3D.X;
        
        matrix[0][3] = 0;
        matrix[1][3] = 0;
        matrix[2][3] = 0;
        matrix[3][3] = 1;
        
        return matrix;
    }
    
}
#pragma mark 视角2

    
#pragma mark 旋转矩阵


static 矩阵 RotatorToMatrix(FRotator rotation) {
    @autoreleasepool {
        float radPitch = rotation.Pitch * ((float) M_PI / 180.0f);
        float radYaw = rotation.Yaw * ((float) M_PI / 180.0f);
        float radRoll = rotation.Roll * ((float) M_PI / 180.0f);
        
        float SP = sinf(radPitch);
        float CP = cosf(radPitch);
        float SY = sinf(radYaw);
        float CY = cosf(radYaw);
        float SR = sinf(radRoll);
        float CR = cosf(radRoll);
        
        矩阵 matrix;
        
        matrix[0][0] = (CP * CY);
        matrix[0][1] = (CP * SY);
        matrix[0][2] = (SP);
        matrix[0][3] = 0;
        
        matrix[1][0] = (SR * SP * CY - CR * SY);
        matrix[1][1] = (SR * SP * SY + CR * CY);
        matrix[1][2] = (-SR * CP);
        matrix[1][3] = 0;
        
        matrix[2][0] = (-(CR * SP * CY + SR * SY));
        matrix[2][1] = (CY * SR - CR * SP * SY);
        matrix[2][2] = (CR * CP);
        matrix[2][3] = 0;
        
        matrix[3][0] = 0;
        matrix[3][1] = 0;
        matrix[3][2] = 0;
        matrix[3][3] = 1;
        
        return matrix;
    }
    
}

#pragma mark 世界坐标转屏幕坐标



static VVV2 世界坐标转屏幕坐标(VV3 worldlocation) {
    @autoreleasepool {
        tempMatrix = RotatorToMatrix(POV.Rotation);
        
        VV3 vAxisX(tempMatrix[0][0], tempMatrix[0][1], tempMatrix[0][2]);
        VV3 vAxisY(tempMatrix[1][0], tempMatrix[1][1], tempMatrix[1][2]);
        VV3 vAxisZ(tempMatrix[2][0], tempMatrix[2][1], tempMatrix[2][2]);
        VV3 vDelta = worldlocation - POV.Location;
        
        VV3 vTransformed(VV3::Dot(vDelta, vAxisY), VV3::Dot(vDelta, vAxisZ), VV3::Dot(vDelta, vAxisX));
        
        if (vTransformed.Z < 1.0f) {
            vTransformed.Z = 1.f;
        }
        
        
        float fov = POV.FOV;
        float screenCenterX = gaodu * 0.5f;
        float screenCenterY = kuandu * 0.5f;
        return VVV2(
                    (screenCenterX + vTransformed.X * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.Z),
                    (screenCenterY - vTransformed.Y * (screenCenterX / tanf(fov * ((float) M_PI / 360.0f))) / vTransformed.Z)
                    );
    }
    
}
@end

