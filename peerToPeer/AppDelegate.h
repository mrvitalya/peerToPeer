//
//  AppDelegate.h
//  peerToPeer
//
//  Created by v_stepanov on 17.06.15.
//  Copyright (c) 2015 v_stepanov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectionManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AppDelegate *appDelegate;
@property (strong, nonatomic) ConnectionManager *connectionManager;
@property (strong, nonatomic) NSMutableArray *connectedDeviceArray;


@end

