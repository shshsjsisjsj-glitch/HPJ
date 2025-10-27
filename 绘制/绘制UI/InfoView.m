/*#import "InfoView.h"
#import "MGPGLabel.h"
@interface InfoView()
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@end

@implementation InfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {

       
     _disLb = [[UILabel alloc]initWithFrame:CGRectMake(0+20, 0+100, 60, 7)];
        

        _disLb.textAlignment=NSTextAlignmentCenter;
        _disLb.textColor = [UIColor whiteColor];
        _disLb.font = [UIFont boldSystemFontOfSize:9];
        _disLb.backgroundColor = [UIColor clearColor];
        [self addSubview:_disLb];
        
        UIView *infoBar = [[UIView alloc] initWithFrame:CGRectMake(0+20, 0+30, 60, 5)];
        infoBar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        infoBar.layer.cornerRadius=0;
        infoBar.layer.masksToBounds=YES;
        infoBar.layer.borderColor = [[UIColor blackColor]CGColor];
        infoBar.layer.borderWidth=1;
        [self addSubview:infoBar];
        UIView *xtk = [[UIView alloc] initWithFrame:CGRectMake(0+20, 0+30, 15, 5)];
        xtk.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        xtk.layer.cornerRadius=0;
        xtk.layer.masksToBounds=YES;
        xtk.layer.borderColor = [[UIColor blackColor]CGColor];
        xtk.layer.borderWidth=1;
        [self addSubview:xtk];
        UIView *xtk2 = [[UIView alloc] initWithFrame:CGRectMake(0+20, 0+30, 30, 5)];
        xtk2.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        xtk2.layer.cornerRadius=0;
        xtk2.layer.masksToBounds=YES;
        xtk2.layer.borderColor = [[UIColor blackColor]CGColor];
        xtk2.layer.borderWidth=1;
        [self addSubview:xtk2];
        UIView *xtk3 = [[UIView alloc] initWithFrame:CGRectMake(0+20, 0+30, 45, 5)];
        xtk3.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
        xtk3.layer.cornerRadius=0;
        xtk3.layer.masksToBounds=YES;
        xtk3.layer.borderColor = [[UIColor blackColor]CGColor];
        xtk3.layer.borderWidth=1;
        [self addSubview:xtk3];
        
        UIView *xtk4 = [[UIView alloc] initWithFrame:CGRectMake(0+20, 0+30, 60, 5)];
        xtk4.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
        xtk4.layer.cornerRadius=0;
        xtk4.layer.masksToBounds=YES;
        xtk4.layer.borderColor = [[UIColor blackColor]CGColor];
        xtk4.layer.borderWidth=1;
        [self addSubview:xtk4];

        
        
        
        

        _xueBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0+30, 60, 5)];
        _xueBar.backgroundColor = [UIColor colorWithRed:0.99 green:0.38 blue:0.42 alpha:0.0];
        [infoBar addSubview:_xueBar];
       _teamLb = [[UILabel alloc]initWithFrame:CGRectMake(0+10, 0-15+30, 20, 17)];
        _teamLb.textAlignment=NSTextAlignmentCenter;
        _teamLb.textColor = [UIColor yellowColor];
        
       
        _teamLb.backgroundColor = [UIColor colorWithRed:0.00 green:2.55 blue:2.55 alpha:0.00];//这里改队标背景颜色
        _teamLb.font = [UIFont boldSystemFontOfSize:9];//字体大小
        [self addSubview:_teamLb];
          _nameLb = [[UILabel alloc]initWithFrame:CGRectMake(20+10, 0-15+30, 80, 17)];
        _nameLb.textColor = [UIColor yellowColor];
        _nameLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.0];
        _nameLb.font = [UIFont boldSystemFontOfSize:9];
        [self addSubview:_nameLb];
      
   
       
        
        
    }
    return self;
  
    
    
    
}


#pragma mark----实现类方法
-(UIColor*)colorWithHex:(NSUInteger)hex
                  alpha:(CGFloat)alpha
{
    float r, g, b, a;
    a = alpha;
    b = hex & 0x0000FF;
    hex = hex >> 8;
    g = hex & 0x0000FF;
    hex = hex >> 8;
    r = hex;
    
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:a];
}
#pragma mark--给属性重新赋值
-(void)setDis:(CGFloat)dis
{
    _disLb.text=[NSString stringWithFormat:@"%dm",(int)dis];//距离
}

-(void)setName:(NSString *)name
{
    _nameLb.text=[NSString stringWithFormat:@" %@",name];//名字
}


-(void)setTeam:(UInt8)team
{
    _teamLb.text=[NSString stringWithFormat:@"%d",team];//队编
}



-(void)setXue:(CGFloat)xue
{
    _xueBar.frame = CGRectMake(0, 0, xue-40, 5);
}

-(void)setAi:(Boolean)ai
{
    if(ai) {
  //   _delta.fillColor =[UIColor colorWithRed:0.07 green: 0.79 blue: 0.68 alpha:0.4].CGColor;

       _xueBar.backgroundColor = [UIColor greenColor];
        
      //  _xueBar.backgroundColor = [UIColor colorWithRed:0.892 green: 0.892 blue: 0.892 alpha:0.8];
        
        
        
        
          } else {
          //    _delta.fillColor =[UIColor colorWithRed:0.99 green:0.38 blue:0.42 alpha:0.4].CGColor;

              
              
            _xueBar.backgroundColor = [UIColor redColor];
         //     _xueBar.backgroundColor = [UIColor colorWithRed:0.00
              
              
        
    }
    
}

@end
*/
#import "InfoView.h"

