
//
//  tttt.m
//  654323
//
//  Created by 仔仔 on 2022/10/15.
//

#import "TFJGVGLGKFTVCSV.h"
#import "MGPGLabel.h"
#import "HUDRootViewController.h"
#import "tttt.h"
#define kuandu  [UIScreen mainScreen].bounds.size.width
#define gaodu [UIScreen mainScreen].bounds.size.height
#import <AVFoundation/AVFoundation.h>
static UIWindow*window;
@implementation tttt
+ (void)load
{
    

    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[tttt alloc] UIview];
        [[tttt alloc] 定时器];
    });
}

static NSTimer *音量定时器;
static float 初始当前音量;
static float 最新音量;
static tttt *View;
static tttt *View2;
static tttt *View3;
static UILabel *MyLabel;
static BOOL 显示隐藏;
-(void)定时器
{
    //获取当前音量
    初始当前音量 = [[AVAudioSession sharedInstance] outputVolume];
    音量定时器 = [NSTimer scheduledTimerWithTimeInterval:0.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //改变后的音量
     BOOL JC=YES;
        BOOL YZSJ=true;
      if (JC) {
            AVAudioSession *audioSession = [AVAudioSession sharedInstance];
            [audioSession setActive:NO error:nil];
            最新音量 = [[AVAudioSession sharedInstance] outputVolume];
            if (初始当前音量!=最新音量) {
                if (!YZSJ) {
                   NSLog(@"打印2 未验证");
                   
                   
                }else{
                   
                    显示隐藏=!显示隐藏;
                    if (显示隐藏) {
                       NSLog(@"打印2 打开菜单");
                       View.hidden=NO;
                    }else{
                        View.hidden=YES;
                    }
                }
                初始当前音量 = 最新音量;
            }
        }
    }];
    [[NSRunLoop currentRunLoop] addTimer:音量定时器 forMode:NSRunLoopCommonModes];
    
    
}
UIScrollView *menuView2;
/*
static UISwitch * 总开关;
static UISwitch * 射线开关;
static UISwitch * 骨骼开关;
static UISwitch * 名字开关;
static UISwitch * 附近人数开关;
static UISwitch * 过直播开关;
static UISwitch * 距离开关;
static UISwitch * 血条开关;
static UISwitch * 手持武器开关;
static UISwitch * 距离判断开关;

static UISwitch * 无后开关;
static UISwitch * 聚点开关;
static UISwitch * 瞬击开关;*/
//模拟器同款菜单
float 自瞄速度=0.2;
UIButton *总开关关闭状态;
UIButton *总开关开启状态;
UIButton *过直播开启状态;
UIButton *过直播关闭状态;
UIButton *射线开启状态;
UIButton *射线关闭状态;

UIButton *自瞄开启状态;
UIButton *自瞄关闭状态;
MGPGLabel *自瞄开启;
MGPGLabel *自瞄关闭;


UIButton *触摸类型灵哲开启状态;
UIButton *触摸类型灵哲关闭状态;
MGPGLabel *触摸类型灵哲开启;
MGPGLabel *触摸类型灵哲关闭;





UIButton *信息开启状态;
UIButton *信息关闭状态;
UIButton *骨骼开启状态;
UIButton *骨骼关闭状态;
UIButton *持枪开启状态;
UIButton *持枪关闭状态;
UIButton *无后开启状态;
UIButton *无后关闭状态;
UIButton *聚点开启状态;
UIButton *聚点关闭状态;
UIButton *防抖开启状态;
UIButton *防抖关闭状态;
MGPGLabel *标题;
MGPGLabel *标题2;
MGPGLabel *总开关关闭;
MGPGLabel *总开关开启;
MGPGLabel *过直播开启;
MGPGLabel *过直播关闭;
MGPGLabel *射线开启;
MGPGLabel *射线关闭;
MGPGLabel *信息开启;
MGPGLabel *信息关闭;
MGPGLabel *骨骼开启;
MGPGLabel *骨骼关闭;

MGPGLabel *骨骼红色;
MGPGLabel *骨骼青色;
MGPGLabel *骨骼黄色;
UIButton *骨骼红色状态;
UIButton *骨骼青色状态;
UIButton *骨骼黄色状态;

MGPGLabel *射线变色开启;
MGPGLabel *射线变色关闭;
UIButton *射线变色开启状态;
UIButton *射线变色关闭状态;

UIButton *自瞄速度快状态;
UIButton *自瞄速度中状态;
UIButton *自瞄速度慢状态;
MGPGLabel *自瞄速度快;
MGPGLabel *自瞄速度中;
MGPGLabel *自瞄速度慢;




MGPGLabel *图片持枪开启;
MGPGLabel *图片持枪关闭;
UIButton *图片持枪开启状态;
UIButton *图片持枪关闭状态;


UIButton *图片手持状态;
UIButton *文字手持状态;
MGPGLabel *持枪开启;
MGPGLabel *持枪关闭;
MGPGLabel *无后开启;
MGPGLabel *无后关闭;
MGPGLabel *聚点开启;
MGPGLabel *聚点关闭;
MGPGLabel *防抖开启;
MGPGLabel *防抖关闭;
MGPGLabel *图片手持;
MGPGLabel *文字手持;

