//
//  PhotoScrollSeeTableCell.h
//  TestForFullSeePhoto
//
//  Created by donglyu on 2017/11/11.
//  Copyright © 2017年 donglyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kImageOffMaxY 150
#define kTableViewCellHeight 250

@interface PhotoScrollSeeTableCell : UITableViewCell

- (void)loadImageWithIndex:(NSInteger)index;
@property (nonatomic, weak) UITableView *tableView;

@end
