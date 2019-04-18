//
//  BBLogVC.h
//  BonreeBox
//
//  Created by bonree on 2019/4/12.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <UITableView_FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
NS_ASSUME_NONNULL_BEGIN

@interface BBLogVC : UIViewController
@property(nonatomic,strong)UIButton *controlDisplayBtn;
-(void)addLog:(NSString *)logStr;
@end

NS_ASSUME_NONNULL_END