static BOOL 总开关状态,射线开关状态,骨骼开关状态,名字开关状态,附近人数开关状态,过直播开关状态,距离开关状态,血条开关状态,手持武器开关状态,距离判断开关状态,无后开关状态,聚点开关状态,瞬击开关状态;
- (void)UIview
{
   NSLog(@"打印2 视图初始化");
    //视图初始化
    View= [[tttt alloc] init];
    View.userInteractionEnabled=YES;
    View.hidden=NO;
    //功能:总绘制 过直播 人物射线 人物信息 人物骨骼 人物持枪 动态无后 动态聚点 动态防抖
    View.frame=CGRectMake(0,kuandu/2, 100, 300);
    //默认桌面是竖屏 游戏横屏 旋转视图
    View.layer.cornerRadius=0;
 //   View.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
   // View.layer.borderColor = [[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.6f] CGColor];gaodu/2-400-5-25-30-50-15

View.center = CGPointMake(0+150, kuandu/2);
    //测试背景
    View.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
   
    
    标题 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0-30-20, 0-10, 200, 20)];
    标题.numberOfLines = 0;
    标题.lineBreakMode = NSLineBreakByCharWrapping;
    标题.borderColor=[UIColor blackColor];
    标题.borderWidth=1.5;
    标题.text = @"THOR-雷神";
    标题.textAlignment = NSTextAlignmentCenter;
    标题.font = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    标题.textColor = [UIColor greenColor];
    [View addSubview:标题];


    总开关开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 13, 100, 10)];
    总开关开启状态.layer.cornerRadius=0;
    总开关开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [总开关开启状态 setTitle:@" " forState:UIControlStateNormal];
    [总开关开启状态 addTarget:self action:@selector(总开关开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:总开关开启状态];
    
    
    总开关关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 13, 100, 10)];
    总开关关闭状态.layer.cornerRadius=0;
    总开关关闭状态.hidden=YES;
    总开关关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [总开关关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [总开关关闭状态 addTarget:self action:@selector(总开关关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:总开关关闭状态];
   
    总开关关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 13,100, 15)];
    总开关关闭.numberOfLines = 0;
    总开关关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    总开关关闭.text = @"人物绘制          ×";
    总开关关闭.borderColor=[UIColor blackColor];
    总开关关闭.borderWidth=1.5;
    总开关关闭.textAlignment = NSTextAlignmentCenter;
    总开关关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    总开关关闭.textColor = [UIColor redColor];
    [View addSubview:总开关关闭];


    总开关开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 13, 100, 15)];
    总开关开启.numberOfLines = 0;
    总开关开启.lineBreakMode = NSLineBreakByCharWrapping;
    总开关开启.borderColor=[UIColor blackColor];
    总开关开启.borderWidth=1.5;
    总开关开启.text = @"人物绘制          √";
    总开关开启.hidden=YES;
    总开关开启.textAlignment = NSTextAlignmentCenter;
    总开关开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    总开关开启.textColor = [UIColor greenColor];
    [View addSubview:总开关开启];
   
    过直播开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 28, 100, 10)];
    过直播开启状态.layer.cornerRadius=0;
    过直播开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [过直播开启状态 setTitle:@" " forState:UIControlStateNormal];
    [过直播开启状态 addTarget:self action:@selector(过直播开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:过直播开启状态];
    
    
    过直播关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 28, 100, 10)];
    过直播关闭状态.layer.cornerRadius=0;
    过直播关闭状态.hidden=YES;
    过直播关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [过直播关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [过直播关闭状态 addTarget:self action:@selector(过直播关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:过直播关闭状态];
    过直播关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 28,100, 15)];
    过直播关闭.numberOfLines = 0;
    过直播关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    过直播关闭.text = @"主播模式          ×";
    过直播关闭.borderColor=[UIColor blackColor];
    过直播关闭.borderWidth=1.5;
    过直播关闭.textAlignment = NSTextAlignmentCenter;
    过直播关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    过直播关闭.textColor = [UIColor redColor];
    [View addSubview:过直播关闭];


    过直播开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 28, 100, 15)];
    过直播开启.numberOfLines = 0;
    过直播开启.lineBreakMode = NSLineBreakByCharWrapping;
    过直播开启.borderColor=[UIColor blackColor];
    过直播开启.borderWidth=1.5;
    过直播开启.text = @"主播模式          √";
    过直播开启.hidden=YES;
    过直播开启.textAlignment = NSTextAlignmentCenter;
    过直播开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    过直播开启.textColor = [UIColor greenColor];
    [View addSubview:过直播开启];
    
    射线开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 43, 100, 10)];
    射线开启状态.layer.cornerRadius=0;
    射线开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [射线开启状态 setTitle:@" " forState:UIControlStateNormal];
    [射线开启状态 addTarget:self action:@selector(射线开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:射线开启状态];
    
    
    射线关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 43, 100, 10)];
    射线关闭状态.layer.cornerRadius=0;
    射线关闭状态.hidden=YES;
    射线关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [射线关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [射线关闭状态 addTarget:self action:@selector(射线关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:射线关闭状态];
    射线关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 43,100, 15)];
    射线关闭.numberOfLines = 0;
    射线关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    射线关闭.text = @"人物射线          ×";
    射线关闭.borderColor=[UIColor blackColor];
    射线关闭.borderWidth=1.5;
    射线关闭.textAlignment = NSTextAlignmentCenter;
    射线关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    射线关闭.textColor = [UIColor redColor];
    [View addSubview:射线关闭];


    射线开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 43, 100, 15)];
    射线开启.numberOfLines = 0;
    射线开启.lineBreakMode = NSLineBreakByCharWrapping;
    射线开启.borderColor=[UIColor blackColor];
    射线开启.borderWidth=1.5;
    射线开启.text = @"人物射线          √";
    射线开启.hidden=YES;
    射线开启.textAlignment = NSTextAlignmentCenter;
    射线开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    射线开启.textColor = [UIColor greenColor];
    [View addSubview:射线开启];
    
    
    
    信息开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 58, 100, 10)];
    信息开启状态.layer.cornerRadius=0;
    信息开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [信息开启状态 setTitle:@" " forState:UIControlStateNormal];
    [信息开启状态 addTarget:self action:@selector(信息开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:信息开启状态];
    
    
    信息关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 58, 100, 10)];
    信息关闭状态.layer.cornerRadius=0;
    信息关闭状态.hidden=YES;
    信息关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [信息关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [信息关闭状态 addTarget:self action:@selector(信息关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:信息关闭状态];
    信息关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 58,100, 15)];
    信息关闭.numberOfLines = 0;
    信息关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    信息关闭.text = @"人物信息          ×";
    信息关闭.borderColor=[UIColor blackColor];
    信息关闭.borderWidth=1.5;
    信息关闭.textAlignment = NSTextAlignmentCenter;
    信息关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    信息关闭.textColor = [UIColor redColor];
    [View addSubview:信息关闭];


    信息开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 58, 100, 15)];
    信息开启.numberOfLines = 0;
    信息开启.lineBreakMode = NSLineBreakByCharWrapping;
    信息开启.borderColor=[UIColor blackColor];
    信息开启.borderWidth=1.5;
    信息开启.text = @"人物信息          √";
    信息开启.hidden=YES;
    信息开启.textAlignment = NSTextAlignmentCenter;
    信息开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    信息开启.textColor = [UIColor greenColor];
    [View addSubview:信息开启];
    
    
    
    
    
    骨骼开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 73, 100, 10)];
    骨骼开启状态.layer.cornerRadius=0;
    骨骼开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [骨骼开启状态 setTitle:@" " forState:UIControlStateNormal];
    [骨骼开启状态 addTarget:self action:@selector(骨骼开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:骨骼开启状态];
    
    
    骨骼关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 73, 100, 10)];
    骨骼关闭状态.layer.cornerRadius=0;
    骨骼关闭状态.hidden=YES;
    骨骼关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [骨骼关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [骨骼关闭状态 addTarget:self action:@selector(骨骼关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:骨骼关闭状态];
    骨骼关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 73,100, 15)];
    骨骼关闭.numberOfLines = 0;
    骨骼关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
   骨骼关闭.text = @"人物骨骼          ×";
    骨骼关闭.borderColor=[UIColor blackColor];
    骨骼关闭.borderWidth=1.5;
    骨骼关闭.textAlignment = NSTextAlignmentCenter;
    骨骼关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    骨骼关闭.textColor = [UIColor redColor];
    [View addSubview:骨骼关闭];


    骨骼开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 73, 100, 15)];
    骨骼开启.numberOfLines = 0;
    骨骼开启.lineBreakMode = NSLineBreakByCharWrapping;
    骨骼开启.borderColor=[UIColor blackColor];
    骨骼开启.borderWidth=1.5;
    骨骼开启.text = @"人物骨骼          √";
    骨骼开启.hidden=YES;
    骨骼开启.textAlignment = NSTextAlignmentCenter;
    骨骼开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    骨骼开启.textColor = [UIColor greenColor];
    [View addSubview:骨骼开启];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    持枪开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 88, 100, 10)];
    持枪开启状态.layer.cornerRadius=0;
    持枪开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [持枪开启状态 setTitle:@" " forState:UIControlStateNormal];
    [持枪开启状态 addTarget:self action:@selector(持枪开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:持枪开启状态];
    
    
    持枪关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 88, 100, 10)];
    持枪关闭状态.layer.cornerRadius=0;
    持枪关闭状态.hidden=YES;
    持枪关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [持枪关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [持枪关闭状态 addTarget:self action:@selector(持枪关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:持枪关闭状态];
    持枪关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 88,100, 15)];
    持枪关闭.numberOfLines = 0;
    持枪关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
   持枪关闭.text = @"人物持枪          ×";
    持枪关闭.borderColor=[UIColor blackColor];
    持枪关闭.borderWidth=1.5;
    持枪关闭.textAlignment = NSTextAlignmentCenter;
    持枪关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    持枪关闭.textColor = [UIColor redColor];
    [View addSubview:持枪关闭];


    持枪开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 88, 100, 15)];
    持枪开启.numberOfLines = 0;
    持枪开启.lineBreakMode = NSLineBreakByCharWrapping;
    持枪开启.borderColor=[UIColor blackColor];
    持枪开启.borderWidth=1.5;
    持枪开启.text = @"人物持枪          √";
    持枪开启.hidden=YES;
    持枪开启.textAlignment = NSTextAlignmentCenter;
    持枪开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    持枪开启.textColor = [UIColor greenColor];
    [View addSubview:持枪开启];
    
    
    无后开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 103, 100, 10)];
    无后开启状态.layer.cornerRadius=0;
    无后开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [无后开启状态 setTitle:@" " forState:UIControlStateNormal];
    [无后开启状态 addTarget:self action:@selector(无后开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:无后开启状态];
    
    
    无后关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 103, 100, 10)];
    无后关闭状态.layer.cornerRadius=0;
    无后关闭状态.hidden=YES;
    无后关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [无后关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [无后关闭状态 addTarget:self action:@selector(无后关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:无后关闭状态];
    无后关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 103,100, 15)];
    无后关闭.numberOfLines = 0;
    无后关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
   无后关闭.text = @"动态无后          ×";
    无后关闭.borderColor=[UIColor blackColor];
    无后关闭.borderWidth=1.5;
    无后关闭.textAlignment = NSTextAlignmentCenter;
    无后关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    无后关闭.textColor = [UIColor redColor];
    [View addSubview:无后关闭];


    无后开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 103, 100, 15)];
    无后开启.numberOfLines = 0;
    无后开启.lineBreakMode = NSLineBreakByCharWrapping;
    无后开启.borderColor=[UIColor blackColor];
    无后开启.borderWidth=1.5;
    无后开启.text = @"动态无后          √";
    无后开启.hidden=YES;
    无后开启.textAlignment = NSTextAlignmentCenter;
    无后开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    无后开启.textColor = [UIColor greenColor];
    [View addSubview:无后开启];
    
    
    
    
    聚点开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 118, 100, 10)];
    聚点开启状态.layer.cornerRadius=0;
    聚点开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [聚点开启状态 setTitle:@" " forState:UIControlStateNormal];
    [聚点开启状态 addTarget:self action:@selector(聚点开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:聚点开启状态];
    
    
    聚点关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 118, 100, 10)];
    聚点关闭状态.layer.cornerRadius=0;
    聚点关闭状态.hidden=YES;
    聚点关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [聚点关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [聚点关闭状态 addTarget:self action:@selector(聚点关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:聚点关闭状态];
    聚点关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 118,100, 15)];
    聚点关闭.numberOfLines = 0;
    聚点关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    聚点关闭.text = @"动态聚点          ×";
    聚点关闭.borderColor=[UIColor blackColor];
    聚点关闭.borderWidth=1.5;
    聚点关闭.textAlignment = NSTextAlignmentCenter;
    聚点关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    聚点关闭.textColor = [UIColor redColor];
    [View addSubview:聚点关闭];


    聚点开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 118, 100, 15)];
    聚点开启.numberOfLines = 0;
    聚点开启.lineBreakMode = NSLineBreakByCharWrapping;
    聚点开启.borderColor=[UIColor blackColor];
    聚点开启.borderWidth=1.5;
    聚点开启.text = @"动态聚点          √";
    聚点开启.hidden=YES;
    聚点开启.textAlignment = NSTextAlignmentCenter;
    聚点开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    聚点开启.textColor = [UIColor greenColor];
    [View addSubview:聚点开启];
    
    
   防抖开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 133, 100, 10)];
    防抖开启状态.layer.cornerRadius=0;
    防抖开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [防抖开启状态 setTitle:@" " forState:UIControlStateNormal];
    [防抖开启状态 addTarget:self action:@selector(防抖开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:防抖开启状态];
    
    
    防抖关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 133, 100, 10)];
    防抖关闭状态.layer.cornerRadius=0;
    防抖关闭状态.hidden=YES;
    防抖关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
    [防抖关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [防抖关闭状态 addTarget:self action:@selector(防抖关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:防抖关闭状态];
    防抖关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 133,100, 15)];
    防抖关闭.numberOfLines = 0;
    防抖关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    防抖关闭.text = @"动态防抖          ×";
    防抖关闭.borderColor=[UIColor blackColor];
    防抖关闭.borderWidth=1.5;
    防抖关闭.textAlignment = NSTextAlignmentCenter;
    防抖关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    防抖关闭.textColor = [UIColor redColor];
    [View addSubview:防抖关闭];


    防抖开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 133, 100, 15)];
    防抖开启.numberOfLines = 0;
    防抖开启.lineBreakMode = NSLineBreakByCharWrapping;
    防抖开启.borderColor=[UIColor blackColor];
    防抖开启.borderWidth=1.5;
    防抖开启.text = @"动态防抖          √";
    防抖开启.hidden=YES;
    防抖开启.textAlignment = NSTextAlignmentCenter;
    防抖开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    防抖开启.textColor = [UIColor greenColor];
    [View addSubview:防抖开启];
    
  /* 自瞄开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 148, 100, 10)];
    自瞄开启状态.layer.cornerRadius=0;
    自瞄开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
     [自瞄开启状态 setTitle:@" " forState:UIControlStateNormal];
     [自瞄开启状态 addTarget:self action:@selector(自瞄开启:) forControlEvents:UIControlEventTouchUpInside];
     [View addSubview:自瞄开启状态];
     
     
     自瞄关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 148, 100, 10)];
    自瞄关闭状态.layer.cornerRadius=0;
    自瞄关闭状态.hidden=YES;
    自瞄关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.00];
     [自瞄关闭状态 setTitle:@" " forState:UIControlStateNormal];
     [自瞄关闭状态 addTarget:self action:@selector(自瞄关闭:) forControlEvents:UIControlEventTouchUpInside];
     [View addSubview:自瞄关闭状态];
     自瞄关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 148,100, 15)];
    自瞄关闭.numberOfLines = 0;
    自瞄关闭.lineBreakMode = NSLineBreakByCharWrapping;
     //   BT.text = @"Tox单绘制";
    自瞄关闭.text = @"触摸自瞄          ×";
    自瞄关闭.borderColor=[UIColor blackColor];
    自瞄关闭.borderWidth=1.5;
    自瞄关闭.textAlignment = NSTextAlignmentCenter;
    自瞄关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    自瞄关闭.textColor = [UIColor redColor];
     [View addSubview:自瞄关闭];


     自瞄开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 148, 100, 15)];
    自瞄开启.numberOfLines = 0;
    自瞄开启.lineBreakMode = NSLineBreakByCharWrapping;
    自瞄开启.borderColor=[UIColor blackColor];
    自瞄开启.borderWidth=1.5;
    自瞄开启.text = @"触摸自瞄          √";
    自瞄开启.hidden=YES;
    自瞄开启.textAlignment = NSTextAlignmentCenter;
    自瞄开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    自瞄开启.textColor = [UIColor greenColor];
     [View addSubview:自瞄开启];*/


    //第一个
    骨骼青色状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 148, 100, 10)];
    骨骼青色状态.layer.cornerRadius=0;
    骨骼青色状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
     [骨骼青色状态 setTitle:@" " forState:UIControlStateNormal];
     [骨骼青色状态 addTarget:self action:@selector(骨骼青色:) forControlEvents:UIControlEventTouchUpInside];
     [View addSubview:骨骼青色状态];
     

    骨骼黄色状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 148, 100, 10)];
    骨骼黄色状态.layer.cornerRadius=0;
    骨骼黄色状态.hidden=YES;
    骨骼黄色状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
     [骨骼黄色状态 setTitle:@" " forState:UIControlStateNormal];
     [骨骼黄色状态 addTarget:self action:@selector(骨骼黄色:) forControlEvents:UIControlEventTouchUpInside];
     [View addSubview:骨骼黄色状态];
    
    //第一个
    骨骼青色 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 148,100, 15)];
    骨骼青色.numberOfLines = 0;
    骨骼青色.lineBreakMode = NSLineBreakByCharWrapping;
    骨骼青色.text = @"骨骼颜色         青";
    骨骼青色.borderColor=[UIColor blackColor];
    骨骼青色.borderWidth=1.5;
    骨骼青色.textAlignment = NSTextAlignmentCenter;
    骨骼青色.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    骨骼青色.textColor = [UIColor colorWithRed:0 green:2 blue:2 alpha:2];
     [View addSubview:骨骼青色];


 
    骨骼黄色 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 148, 100, 15)];
    骨骼黄色.numberOfLines = 0;
    骨骼黄色.lineBreakMode = NSLineBreakByCharWrapping;
    骨骼黄色.borderColor=[UIColor blackColor];
    骨骼黄色.borderWidth=1.5;
    骨骼黄色.text = @"骨骼颜色         黄";
    骨骼黄色.hidden=YES;
    骨骼黄色.textAlignment = NSTextAlignmentCenter;
    骨骼黄色.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    骨骼黄色.textColor = [UIColor yellowColor];
     [View addSubview:骨骼黄色];
   
    
    
    
    
    
    图片持枪开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 163, 100, 10)];
    图片持枪开启状态.layer.cornerRadius=0;
    图片持枪开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    [图片持枪开启状态 setTitle:@" " forState:UIControlStateNormal];
    [图片持枪开启状态 addTarget:self action:@selector(图片持枪开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:图片持枪开启状态];
    
    
    图片持枪关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 163, 100, 10)];
    图片持枪关闭状态.layer.cornerRadius=0;
    图片持枪关闭状态.hidden=YES;
    图片持枪关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    [图片持枪关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [图片持枪关闭状态 addTarget:self action:@selector(图片持枪关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:图片持枪关闭状态];
    图片持枪关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 163,100, 15)];
    图片持枪关闭.numberOfLines = 0;
    图片持枪关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    图片持枪关闭.text = @"手持风格       文字";
    图片持枪关闭.borderColor=[UIColor blackColor];
    图片持枪关闭.borderWidth=1.5;
    图片持枪关闭.textAlignment = NSTextAlignmentCenter;
    图片持枪关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    图片持枪关闭.textColor = [UIColor yellowColor];
    [View addSubview:图片持枪关闭];


    图片持枪开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 163, 100, 15)];
    图片持枪开启.numberOfLines = 0;
    图片持枪开启.lineBreakMode = NSLineBreakByCharWrapping;
    图片持枪开启.borderColor=[UIColor blackColor];
    图片持枪开启.borderWidth=1.5;
    图片持枪开启.text = @"手持风格       图片";
    图片持枪开启.hidden=YES;
    图片持枪开启.textAlignment = NSTextAlignmentCenter;
    图片持枪开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    图片持枪开启.textColor = [UIColor yellowColor];
    [View addSubview:图片持枪开启];
    
    /*
    触摸类型灵哲开启状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 178, 100, 10)];
    触摸类型灵哲开启状态.layer.cornerRadius=0;
    触摸类型灵哲开启状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    触摸类型灵哲开启状态.hidden =YES;
    [触摸类型灵哲开启状态 setTitle:@" " forState:UIControlStateNormal];
    [触摸类型灵哲开启状态 addTarget:self action:@selector(触摸类型灵哲开启:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:触摸类型灵哲开启状态];
    
    
    触摸类型灵哲关闭状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 178, 100, 10)];
    触摸类型灵哲关闭状态.layer.cornerRadius=0;
    触摸类型灵哲关闭状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    [触摸类型灵哲关闭状态 setTitle:@" " forState:UIControlStateNormal];
    [触摸类型灵哲关闭状态 addTarget:self action:@selector(触摸类型灵哲关闭:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:触摸类型灵哲关闭状态];
    触摸类型灵哲关闭 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 178,100, 15)];
    触摸类型灵哲关闭.numberOfLines = 0;
    触摸类型灵哲关闭.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    触摸类型灵哲关闭.text = @"触摸类型       灵吒";
    触摸类型灵哲关闭.borderColor=[UIColor blackColor];
    触摸类型灵哲关闭.borderWidth=1.5;
    触摸类型灵哲关闭.textAlignment = NSTextAlignmentCenter;
    触摸类型灵哲关闭.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    触摸类型灵哲关闭.textColor = [UIColor yellowColor];
    [View addSubview:触摸类型灵哲关闭];


    触摸类型灵哲开启 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 178, 100, 15)];
    触摸类型灵哲开启.numberOfLines = 0;
    触摸类型灵哲开启.lineBreakMode = NSLineBreakByCharWrapping;
    触摸类型灵哲开启.borderColor=[UIColor blackColor];
    触摸类型灵哲开启.borderWidth=1.5;
    触摸类型灵哲开启.text = @"触摸类型       系统";
    触摸类型灵哲开启.hidden=YES;
    触摸类型灵哲开启.textAlignment = NSTextAlignmentCenter;
    触摸类型灵哲开启.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    触摸类型灵哲开启.textColor = [UIColor yellowColor];
    [View addSubview:触摸类型灵哲开启];
    
    自瞄速度快状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 193, 100, 10)];
    自瞄速度快状态.layer.cornerRadius=0;
    自瞄速度快状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    自瞄速度快状态.hidden =YES;
    [自瞄速度快状态 setTitle:@" " forState:UIControlStateNormal];
    [自瞄速度快状态 addTarget:self action:@selector(自瞄速度快到中:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:自瞄速度快状态];
    
    
    自瞄速度中状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 193, 100, 10)];
    自瞄速度中状态.layer.cornerRadius=0;
    自瞄速度中状态.hidden=YES;
    自瞄速度中状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    [自瞄速度中状态 setTitle:@" " forState:UIControlStateNormal];
    [自瞄速度中状态 addTarget:self action:@selector(自瞄速度中到慢:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:自瞄速度中状态];
    
    自瞄速度慢状态 = [[UIButton alloc]initWithFrame:CGRectMake(0, 193, 100, 10)];
    自瞄速度慢状态.layer.cornerRadius=0;
    自瞄速度慢状态.hidden=YES;
    自瞄速度慢状态.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0];
    [自瞄速度慢状态 setTitle:@" " forState:UIControlStateNormal];
    [自瞄速度慢状态 addTarget:self action:@selector(自瞄速度慢到快:) forControlEvents:UIControlEventTouchUpInside];
    [View addSubview:自瞄速度慢状态];
    
    
    
    
    
    自瞄速度快 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 193,100, 15)];
    自瞄速度快.numberOfLines = 0;
    自瞄速度快.lineBreakMode = NSLineBreakByCharWrapping;
    //   BT.text = @"Tox单绘制";
    自瞄速度快.text = @"触摸速度       快速";
    自瞄速度快.borderColor=[UIColor blackColor];
    自瞄速度快.borderWidth=1.5;
    自瞄速度快.textAlignment = NSTextAlignmentCenter;
    自瞄速度快.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    自瞄速度快.hidden=YES;
    自瞄速度快.textColor = [UIColor yellowColor];
    [View addSubview:自瞄速度快];


    自瞄速度中 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 193, 100, 15)];
    自瞄速度中.numberOfLines = 0;
    自瞄速度中.lineBreakMode = NSLineBreakByCharWrapping;
    自瞄速度中.borderColor=[UIColor blackColor];
    自瞄速度中.borderWidth=1.5;
    自瞄速度中.text = @"触摸速度       中速";
    自瞄速度中.hidden=YES;
    自瞄速度中.textAlignment = NSTextAlignmentCenter;
    自瞄速度中.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    自瞄速度中.textColor = [UIColor yellowColor];
    [View addSubview:自瞄速度中];

    自瞄速度慢 = [[MGPGLabel alloc] initWithFrame:CGRectMake(0, 193, 100, 15)];
    自瞄速度慢.numberOfLines = 0;
    自瞄速度慢.lineBreakMode = NSLineBreakByCharWrapping;
    自瞄速度慢.borderColor=[UIColor blackColor];
    自瞄速度慢.borderWidth=1.5;
    自瞄速度慢.text = @"触摸速度       慢速";

    自瞄速度慢.textAlignment = NSTextAlignmentCenter;
    自瞄速度慢.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    自瞄速度慢.textColor = [UIColor yellowColor];
    [View addSubview:自瞄速度慢];
    */
    
    



