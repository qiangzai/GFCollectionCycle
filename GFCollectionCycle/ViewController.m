//
//  ViewController.m
//  GFCollectionCycle
//
//  Created by  lizhongqiang on 2017/3/22.
//  Copyright © 2017年  lizhongqiang. All rights reserved.
//

#import "ViewController.h"
#import "GFCycleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GFCycleView *cycleView = [[GFCycleView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    [self.view addSubview:cycleView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
