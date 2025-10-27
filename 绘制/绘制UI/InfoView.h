//
//  Created by Shadow on 2021/5/1.
//
#import "MGPGLabel.h"
#import <UIKit/UIKit.h>

@interface InfoView : UIView

@property(nonatomic,retain)MGPGLabel *teamLb;
@property(nonatomic,retain)MGPGLabel *nameLb;
@property(nonatomic,retain)MGPGLabel *disLb;
@property(nonatomic,retain)UIView *infoBar;
@property(nonatomic,retain)UIView *xueBar;
@property(nonatomic,retain)CAShapeLayer *delta;
@property(nonatomic,retain)UILabel *shouchi;
@property(nonatomic)NSString* shouchi2;



@property(nonatomic,retain)NSString *name;
@property(nonatomic)CGFloat dis;
@property(nonatomic)CGFloat xue;
@property(nonatomic)UInt8 team;
@property(nonatomic)Boolean ai;

@end