//   [[HUDRootViewController ESPViewa] addSubview:View];
}


-(void)总开关关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"总开关"];
    总开关开启状态.hidden=NO;
    总开关关闭状态.hidden=YES;
    总开关关闭.hidden=NO;
    总开关开启.hidden=YES;
    
    
}
-(void)总开关开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"总开关"];
    总开关关闭状态.hidden=NO;
    总开关开启状态.hidden=YES;
    总开关关闭.hidden=YES;
    总开关开启.hidden=NO;
    
    
}
-(void)过直播关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"过直播开关"];
    过直播开启状态.hidden=NO;
    过直播关闭状态.hidden=YES;
    过直播关闭.hidden=NO;
    过直播开启.hidden=YES;
    
    
}
-(void)过直播开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"过直播开关"];
    过直播关闭状态.hidden=NO;
    过直播开启状态.hidden=YES;
    过直播关闭.hidden=YES;
    过直播开启.hidden=NO;
    
    
}



-(void)射线关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"射线开关"];
    射线开启状态.hidden=NO;
    射线关闭状态.hidden=YES;
    射线关闭.hidden=NO;
    射线开启.hidden=YES;
    
    
}
-(void)射线开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"射线开关"];
    射线关闭状态.hidden=NO;
    射线开启状态.hidden=YES;
    射线关闭.hidden=YES;
    射线开启.hidden=NO;
    
    
}
-(void)信息关闭:(id)sender {
   
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"距离开关"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"血条开关"];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"名字开关"];
    
    信息开启状态.hidden=NO;
    信息关闭状态.hidden=YES;
    信息关闭.hidden=NO;
    信息开启.hidden=YES;
    
    
}
-(void)信息开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"距离开关"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"血条开关"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"名字开关"];
    信息关闭状态.hidden=NO;
    信息开启状态.hidden=YES;
    信息关闭.hidden=YES;
    信息开启.hidden=NO;
    
    
}
-(void)骨骼关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"骨骼开关"];
    骨骼开启状态.hidden=NO;
    骨骼关闭状态.hidden=YES;
    骨骼关闭.hidden=NO;
    骨骼开启.hidden=YES;
    
    
}
-(void)骨骼开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"骨骼开关"];
    骨骼关闭状态.hidden=NO;
    骨骼开启状态.hidden=YES;
    骨骼关闭.hidden=YES;
    骨骼开启.hidden=NO;
    
    
}
-(void)持枪关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"手持武器开关"];
    持枪开启状态.hidden=NO;
    持枪关闭状态.hidden=YES;
    持枪关闭.hidden=NO;
    持枪开启.hidden=YES;
    
    
}
-(void)持枪开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"手持武器开关"];
    持枪开启状态.hidden=YES;
    持枪关闭状态.hidden=NO;
    持枪关闭.hidden=YES;
    持枪开启.hidden=NO;
    
    
}
-(void)图片持枪关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"文字手持"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"图片手持"];
    
    图片持枪开启状态.hidden=NO;
    图片持枪关闭状态.hidden=YES;
    图片持枪关闭.hidden=NO;
    图片持枪开启.hidden=YES;
    
    
}
-(void)图片持枪开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"文字手持"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"图片手持"];
    
    图片持枪关闭状态.hidden=NO;
    图片持枪开启状态.hidden=YES;
    图片持枪关闭.hidden=YES;
    图片持枪开启.hidden=NO;
    
    
}



