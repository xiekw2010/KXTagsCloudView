//
//  KXMainViewController.m
//  TagsCloudView
//
//  Created by Kaiwei.Xie on 4/17/13.
//  Copyright (c) 2013 Kaiwei.Xie. All rights reserved.
//

#import "KXMainViewController.h"
#import "KXTagsCloudView.h"

@interface KXMainViewController ()
{
    NSInteger _startCount;
}
@property (nonatomic, strong) KXTagsCloudView *cloudView;
@property (nonatomic, strong) NSMutableArray *cloudTagsArray;
@end

@implementation KXMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.cloudTagsArray = [NSMutableArray arrayWithCapacity:50];
    for (int i = 99; i < 150; i ++) {
        NSString *s = [NSString stringWithFormat:@"dubo%d",i];
        [self.cloudTagsArray addObject:s];
    }
    self.cloudView = [[KXTagsCloudView alloc] initWithFrame:self.view.bounds withTagsArray:self.cloudTagsArray];
    self.cloudView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.cloudView];
    
    UIButton *refreshButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [refreshButton setTitle:@"refresh" forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(refreshTapped:) forControlEvents:UIControlEventTouchUpInside];
    refreshButton.frame = CGRectMake(self.view.bounds.size.width - 80, 30, 80, 30);
    [self.view addSubview:refreshButton];
    
    [self registerCloudViewCallBack];
}

- (void)refreshTapped:(id)sender {
    [self.cloudTagsArray removeAllObjects];
    NSInteger step = 50;
    for (int i = _startCount; i < _startCount + step; i ++) {
        NSString *s = [NSString stringWithFormat:@"dubo%d",i];
        [self.cloudTagsArray addObject:s];
    }
    _startCount += 50;
    [self.cloudView customTheLayoutWithArray:self.cloudTagsArray];
}

- (void)registerCloudViewCallBack {
    self.cloudView.buttonTappedBlock = ^ (NSString *title) {
        NSLog(@"the tapped title is %@",title);
    };
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
