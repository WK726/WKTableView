//
//  baseViewController.m
//  基类中包含tableView的封装
//
//  Created by 王开 on 2018/7/1.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import "baseViewController.h"

@interface baseViewController ()
@property (nonatomic, strong) NSArray *models;
@property (nonatomic, copy) LoadCellType loadCell;
@property (nonatomic, copy) LoadCellHType loadCellH;
@property (nonatomic, copy) BindType bind;

@end

@implementation baseViewController
#pragma mark - 接口
-(void)setupDataSource:(NSArray *)models loadCellBlock:(UITableViewCell *(^)(UITableView *table,NSIndexPath *indexPath))loadCellBlock loadCellHeight:(NSInteger (^)(id model))loadCellHeightBlock bindBlock:(void(^)(id model,UITableViewCell *cell))bindBlock{
    
    self.loadCell = loadCellBlock;
    self.loadCellH = loadCellHeightBlock;
    self.bind = bindBlock;
    
    
    self.models = models;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI
{
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor lightGrayColor];
}

- (void)setModels:(NSArray *)models
{
    _models = models;
    [self.tableView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return self.loadCell(tableView,indexPath);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.models[indexPath.row];
    self.bind(model, cell);
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id model = self.models[indexPath.row];
    return self.loadCellH(model);
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
