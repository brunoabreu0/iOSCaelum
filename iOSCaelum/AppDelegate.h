//
//  AppDelegate.h
//  iOSCaelum
//
//  Created by Bruno Abreu on 7/1/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ContatoDao *dao;

@end