-(void)自瞄关闭:(id)sender {
    
   
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"自瞄开关"];
    
   

    自瞄开启状态.hidden=NO;
    自瞄关闭状态.hidden=YES;
    自瞄关闭.hidden=NO;
    自瞄开启.hidden=YES;
  
}
-(void)自瞄开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"自瞄开关"];
 
    自瞄关闭状态.hidden=NO;
    自瞄开启状态.hidden=YES;
    自瞄关闭.hidden=YES;
    自瞄开启.hidden=NO;

    
}

-(void)触摸类型灵哲关闭:(id)sender {
    
    触摸类型灵哲开启状态.hidden=NO;
    触摸类型灵哲关闭状态.hidden=YES;
    触摸类型灵哲关闭.hidden=NO;
    触摸类型灵哲开启.hidden=YES;
  
}
-(void)触摸类型灵哲开启:(id)sender {
    
    触摸类型灵哲关闭状态.hidden=NO;
    触摸类型灵哲开启状态.hidden=YES;
    触摸类型灵哲关闭.hidden=YES;
    触摸类型灵哲开启.hidden=NO;
   
    
}

-(void)自瞄速度快转中:(id)sender {
    
    自瞄速度=0.5;
    自瞄速度慢.hidden=YES;
    自瞄速度中.hidden=NO;
    自瞄速度快.hidden=YES;
    
    
    
    
    自瞄速度慢状态.hidden=YES;
    自瞄速度中状态.hidden=NO;
    自瞄速度快状态.hidden=YES;
    
    
}
-(void)自瞄速度中转慢:(id)sender {
    自瞄速度=0.2;
    自瞄速度慢状态.hidden=NO;
    自瞄速度中状态.hidden=YES;
    自瞄速度快状态.hidden=YES;
    
    
    自瞄速度慢.hidden=NO;
    自瞄速度中.hidden=YES;
    自瞄速度快.hidden=YES;
    
    
}
-(void)自瞄速度慢转快:(id)sender {
    自瞄速度=0.;
    自瞄速度慢状态.hidden=YES;
    自瞄速度中状态.hidden=YES;
    自瞄速度快状态.hidden=NO;


    自瞄速度慢.hidden=YES;
    自瞄速度中.hidden=YES;
    自瞄速度快.hidden=NO;
    
    
}







