//
//  ViewController.m
//  ZX_all
//
//  Created by 赵祥 on 2018/8/20.
//  Copyright © 2018年 赵祥. All rights reserved.
//

#import "ViewController.h"
#import "editorViewController.h"
#import "testViewController.h"
#import "AppTestViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic)NSMutableArray *dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@"测试界面",@"富文本编辑器",@"性能检测", nil];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    //cell选中效果
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];

    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}

//选中时 调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  //  NSLog(@"选中didSelectRowAtIndexPath row = %ld", indexPath.row);
    
    switch (indexPath.row) {
        //测试界面跳转
        case 0:
            {
                testViewController *testVC = [[testViewController alloc]init];
                [self.navigationController pushViewController:testVC animated:YES];
            }
            break;
        //富文本跳转
        case 1:
            {
                editorViewController *eVC = [[editorViewController alloc]init];
                [self.navigationController pushViewController:eVC animated:YES];
            }
            break;
            //富文本跳转
        case 2:
            {
                AppTestViewController *appTestVC = [[AppTestViewController alloc]init];
                [self.navigationController pushViewController:appTestVC animated:YES];
            }
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
