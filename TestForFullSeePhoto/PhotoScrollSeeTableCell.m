//
//  PhotoScrollSeeTableCell.m
//  TestForFullSeePhoto
//
//  Created by donglyu on 2017/11/11.
//  Copyright © 2017年 donglyu. All rights reserved.
//

#import "PhotoScrollSeeTableCell.h"

@interface PhotoScrollSeeTableCell ()

@property (nonatomic, weak) UIImageView * showImageView;

@end



@implementation PhotoScrollSeeTableCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveTableViewScroll:) name:@"tableViewScrollNoti" object:nil];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.image = [UIImage imageNamed:@"sample"];
        [self.contentView addSubview:imageView];
        _showImageView = imageView;
        
        imageView.frame = CGRectMake( 0, 0, [UIScreen mainScreen].bounds.size.width, 250 + kImageOffMaxY);// 上下各10padding。
        
        
        
    }
    return self;
}

#pragma mark - Public

//- (void)scroll
- (void)loadImageWithIndex:(NSInteger)index{
    NSString *imageName = [NSString stringWithFormat:@"image%02ld", (long)index];
    UIImage *image = [UIImage imageNamed:imageName];
    self.showImageView.image = image;
}

#pragma mark - Noti
- (void)receiveTableViewScroll:(NSNotification *)noti{
    if (self.tableView == nil) {
        return;
    }
    
    CGRect convertRectInTableView = [self convertRect:self.contentView.frame toView:self.tableView.superview];
//    NSLog(@"convertRect: %f", convertRectInTableView.origin.y);
    
    
    CGFloat newYForShowImageView = 0;
    if (convertRectInTableView.origin.y < 0) {
        newYForShowImageView = 0;
    }else{
        newYForShowImageView = convertRectInTableView.origin.y / self.tableView.frame.size.height *kImageOffMaxY;
    }
    
    
    NSLog(@"--------------  caclulate Y : %f", newYForShowImageView);
    self.showImageView.frame = CGRectMake(self.showImageView.frame.origin.x, -newYForShowImageView, self.showImageView.frame.size.width, self.showImageView.frame.size.height);
    
    
}

#pragma mark - Other
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)prepareForReuse{
    [super prepareForReuse];
    self.showImageView.frame = CGRectMake(self.showImageView.frame.origin.x, 0, self.showImageView.frame.size.width, self.showImageView.frame.size.height);
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
