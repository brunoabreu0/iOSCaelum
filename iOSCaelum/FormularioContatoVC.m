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

- (void) pegaDadosDoFormulario {
    self.contato = [Contato new];
    self.contato.nome = self.campoNome.text;
    self.contato.telefone = self.campoTelefone.text;
    self.contato.email = self.campoEmail.text;
    self.contato.endereco = self.campoEndereco.text;
    self.contato.site = self.campoSite.text;
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
    [self.navigationController popViewControllerAnimated:YES];
}

@end
