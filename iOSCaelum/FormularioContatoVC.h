//
//  ViewController.h
//  iOSCaelum
//
//  Created by Bruno Abreu on 7/1/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContatoDao.h"

@interface FormularioContatoVC : UIViewController

@property IBOutlet UITextField *campoNome;
@property IBOutlet UITextField *campoTelefone;
@property IBOutlet UITextField *campoEmail;
@property IBOutlet UITextField *campoEndereco;
@property IBOutlet UITextField *campoSite;

@property (strong) ContatoDao *dao;
@property (strong) Contato *contato;

@end

