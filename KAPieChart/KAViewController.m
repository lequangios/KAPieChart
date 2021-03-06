//
//  KAViewController.m
//  KAPieChart
//
//  Created by Kenneth Parker Ackerson on 11/17/13.
//  Copyright (c) 2013 Kenneth Parker Ackerson. All rights reserved.
//

#import "KAViewController.h"
#import "KAPieChart.h"
@interface KAViewController (){
    KAPieChart * pieChart;
}

@end

@implementation KAViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor lightGrayColor];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:11], NSForegroundColorAttributeName: [UIColor blackColor]};
    
    NSArray * slices = @[
                         // can also use KASliceMake() to create a slice
                         [KAPieChartSlice sliceWithColor:[UIColor blueColor] andValue:0.1 andDoesPopOut:NO amountToPopOut:0 withTitle:nil andAttributes:attributes], // ***pass nil for NO title
                         [KAPieChartSlice sliceWithColor:[UIColor greenColor] andValue:0.1 andDoesPopOut:NO amountToPopOut:0 withTitle:@"Hello\nWorld!" andAttributes:attributes],
                         [KAPieChartSlice sliceWithColor:[UIColor cyanColor] andValue:0.1 andDoesPopOut:NO amountToPopOut:0 withTitle:@"Bye!" andAttributes:attributes],
                         [KAPieChartSlice sliceWithColor:[UIColor yellowColor] andValue:0.1 andDoesPopOut:NO amountToPopOut:0 withTitle:@"Yellow?" andAttributes:attributes],
                         [KAPieChartSlice sliceWithColor:[UIColor orangeColor] andValue:0.1 andDoesPopOut:NO amountToPopOut:0 withTitle:@"Mercury" andAttributes:attributes],
                         [KAPieChartSlice sliceWithColor:[UIColor redColor] andValue:0.2 andDoesPopOut:YES amountToPopOut:5 withTitle:@"Big slice!" andAttributes:attributes]
                         
                         ];
    
    pieChart = [[KAPieChart alloc] initWithSize:260 withSlices:slices];
    
    [pieChart setTapCallback:^(KAPieChart *chart, KAPieChartSlice *slice) {
        NSLog(@"%@", slice);
    }];
    
    //[pieChart setIgnoresAllTitleLabelsAndDisplayPercentages:YES]; // shows percentages instead of title labels ***NEEDS textAttributes set on every slice that wants to display percentage***
    
    [self.view addSubview:pieChart];
    [pieChart setCenter:CGPointMake([[UIScreen mainScreen] bounds].size.width/2, [[UIScreen mainScreen] bounds].size.height/2)];
        
    
    [super viewDidLoad];
}

@end
