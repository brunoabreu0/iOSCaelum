//
//  ViewController.m
//  iOSCaelum
//
//  Created by Bruno Abreu on 7/1/15.
//  Copyright (c) 2015 Caelum. All rights reserved.
//

#import "FormularioContatoVC.h"
#import "Contato.h"

@interface FormularioContatoVC ()

@end

@implementation FormularioContatoVC

- (void)viewDidLoad {
    if(self.contato) {
        self.navigationItem.title = @"Alterar";
        UIBarButtonItem *confirmar = [[UIBarButtonItem alloc] initWithTitle:@"Confirmar" style:UIBarButtonItemStylePlain target:self action:@selector(atualizaContato)];
        self.navigationItem.rightBarButtonItem = confirmar;
        self.campoNome.text = self.contato.nome;
        self.campoTelefone.text = self.contato.telefone;
        self.campoEmail.text = self.contato.email;
        self.campoEndereco.text = self.contato.endereco;
        self.campoSite.text = self.contato.site;
        self.campoLatitude.text = [self.contato.latitude stringValue];
        self.campoLongitude.text = [self.contato.longitude stringValue];
        
        if (self.contato.foto) {
            [self.campoFoto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pegaDadosDoFormulario {
    if(!self.contato) {
        self.contato = [Contato new];
    }
    
    if ([self.campoFoto backgroundImageForState:UIControlStateNormal]) {
        self.contato.foto = [self.campoFoto backgroundImageForState:UIControlStateNormal];
    }
    
    self.contato.nome = self.campoNome.text;
    self.contato.telefone = self.campoTelefone.text;
    self.contato.email = self.campoEmail.text;
    self.contato.endereco = self.campoEndereco.text;
    self.contato.site = self.campoSite.text;
    self.contato.latitude = [NSNumber numberWithFloat: [self.campoLatitude.text floatValue]];
    self.contato.longitude = [NSNumber numberWithFloat: [self.campoLongitude.text floatValue]];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.dao = [ContatoDao contatoDaoInstance];
        self.navigationItem.title = @"Cadastro";
        UIBarButtonItem *adiciona = [[UIBarButtonItem alloc] initWithTitle:@"Adiciona" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = adiciona;
    }
    return self;
}

- (void) criaContato {
    [self pegaDadosDoFormulario];
    [self.dao adicionaContato: self.contato];
    if(self.delegate) {
        [self.delegate contatoAdicionado:self.contato];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) atualizaContato {
    [self pegaDadosDoFormulario];
    if(self.delegate) {
        [self.delegate contatoAtualizado:self.contato];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selecionaFoto:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Escolha a foto do contato" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Tirar foto",@"Escolher da biblioteca", nil];
        [sheet showInView:self.view];
    } else {
        UIImagePickerController *picker = [UIImagePickerController new];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *imagemSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.campoFoto setBackgroundImage:imagemSelecionada forState:UIControlStateNormal];
    [self.campoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    UIImagePickerController *picker = [UIImagePickerController new];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    switch (buttonIndex) {
        case 0:
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 1:
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            return;
    }
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)buscarCoordenadas:(UIButton *)botao {
    [self.loading startAnimating];
    botao.hidden = YES;
    CLGeocoder *geocoder = [CLGeocoder new];
    [geocoder geocodeAddressString:self.campoEndereco.text completionHandler:^(NSArray *resultados, NSError *error) {
        if (error == nil && [resultados count] > 0) {
            CLPlacemark *resultado = resultados[0];
            CLLocationCoordinate2D coordenada = resultado.location.coordinate;
            self.campoLatitude.text = [NSString stringWithFormat:@"%f",coordenada.latitude];
            self.campoLongitude.text = [NSString stringWithFormat:@"%f",coordenada.longitude];
        } else {
            NSLog(@"Erro: %@ Resultados: %@", error, resultados);
        }
        [self.loading stopAnimating];
        botao.hidden = NO;
    }];
}


@end
