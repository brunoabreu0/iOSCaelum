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



@end
