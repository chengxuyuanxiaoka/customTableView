//
//  ViewController.m
//  CustomTableView
//
//  Created by 一米阳光 on 2017/4/17.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "ViewController.h"
#import "DataSource.h"
#import "CustomTableViewCell.h"
#import "TwoViewController.h"

@interface ViewController ()<
UITableViewDataSource,
UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *arrayDS;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDatas];
    [self setupSubviews];
}

- (void)setupDatas {
    //从Model层拿到数据
    NSArray * array = [DataSource getUserInfo];
    //把拿到的数据给我们的数据源
    self.arrayDS = [[NSMutableArray alloc] initWithArray:array];
    self.navigationItem.title = @"自定义单元格";
}

- (void)setupSubviews {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-50, self.view.bounds.size.width, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view insertSubview:view aboveSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayDS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * str = nil;
    if ([[[self.arrayDS objectAtIndex:indexPath.row] objectForKey:@"phoneNum"] hasPrefix:@"100"]) {
        str = @"CustomCell";
        CustomTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.labelName.text = [[self.arrayDS objectAtIndex:indexPath.row] objectForKey:@"personName"];
        cell.labelNum.text = [[self.arrayDS objectAtIndex:indexPath.row] objectForKey:@"phoneNum"];
        return cell;
    } else {
        str = @"SystemCell";
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text = [[self.arrayDS objectAtIndex:indexPath.row] objectForKey:@"phoneNum"];
        return cell;
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:twoVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
