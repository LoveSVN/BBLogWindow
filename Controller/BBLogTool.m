//
//  BBLogTool.m
//  BonreeBox
//
//  Created by bonree on 2019/4/12.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import "BBLogTool.h"
#import "BBLogVC.h"
#import "BBLogWindow.h"
static id StaicZone = nil;

@interface BBLogTool ()
@property(nonatomic,strong)BBLogVC *logVC;
@property(nonatomic,strong)BBLogWindow *window;
@end

@implementation BBLogTool

+ (instancetype)sharedManager {
    
    return [[self alloc] init];
}

- (void)initialization {
    
    self.logVC = [BBLogVC new];
    BBLogWindow *window = [BBLogWindow window];
    self.window = window;
    window.windowLevel = UIWindowLevelNormal;
    window.rootViewController = self.logVC;
    [window makeKeyAndVisible];
    self.hidden = YES;
    
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        StaicZone =  [super allocWithZone:zone];
    });
    
    return StaicZone;
}

-(void)diplayLogStr:(NSString *)logStr {
    
    [self.logVC addLog:logStr];
}

-(void)setHidden:(BOOL)hidden {
    _hidden = hidden;
    self.logVC.controlDisplayBtn.hidden = hidden;
}


@end
