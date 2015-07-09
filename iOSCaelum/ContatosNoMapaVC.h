//
//  ContatosNoMapaVC.h
//  iOSCaelum
//
//  Created by ios4729 on 08/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Contato.h"

@interface ContatosNoMapaVC : UIViewController <MKMapViewDelegate>

@property (weak,nonatomic) IBOutlet MKMapView *mapa;
@property CLLocationManager *manager;
@property (nonatomic, weak) NSMutableArray *contatos;

@end