-(void)无后关闭:(id)sender {
    
   
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"无后开关"];
    
   
     
    
    
    无后开启状态.hidden=NO;
    无后关闭状态.hidden=YES;
    无后关闭.hidden=NO;
    无后开启.hidden=YES;
    
    
}
-(void)无后开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"无后开关"];
    
    无后关闭状态.hidden=NO;
    无后开启状态.hidden=YES;
    无后关闭.hidden=YES;
    无后开启.hidden=NO;
    
    
}
-(void)聚点关闭:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"聚点开关"];


    
    
    聚点开启状态.hidden=NO;
    聚点关闭状态.hidden=YES;
    聚点关闭.hidden=NO;
    聚点开启.hidden=YES;
    
    
}
-(void)聚点开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"聚点开关"];

    聚点关闭状态.hidden=NO;
    聚点开启状态.hidden=YES;
    聚点关闭.hidden=YES;
    聚点开启.hidden=NO;
    
    
}
-(void)防抖关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"防抖开关"];

       
    防抖开启状态.hidden=NO;
    防抖关闭状态.hidden=YES;
    防抖关闭.hidden=NO;
    防抖开启.hidden=YES;
    
    
}
-(void)防抖开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"防抖开关"];

        
    防抖关闭状态.hidden=NO;
    防抖开启状态.hidden=YES;
    防抖关闭.hidden=YES;
    防抖开启.hidden=NO;
    
    
}



