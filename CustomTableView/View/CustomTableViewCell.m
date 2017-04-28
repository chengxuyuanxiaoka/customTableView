//
//  CustomTableViewCell.m
//  CustomTableView
//
//  Created by 一米阳光 on 2017/4/17.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

//重写初始化方法:将控件添加到单元格上,如果将子视图控件添加到cell上 借助contenView视图,这样的话cell上子视图会随着cell的变化而变化
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, self.bounds.size.width-200, 40)];
        self.labelName.textColor = [UIColor cyanColor];
        self.labelName.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.labelName];
        
        self.labelNum = [[UILabel alloc] initWithFrame:CGRectMake(100, 40, self.bounds.size.width-200, 40)];
        self.labelNum.textColor = [UIColor greenColor];
        self.labelNum.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.labelNum];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