@interface InfoView()

@end

@implementation InfoView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _disLb = [[MGPGLabel alloc]initWithFrame:CGRectMake(0, 0+100, 100, 10)];
        _disLb.borderColor=[UIColor blackColor];
        _disLb.borderWidth=0.7;
        _disLb.textAlignment=NSTextAlignmentCenter;
        _disLb.textColor = [UIColor whiteColor];
        _disLb.font = [UIFont boldSystemFontOfSize:9];
        _disLb.backgroundColor = [UIColor clearColor];
        [self addSubview:_disLb];
        
        _infoBar = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 100, 15)];
        _infoBar.backgroundColor = [UIColor clearColor];
        _infoBar.layer.masksToBounds=YES;
        _infoBar.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.00];
        [self addSubview:_infoBar];
        
        _teamLb = [[MGPGLabel alloc]initWithFrame:CGRectMake(0, 0, 20, 15)];
        _teamLb.borderColor=[UIColor blackColor];
        _teamLb.borderWidth=0.7;
        _teamLb.textAlignment=NSTextAlignmentCenter;
        _teamLb.textColor = [UIColor whiteColor];
        _teamLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.30];
        _teamLb.font = [UIFont boldSystemFontOfSize:9];
        [_infoBar addSubview:_teamLb];
        
        _nameLb = [[MGPGLabel alloc]initWithFrame:CGRectMake(20, 0, 80, 15)];
        _nameLb.borderColor=[UIColor blackColor];
        _nameLb.borderWidth=0.7;
        _nameLb.textColor = [UIColor whiteColor];
        _nameLb.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.00];
        _nameLb.font = [UIFont boldSystemFontOfSize:9];
        [_infoBar addSubview:_nameLb];
        
        _xueBar = [[UIView alloc] initWithFrame:CGRectMake(0, 25, 100, 2)];
        _xueBar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
        [self addSubview:_xueBar];
        
        _delta = [CAShapeLayer layer];
        _delta.strokeColor = [UIColor clearColor].CGColor;
        _delta.fillColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.45].CGColor;
        UIBezierPath *delb = [UIBezierPath bezierPath];
        [delb moveToPoint:CGPointMake(45, 27)];
        [delb addLineToPoint:CGPointMake(50, 32)];
        [delb addLineToPoint:CGPointMake(55, 27)];
        [delb closePath];
        _delta.path = delb.CGPath;
        [self.layer addSublayer:_delta];
    }
    return self;
}

