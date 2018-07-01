//
//  baseViewController.h
//  基类中包含tableView的封装
//
//  Created by 王开 on 2018/7/1.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef UITableViewCell *(^LoadCellType)(UITableView *table,NSIndexPath *indexPath);
typedef NSInteger (^LoadCellHType)(id model);
typedef void (^BindType)(id model,UITableViewCell *cell);

@interface baseViewController : UITableViewController

//自控制器关心的东西
//model cell cellHeight model-》cell；
-(void)setupDataSource:(NSArray *)models loadCellBlock:(LoadCellType)loadCellBlock loadCellHeight:(LoadCellHType)loadCellHeightBlock bindBlock:(BindType)bindBlock;
@end
