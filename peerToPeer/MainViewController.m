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
#import "PeersModel.h"

//static NSString *kBrowseTableViewCell = @"BrowseTableViewCell";
static NSString *kMainTableViewCell = @"MainTableViewCell";


@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, MCBrowserViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *connectedDeviceTableView;
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (strong, nonatomic) NSMutableArray *connectedDeviceArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.connectedDeviceArray = [NSMutableArray new];
    // Do any additional setup after loading the view from its nib.
//    [self.connectedDeviceTableView registerNib:[UINib nibWithNibName:kBrowseTableViewCell bundle:nil] forCellReuseIdentifier:kBrowseTableViewCell];
    [self.connectedDeviceTableView registerNib:[UINib nibWithNibName:kMainTableViewCell bundle:nil] forCellReuseIdentifier:kMainTableViewCell];
  
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(peerDidChangeStateWithNotification:)
                                                 name:@"MCDidChangeStateNotification"
                                               object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[self.appDelegate connectionManager] setupPeerAndSessionWithDisplayName:[UIDevice currentDevice].name];
    [[self.appDelegate connectionManager] advertiseSelf:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = nil;
    if (self.connectedDeviceArray.count) {
        MainTableViewCell *mainCell = (MainTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kMainTableViewCell forIndexPath:indexPath];
        PeersModel *model = [self.connectedDeviceArray objectAtIndex:indexPath.row];
        mainCell.nameLabel.text = model.peerName;
        cell = mainCell;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.connectedDeviceArray.count;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)peerDidChangeStateWithNotification:(NSNotification *)notification
{
    PeersModel *model = [[PeersModel alloc] initWithDictionary:notification.userInfo];
    if ((MCSessionState)model.state == MCSessionStateConnected) {
        [self.connectedDeviceArray addObject:model];
        [self.connectedDeviceTableView reloadData];
    }
}

- (IBAction)browseButtonClick:(id)sender
{
    [[self.appDelegate connectionManager] setupMCBrowser];
    [[[self.appDelegate connectionManager] browser] setDelegate:self];
    [self presentViewController:[[self.appDelegate connectionManager] browser] animated:YES completion:nil];
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];    
}
@end
