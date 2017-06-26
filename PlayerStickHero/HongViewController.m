//
//  HongViewController.m
//  RedEnvelopes
//
//  Created by 安风 on 2017/5/30.
//  Copyright © 2017年 曾富田. All rights reserved.
//

#import "HongViewController.h"
#import "Masonry.h"
#import "YYCategories.h"
#import "MoviePlayerViewController.h"

@interface HongViewController (){

    NSMutableArray *tableAry;
}

@end

@implementation HongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatTableData];

    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = [UIColor colorWithHexString:@"#FF4040"];
    [self.view addSubview:topView];
    
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    
    
    UILabel *titleLabel = [[UILabel alloc]init];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setText:@"老司机专区"];
    [titleLabel setFont:[UIFont systemFontOfSize:15]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [topView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topView);
        make.bottom.equalTo(topView);
        make.height.mas_equalTo(44);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor colorWithHexString:@"#FF4040"];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backHome) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.left.equalTo(topView).offset(13);
        make.bottom.equalTo(topView.mas_bottom);
    }];
    
    
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsSelection=YES;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#efeff5"];
    [self.tableView registerClass:[HongTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
    }];
}
-(void)backHome{

    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
-(void)creatTableData{

    tableAry = [NSMutableArray array];
    
    NSArray *name =  [NSArray arrayWithObjects:@"傲似公主",@"う呸侢裗蒗",@"重拾记忆",@"橙熟 ˇ柚稚",@"少女与猫",@"影子",@"A…傻瓜",@"抱抱啊霖",@"℡此女子の邪魅",@"水晶～沬兮",@"你不配",@"怪我喽", nil];
    
    NSArray *money =  [NSArray arrayWithObjects:@"133",@"200",@"443",@"27",@"66",@"88",@"111",@"199",@"9",@"100",@"200",@"55", nil];
    
    for (int i = 0; i< 12 ; i++) {
        HongModel *model = [[HongModel alloc]init];
        model.name = [name objectAtIndex:i];
        model.money = [money objectAtIndex:i];
        [tableAry addObject:model];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return tableAry.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HongTableViewCell *cell = (HongTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    HongModel *dd = [tableAry objectAtIndex:indexPath.row];
    [cell setData:dd];
//    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    AppLocaVideoModel *model = [videoArray objectAtIndex:indexPath.row];
//    MoviePlayerViewController *movie = [[MoviePlayerViewController alloc]init];
//    movie.videoURL                   = [NSURL fileURLWithPath:model.path isDirectory:YES];
//    movie.titleSring = model.title;
//    movie.isShowCollect = NO;
//    [self.navigationController pushViewController:movie animated:NO];
}
@end