-(void)骨骼青色:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"骨骼黄色"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"骨骼青色"];

       
    骨骼青色状态.hidden=YES;
    骨骼黄色状态.hidden=NO;
    骨骼青色.hidden=NO;
    骨骼黄色.hidden=YES;
    
    
}
-(void)骨骼黄色:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"骨骼黄色"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"骨骼青色"];
    骨骼青色状态.hidden=NO;
    骨骼黄色状态.hidden=YES;
    骨骼青色.hidden=YES;
    骨骼黄色.hidden=NO;
    
    
}




-(void)射线变色开启:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"距离判断开关"];
       
   射线变色开启状态.hidden=YES;
    射线变色关闭状态.hidden=NO;
    射线变色关闭.hidden=YES;
    射线变色开启.hidden=NO;
    
    
}
-(void)射线变色关闭:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"距离判断开关"];
   
        
    射线变色关闭状态.hidden=YES;
    射线变色开启状态.hidden=NO;
    射线变色关闭.hidden=NO;
    射线变色开启.hidden=YES;
    
    
}
 



























- (void)关闭菜单{
    
    View.hidden = YES;
    
    
}
- (void)SJSD:(UISlider *)slider
{
    MyLabel.text = [NSString stringWithFormat:@"%.2f",slider.value];
    
    
    
}