#pragma mark--功能性方法
-(UIColor*)colorWithHex:(NSUInteger)hex
                  alpha:(CGFloat)alpha
{
    float r, g, b, a;
    a = alpha;
    b = hex & 0x0000FF;
    hex = hex >> 8;
    g = hex & 0x0000FF;
    hex = hex >> 8;
    r = hex;

    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                           blue:b/255.0f
                           alpha:a];
}

#pragma mark--给属性重新赋值
-(void)setDis:(CGFloat)dis
{
    _disLb.text=[NSString stringWithFormat:@"[%.fM]",dis];
}

-(void)setName:(NSString *)name
{
    _nameLb.text=[NSString stringWithFormat:@" %@",name];
}

-(void)setTeam:(UInt8)team
{
  NSUInteger colorArray[] = {0x191970,0xDC143C,0x00BFFF,0x008080,0xFF8C00,0xFF4500,0x8B0000,0x8A2BE2,0x6A5ACD,0x082E54,0x333333,0x333366,0x336633,0x336633,0x339999,0x33CCCC,0x663333,0x663366,0x663366,0x999933,0xCC3366,0xCC6666,0xCC6633,0xFF9966,0x660066};
 //   NSUInteger colorArray[] = {0x333333,0x333366,0x336633,0x336633,0x339999,0x33CCCC,0x663333,0x663366,0x663366,0x999933,0xCC3366,0xCC6666,0xCC6633,0xFF9966,0x660066};
    UIColor *color = [self colorWithHex:colorArray[team % (sizeof(colorArray)/8)] alpha:0.4];
    _infoBar.backgroundColor = color;
    _delta.fillColor = color.CGColor;
    if(team==1){
        _teamLb.text=[NSString stringWithFormat:@"01"];
    }else if(team==2){
        _teamLb.text=[NSString stringWithFormat:@"02"];
    }else if(team==3){
        _teamLb.text=[NSString stringWithFormat:@"03"];
    }else if(team==4){
        _teamLb.text=[NSString stringWithFormat:@"04"];
    }else if(team==5){
        _teamLb.text=[NSString stringWithFormat:@"05"];
    }else if(team==6){
        _teamLb.text=[NSString stringWithFormat:@"06"];
    }else if(team==7){
        _teamLb.text=[NSString stringWithFormat:@"07"];
    }else if(team==8){
        _teamLb.text=[NSString stringWithFormat:@"08"];
        
    }else if(team==9){
        _teamLb.text=[NSString stringWithFormat:@"09"];
    }else{
        _teamLb.text=[NSString stringWithFormat:@"%d",team];
        
        
        
        
        
    }
   
}

-(void)setPoint:(CGPoint)point
{
    CGPoint centerPoint = CGPointMake(UIScreen.mainScreen.bounds.size.width * 0.5, UIScreen.mainScreen.bounds.size.height * 0.5);
    float xDis,yDis,centerDis;
    xDis = point.x + 50 - centerPoint.x;
    yDis = point.y + 32 - centerPoint.y;
    centerDis = sqrt(xDis*xDis+yDis*yDis);
    if(centerDis <= 50) {
        _disLb.hidden = YES;
        _infoBar.hidden = YES;
    } else {
        _disLb.hidden = NO;
        _infoBar.hidden = NO;
    }
    self.center=point;
}

-(void)setXue:(CGFloat)xue
{
   // if(xue > 100) xue = 100;
    _xueBar.frame = CGRectMake(0, 25, xue, 2);
}

-(void)setAi:(Boolean)ai
{
    if(ai) {

        _xueBar.backgroundColor = [self colorWithHex:0x19CAAD alpha:0.6];
    } else {
        _xueBar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.6];
    }
}

@end

