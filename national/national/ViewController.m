//
//  ViewController.m
//  national
//
//  Created by Kaden Jack on 2017/7/26.
//  Copyright © 2017年 Kaden Jack. All rights reserved.
//

#import "ViewController.h"

#define KscreenWidth     [UIScreen mainScreen].bounds.size.width
#define KscreenHeight    [UIScreen mainScreen].bounds.size.height
#define KRGBA(r,g,b,a)   [[UIColor alloc]initWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#import "MonthButton.h"
#import "UIView+Extension.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *nationalTableView;
    NSArray *nationalArray;
    NSInteger selectButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"National" ofType:@"plist"];
    nationalArray = [NSArray arrayWithContentsOfFile:path];
    
    selectButton = 1000;//初次加载页面时，没有选中的页面
    
    nationalTableView = [[UITableView alloc]init];
    nationalTableView.frame = CGRectMake(0, 64, KscreenWidth, KscreenHeight-64);
    nationalTableView.delegate = self;
    nationalTableView.dataSource = self;
    [self.view addSubview:nationalTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nationalArray.count/3*55;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,KscreenWidth, 30)];
    sectionView.backgroundColor = KRGBA(244, 244, 244, 1);
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:sectionView.frame];
    titleLabel.text = @"请选择民族";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [sectionView addSubview:titleLabel];
    
    return sectionView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    // 通过indexPath创建cell实例 每一个cell都是单独的
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    cell.selectionStyle = UITableViewCellStyleDefault;
    cell.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i<nationalArray.count; i++) {
        MonthButton *monthButton = [[MonthButton alloc] init];
        if (selectButton == i) {
            monthButton.backgroundColor = KRGBA(0, 125, 245, 1);
        }else{
            monthButton.backgroundColor = KRGBA(147, 124, 235, 1);
        }
        [cell addSubview:monthButton];
        
        monthButton.tag = i;
        [monthButton buttonWithAboveLabelTitle:nationalArray[i]];
        int col = i % 3;
        monthButton.x = col * (monthButton.width + 10)+20;
        int row = i / 3;
        monthButton.y = row * (monthButton.height + 10);
        [monthButton addTarget:self action:@selector(clickMonth:) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}
- (void)clickMonth:(MonthButton *)sender{
    UIButton *button = (UIButton *)sender;
    NSLog(@"点击了 %@ ",sender.nationalLabel.text);
    selectButton = button.tag;
    [nationalTableView reloadData];
}

@end
