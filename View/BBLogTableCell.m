//
//  BBLogTableCell.m
//  BonreeBox
//
//  Created by bonree on 2019/4/12.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import "BBLogTableCell.h"

@implementation BBLogTableCell

-(UILabel *)logLable {
    
    if (!_logLable) {
        _logLable = [UILabel labelWithTextColor:[UIColor blackColor] font:Font(10)];
        _logLable.numberOfLines = 0;
    }
    
    return _logLable;
}


#pragma mark - Lifecycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self createSubViews];
        [self layoutUI];
        [self bindSignal];
        self.backgroundColor = ClearColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

#pragma mark - privateMethod
-(void)createSubViews {
    
    [self.contentView addSubview:self.logLable];

}

-(void)layoutUI {
    
    [self.logLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@(13.5));
        make.top.equalTo(@(0));
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.right.equalTo(self.contentView.mas_right).offset(-13.5);
    }];
    
    
}


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    
    return YES;
}

-(void)copy:(id)sender {
    
    
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *tpm= [super hitTest:point withEvent:event];
    
    if (tpm == self || tpm == self.contentView) {
        
        return nil;
    } else {
        
        return tpm;
    }
}

-(void)bindSignal {
    
}
@end
