//
//  MainViewController.m
//  peerToPeer
//
//  Created by v_stepanov on 17.06.15.
//  Copyright (c) 2015 v_stepanov. All rights reserved.
//

#import "MainViewController.h"
#import "BrowseTableViewCell.h"
#import "MainTableViewCell.h"
#import "AppDelegate.h"

static NSString *kBrowseTableViewCell = @"BrowseTableViewCell";
static NSString *kMainTableViewCell = @"MainTableViewCell";


@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *connectedDeviceTableView;
@property (nonatomic, strong) AppDelegate *appDelegate;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.connectedDeviceTableView registerNib:[UINib nibWithNibName:kBrowseTableViewCell bundle:nil] forCellReuseIdentifier:kBrowseTableViewCell];
    [self.connectedDeviceTableView registerNib:[UINib nibWithNibName:kMainTableViewCell bundle:nil] forCellReuseIdentifier:kMainTableViewCell];


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    if (self.appDelegate.connectedDeviceArray.count) {
        MainTableViewCell *mainCell = (MainTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kMainTableViewCell forIndexPath:indexPath];
        cell = mainCell;
    } else {
        BrowseTableViewCell *browseCell = (BrowseTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kBrowseTableViewCell forIndexPath:indexPath];
        cell = browseCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appDelegate.connectedDeviceArray.count + 1;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
