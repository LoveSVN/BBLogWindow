//
//  BBLogVC.m
//  BonreeBox
//
//  Created by bonree on 2019/4/12.
//  Copyright © 2019 Bonree. All rights reserved.
//

#import "BBLogVC.h"
#import "BBLogTableCell.h"
#import "BBLogTableView.h"
#import "BBLogView.h"

@interface BBLogVC ()
@property(nonatomic,strong)NSMutableArray *dataList;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BBLogVC

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = @[].mutableCopy;
    }
    
    return _dataList;
}

-(UIButton *)controlDisplayBtn {
    if (!_controlDisplayBtn) {
        _controlDisplayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _controlDisplayBtn.clipsToBounds = YES;
        _controlDisplayBtn.layer.cornerRadius = 30;
        [_controlDisplayBtn setTitle:@"显示" forState:UIControlStateNormal];
        [_controlDisplayBtn setTitle:@"隐藏" forState:UIControlStateSelected];
        _controlDisplayBtn.backgroundColor = [UIColor blueColor];
    }
    
    return _controlDisplayBtn;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view = [BBLogView new];
    self.view.backgroundColor = [UIColor clearColor];
    [self createSubViews];
    [self layoutSubViews];
    [self bindSignal];
    
}
-(void)createSubViews {
    
    [self createTabaleView];
    [self setupTableView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.controlDisplayBtn];

}

-(void)createTabaleView {
    
    self.tableView = [[BBLogTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
}
-(void)setupTableView {
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[BBLogTableCell class] forCellReuseIdentifier:@"BBLogTableCell"];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.hidden = YES;
}

-(void)layoutSubViews {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [self.controlDisplayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@(60));
        make.width.equalTo(@(60));
        make.centerY.equalTo(self.view.mas_centerY);
        make.right.equalTo(self.view.mas_right);
    }];
}

-(void)bindSignal {
    
    @weakify(self);
    [[self.controlDisplayBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        self.controlDisplayBtn.selected = !self.controlDisplayBtn.selected;
        self.tableView.hidden = !self.controlDisplayBtn.selected;
    }];
    
    UILongPressGestureRecognizer *longPre =  [UILongPressGestureRecognizer new];
    [longPre.rac_gestureSignal subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        
        if (x.state == UIGestureRecognizerStateChanged) {
            
        }
        
    }];
    [self.controlDisplayBtn addGestureRecognizer:longPre];
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat height = [tableView fd_heightForCellWithIdentifier:@"BBLogTableCell" configuration:^(BBLogTableCell * cell) {
        
        cell.logLable.text = self.dataList[indexPath.row];
    }];
    
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BBLogTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBLogTableCell" forIndexPath:indexPath];
    cell.logLable.text = self.dataList[indexPath.row];
    return cell;
}



-(void)addLog:(NSString *)logStr {
    
    if (!logStr) return;
    
    if (self.dataList.count >= 100) {
        
        [self.dataList removeObjectAtIndex:0];
    }
    
    [self.dataList addObject:logStr];
    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataList.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}


@end
