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
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) pegaDadosDoFormulario {
    Contato *contato = [Contato new];
    contato.nome = self.campoNome.text;
    contato.telefone = self.campoTelefone.text;
    contato.email = self.campoEmail.text;
    contato.endereco = self.campoEndereco.text;
    contato.site = self.campoSite.text;
    [self.dao adicionaContato:contato];
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.dao = [ContatoDao contatoDaoInstance];
        self.navigationItem.title = @"Cadastro";
    }
    return self;
}

@end
