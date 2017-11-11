//
//  ViewController.m
//  TestForFullSeePhoto
//
//  Created by donglyu on 2017/11/2.
//  Copyright © 2017年 donglyu. All rights reserved.
//

#import "ViewController.h"
#import "PhotoScrollSeeTableCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    
    
    
}


#pragma mark - TableView datasource delegate.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 13;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kTableViewCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PhotoScrollSeeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photosee"];
    if (cell == nil) {
        cell = [[PhotoScrollSeeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"photosee"];
        cell.tableView = tableView;
    }
    
    [cell loadImageWithIndex:indexPath.row];
    return cell;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"tableViewScrollNoti" object:[NSNumber numberWithInteger:scrollView.contentOffset.y]];
    
}

#pragma mark - Other
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
