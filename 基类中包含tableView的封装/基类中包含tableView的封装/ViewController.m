//
//  ViewController.m
//  基类中包含tableView的封装
//
//  Created by 王开 on 2018/7/1.
//  Copyright © 2018年 com.wk. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import "secondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view, typically from a nib.
    UIButton *FIREST = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 50)];
    [FIREST addTarget:self action:@selector(TOFIREST) forControlEvents:UIControlEventTouchUpInside];
    FIREST.backgroundColor = [UIColor yellowColor];
    FIREST.titleLabel.text = @"FIRST";
    FIREST.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:FIREST];
    
    UIButton *SECOND = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 50)];
    [SECOND addTarget:self action:@selector(TOSECOND) forControlEvents:UIControlEventTouchUpInside];
    SECOND.backgroundColor = [UIColor yellowColor];
    SECOND.titleLabel.text = @"SECOND";
    SECOND.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:SECOND];
    
}
-(void)TOFIREST{
    [self presentViewController:[[firstViewController alloc] init] animated:YES completion:NO];
}
-(void)TOSECOND{
    [self presentViewController:[[secondViewController alloc] init] animated:YES completion:NO];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
