//
//  UIWindow+FindWindFun.m
//  BonreeBox
//
//  Created by bonree on 2019/4/18.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import "UIWindow+FindWindFun.h"

@implementation UIWindow (FindWindFun)

// 私有方法，全别用来上传app staore
#ifdef DEBUG
+(UIWindow *)_findWindowForControllingOverallAppearance {
    
    return [UIApplication sharedApplication].delegate.window;
}
#endif
@end
