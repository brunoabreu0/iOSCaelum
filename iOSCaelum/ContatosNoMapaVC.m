//
//  ContatosNoMapaVC.m
//  iOSCaelum
//
//  Created by ios4729 on 08/07/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "ContatosNoMapaVC.h"
#import "ContatoDao.h"

@interface ContatosNoMapaVC ()

@end

@implementation ContatosNoMapaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    MKUserTrackingBarButtonItem *botaoLocalizacao = [[MKUserTrackingBarButtonItem alloc] initWithMapView:self.mapa];
    self.navigationItem.rightBarButtonItem = botaoLocalizacao;
    self.manager = [CLLocationManager new];
    [self.manager requestWhenInUseAuthorization];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (id) init {
    self = [super init];
    if (self) {
        UIImage *imagemTabItem = [UIImage imageNamed:@"mapa-contatos.png"];
        UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:imagemTabItem tag:0];
        self.tabBarItem = tabItem;
        self.navigationItem.title = @"Localização";
        ContatoDao *dao = [ContatoDao contatoDaoInstance];
        self.contatos = dao.contatos;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.mapa addAnnotations:self.contatos];
}
- (void)viewWillDisappear:(BOOL)animated {
    [self.mapa removeAnnotations:self.contatos];
}

@end
