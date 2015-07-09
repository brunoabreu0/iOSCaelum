//
//  ViewController.h
//  iOSCaelum
//
//  Created by Bruno Abreu on 7/1/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contato.h"
#import "ContatoDao.h"
#import <CoreLocation/CoreLocation.h>

@protocol FormularioContatoVCDelegate <NSObject>

- (void) contatoAtualizado:(Contato *)contato;
- (void) contatoAdicionado:(Contato *)contato;

@end

@interface FormularioContatoVC : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>

@property IBOutlet UITextField *campoNome;
@property IBOutlet UITextField *campoTelefone;
@property IBOutlet UITextField *campoEmail;
@property IBOutlet UITextField *campoEndereco;
@property IBOutlet UITextField *campoSite;
@property IBOutlet UIButton *campoFoto;
@property IBOutlet UITextField *campoLatitude;
@property IBOutlet UITextField *campoLongitude;
@property IBOutlet UIActivityIndicatorView *loading;

@property (strong) ContatoDao *dao;
@property (strong) Contato *contato;

@property (weak) id<FormularioContatoVCDelegate> delegate;

- (IBAction)selecionaFoto:(id)sender;
- (IBAction)buscarCoordenadas:(UIButton *)botao;

@end

