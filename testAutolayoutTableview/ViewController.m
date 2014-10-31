//
//  ViewController.m
//  testAutolayoutTableview
//
//  Created by iceesj on 14/10/31.
//  Copyright (c) 2014年 iceesj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
}

@property (nonatomic ,weak) IBOutlet UITableView *csjTableView;
@property (nonatomic ,strong) VCTableViewCell *cutsomCell;
@property (nonatomic, strong) NSMutableArray *labelOneArray;
@property (nonatomic, strong) NSMutableArray *labelTwoArray;
@property (strong, nonatomic) VCTableViewCell *customCell;

@end

@implementation ViewController

#pragma mark - life
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.csjTableView.delegate = self;
    self.csjTableView.dataSource = self;
    
//    _labelTwoArray = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    _labelOneArray = [NSMutableArray arrayWithArray:@[@"小明",@"小张",@"小懒"]];
//    for (int i=0;i<100;i++){
//        [_labelTwoArray addObjectsFromArray:[UIFont familyNames]];
//    }
//    NSLog(@"_labelTwoArray = %@",_labelTwoArray);
    _labelTwoArray = [NSMutableArray arrayWithArray:@[@"当女朋友翻完你手机，叫你全名的时候，记住，什么都不要管，跑，赶紧跑，千万不要回头。",@"女：老公，我吃相丑不？ 男：不丑。 女：我睡相丑不？ 男：不丑。 女：那我啥丑？ 男：面相",@"那天我坐在公交车的座位上，后来上来了很多人，非常拥挤。有个胸非常大的妹子挤到了我面前，接着她那大胸就在我脸上蹭了整整一路。当时我就有个邪恶的想法，我要是一男的该有多好啊…"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TalbeView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _labelTwoArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VCTableViewCell *cell = [self.csjTableView dequeueReusableCellWithIdentifier:@"VCCell"];
    NSInteger labelOneInde = indexPath.row % [_labelOneArray count];
    cell.labelOne.text = _labelOneArray[labelOneInde];
    cell.labelTwo.text = _labelTwoArray[indexPath.row];
//    NSInteger labelTwoIndex = indexPath.row % [_labelTwoArray count];
//    cell.labelTwo.text = _labelTwoArray[labelTwoIndex];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Calculate a height based on a cell
    if(!self.customCell) {
        self.customCell = [self.csjTableView dequeueReusableCellWithIdentifier:@"VCCell"];
    }
    // Configure the cell
    NSInteger labelOneInde = indexPath.row % [_labelOneArray count];
    self.customCell.labelOne.text = _labelOneArray[labelOneInde];
    self.customCell.labelTwo.text = _labelTwoArray[indexPath.row];
//    NSInteger labelTwoIndex = indexPath.row % [_labelTwoArray count];
//    self.customCell.labelTwo.text = _labelTwoArray[labelTwoIndex];
//    self.customCell.labelTwo.font = [UIFont fontWithName:<#(NSString *)#> size:<#(CGFloat)#>]
    
    // Layout the cell
    // Recalculate the receiver’s layout, if required.
    [self.customCell layoutIfNeeded];
    // Get the height for the cell
    CGFloat height = [self.customCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    // Padding of 1 point (cell separator)
    CGFloat separatorHeight = 1;
    return height + separatorHeight;
    
    //test
//    return height;
//    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击第 %ld 行",indexPath.row+1);
}

@end