- (void)swChange:(UISwitch*)sw{
    NSInteger a =sw.tag;
    if(sw.on==YES){
        NSLog(@"开关%ld被打开",a);
        if (a==1) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"总开关"];
        }
        if (a==2) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"射线开关"];
        }
        if (a==3) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"骨骼开关"];
        }
        if (a==4) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"名字开关"];
        }
        if (a==5) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"附近人数开关"];
        }
        if (a==6) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"过直播开关"];
        }
        if (a==7) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"距离开关"];
        }
        
        if (a==8) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"血条开关"];
        }
        
        if (a==9) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"手持武器开关"];
        }
        if (a==10) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"距离判断开关"];
        }
        
        if (a==11) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"无后开关"];
        }
        if (a==12) {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"聚点开关"];
        }
        
        
        
    }else{
        NSLog(@"开关%ld被打开",a);
        if (a==1) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"总开关"];
        }
        if (a==2) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"射线开关"];
        }
        if (a==3) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"骨骼开关"];
        }
        if (a==4) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"名字开关"];
        }
        if (a==5) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"附近人数开关"];
        }
        if (a==6) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"过直播开关"];
        }
        if (a==7) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"距离开关"];
        }
        
        
        if (a==8) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"血条开关"];
        }
        
        if (a==9) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"手持武器开关"];
        }
        if (a==10) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"距离判断开关"];
        }
        
        if (a==11) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"无后开关"];
        }
        if (a==12) {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"聚点开关"];
        }
        
        
        
        
    }
}

@end


