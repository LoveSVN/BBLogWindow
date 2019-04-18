//
//  BBLogTool.h
//  BonreeBox
//
//  Created by bonree on 2019/4/12.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBLogTool : NSObject
+ (instancetype)sharedManager;
@property(nonatomic,assign)BOOL hidden;
- (void)initialization;
-(void)diplayLogStr:(NSString *)logStr;
@end

NS_ASSUME_NONNULL_END
