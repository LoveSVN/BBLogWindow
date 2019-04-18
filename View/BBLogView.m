//
//  BBLogView.m
//  BonreeBox
//
//  Created by bonree on 2019/4/12.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import "BBLogView.h"

@implementation BBLogView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *tpm= [super hitTest:point withEvent:event];
    
    if (tpm == self) {
        
        return nil;
    } else {
        
        return tpm;
    }
}
@end
